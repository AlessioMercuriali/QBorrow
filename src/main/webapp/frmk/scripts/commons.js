var searching = false, innerEditRow = -1, inlinePrevVal = null;

function parentDoResize(){ // per l'integrazione nel portale
	try{ parent.uniqueDoResize();}catch(e){};
}
function getViewportHeight(){
	return parseInt($(window).height());
}
$(function(){initCollapse('');});

function show(idRow) {
	$("#"+idRow).toggle();
}

function setFocus(inputId) {
	$('#'+inputId).focus();
}

function toggleRow(idRow, idToggleBtn){
	$('#'+idToggleBtn).toggleClass('glyphicon-plus').toggleClass('glyphicon-minus');
	$('#'+idRow).toggleClass('hidden');
	parentDoResize();
}

function toggleSingleRow(idRow,idToggleBtn){
	var node = $('#'+idRow), btn = $('#'+idToggleBtn);
	if(node.hasClass('hidden')){
		node.siblings('.togglable').addClass('hidden');
		node.removeClass('hidden');
		$('.toggle-btn').removeClass('glyphicon-minus').addClass('glyphicon-plus');
		btn.removeClass('glyphicon-plus').addClass('glyphicon-minus');
	}else{
		node.addClass('hidden');
		btn.removeClass('glyphicon-minus').addClass('glyphicon-plus');
	}
}

function toggleInnerEdit(idRow,url,idToggleBtn){
	$('#innerLoader'+idRow).removeClass('hidden');
	$('#innerEdit'+idRow).addClass('hidden').empty();
	if($('#'+idToggleBtn).hasClass('glyphicon-minus')){
		innerEditRow = idRow;
		console.log(idRow+" @ "+ url + "\n"+ idToggleBtn);
		qamCall(url,[],manageInnerEdit,'html','get');
	}else innerEditRow = -1;
}

function manageInnerEdit(data){
	if(innerEditRow == -1){
		console.log('error');
		return;
	}
	$('#innerLoader'+innerEditRow).addClass('hidden');
	$('#innerEdit'+innerEditRow).html(data).removeClass('hidden');
}

/** INLINE EDIT */
function inlineEdit(elem,inputId){
	$(elem).addClass('hidden');
	$('#'+inputId).removeClass('hidden').focus();
	inlinePrevVal = $('#'+inputId).val();
}
function execInlineEdit(input,elemId,url,loaderId){
	input = $(input);
	input.addClass('hidden');
	if(input.val() != '' && input.val() != inlinePrevVal){
		$('#'+elemId).text(input.prop('tagName').toLowerCase() == 'input' ? input.val() : input.find('option:selected').text());
		$('#'+loaderId).removeClass('hidden');
		var params = [{name:input.attr('name'),value:input.val()},
			{name:'loaderId',value:loaderId}];
		qamCall(url,params,manageInlineEdit,'json','post');
	}
	$('#'+elemId).removeClass('hidden');
}

function manageInlineEdit(data){
	if(data.success){
		$('#'+data.loader).addClass('hidden');
	}
}

function initCollapse(suffix){
	$('#collapseOne'+suffix).on('show.bs.collapse',{suffix:suffix},filterSummaryClear).on('hide.bs.collapse',{suffix:suffix},filterSummaryPopulate)
	.on('shown.bs.collapse',function(){
		var icon = $('#collapseIcon');
		if(icon.hasClass('glyphicon-plus')) icon.removeClass('glyphicon-plus');
		icon.addClass('glyphicon-minus');
	}).on('hidden.bs.collapse',function(){
		var icon = $('#collapseIcon');
		if(icon.hasClass('glyphicon-minus')) icon.removeClass('glyphicon-minus');
		icon.addClass('glyphicon-plus');
	});;
}

/** MODAL */
modal = {
	id:'#myModal',
	content:'.modal-body',
	display: function(){
		$(modal.id).modal({backdrop:'static'}).one('hidden.bs.modal', function(){
			$(modal.content).empty();
			parentDoResize();
		}).one('shown.bs.modal', function(){
			modal.fixTop();
		});
	},
	clearNload: function(){
		$(modal.content).empty();
		modal.load(true);
	},
	closeNsearch: function(){
		modal.disable();
		$(modal.id).one('hidden.bs.modal',search);
	},
	disable: function(){
		$(modal.id).modal('hide');
	},
	init: function(title, url){
		//setto titolo del modale
		$('#myModalLabel').html(title);
		if(url){
			modal.load(true);
			qamCall(url,[],modal.fill,'html','get');
		}
	},
	load: function(loading){
		if (loading) $('.modal-footer').removeClass('hidden');
		else $('.modal-footer').addClass('hidden');
	},
	fill: function(data){
		modal.load(false);
		$(modal.content).removeClass('hidden').html(data).css('max-height',(getViewportHeight()-120)+'px');
		parentDoResize();
	},
	alert: function(title,message,type){
		modal.init(title);
		var body = $('<div class="row"/>'), col = $('<div class="col-xs-12 text-center"/>'),
			p = $('<p class="alert"/>').html(message),
			b = $('<button type="button" class="btn btn-lg" data-dismiss="modal"/>'),
			s = $('<span class="glyphicon"/>');
		switch(type){
		case 'danger': p.addClass('alert-danger'); s.addClass('glyphicon-remove-sign'); b.addClass('btn-danger'); break;
		case 'warning': p.addClass('alert-warning'); s.addClass('glyphicon-warning-sign'); b.addClass('btn-warning'); break;
		case 'success': p.addClass('alert-success'); s.addClass('glyphicon-ok-sign'); b.addClass('btn-success'); break;
		default: p.addClass('alert-info'); s.addClass('glyphicon-info-sign'); b.addClass('btn-info'); break;
		}
		p.prepend(s);
		b.append('<span class="glyphicon glyphicon-remove"/>');
		col.append(p,b); body.append(col);
		modal.display();
		modal.fill(body);
	},
	confirm: function(title,url){
		modal.init(title);
		var body = $('<div class="row"/>'), col = $('<div class="col-xs-12 text-center"/>'),
			bConf = $('<button type="button" class="btn btn-success btn-lg" style="margin-right:20px;"/>').click(function(){
			qamCall(url,[],null,'text','get');
			modal.closeNsearch();
		}).append('<span class="glyphicon glyphicon-ok"/>'),
			bNot = $('<button type="button" class="btn btn-danger btn-lg" data-dismiss="modal"/>').append('<span class="glyphicon glyphicon-remove"/>');
		col.append(bConf,bNot); body.append(col);
		modal.display();
		modal.fill(body);
	},
	isDisplayed: function(){
		return $(modal.id).hasClass('in');
	},
	fixTop: function(){
		try {
			var frame = null;
			$('iframe',parent.document).each(function(){
				if (this.contentWindow === window){
					frame = $(this);
					return false;
				}
			});
			if (frame){
				var r = frame.offset(), parentOffset = $('body',parent.document).scrollTop() || $('html',parent.document).scrollTop();
				if (parentOffset > r.top) {
					$(modal.id).css('top', parseInt(parentOffset-r.top));
					console.log('modal reposition');
				} else {
					$(modal.id).css({top: 0, position:'fixed', bottom:0});
				}
			}
		}catch(e){}
	},
};


/** SEARCH */

//popola la lista dei filtri applicati
function filterSummaryPopulate(event){
	filterSummaryClear(event); // inizia eliminando la lista precedente
	var filters = $('#searchForm'+event.data.suffix).find('.form-control,.radio-control,.checkbox-control');
	filters.each(function(){
		var el = $(this);
		if(el.attr('type') == 'hidden') return; // non visualizza gli hidden
		if(el.hasClass('radio-control') || el.hasClass('checkbox-control')){
			var type = el.hasClass('radio-control') ? 'radio' : 'checkbox';
			var label = $('label[for="'+el.attr('id')+'"]').text().replace('*', '');
			el.find('input[type="'+type+'"]:checked').each(function(){
				var ck = $(this), nrem = ck.data('default') || ck.prop('required');
				generateFilterButton(ck.val(),ck.attr('id'),label,'',event.data.suffix,nrem);
			});
			return;
		}
		var values = el.val();
		if($.type(values) == 'array'){//select2...
			values.forEach(function(v){
				var val = el.find('option:selected[value="'+v+'"]').text();
				// workaround per problemi a reperire la label con select2
				generateFilterButton(val, el.attr('id'),$('#'+el.attr('id')+'Lab').text(),v,event.data.suffix);
			});
		}else{
			var label, val, nrem = el.prop('required');
			if(values != ''  && el.prop('tagName').toLowerCase() == 'select') val = el.find('option:selected').text();
			else val = values;
			if(el.hasClass('select2-offscreen')) label = $('#'+el.attr('id')+'Lab').text();
			else label = $('label[for="'+el.attr('id')+'"]').text().replace('*', '');
			generateFilterButton(val, el.attr('id'),label,'',event.data.suffix,nrem);
		}
	});
	$('#filterSummaryDiv'+event.data.suffix).removeClass('hidden');
}

function filterSummaryClear(event){
	$('#filterSummaryDiv'+event.data.suffix).empty();
}

//crea dinamicamente il pulsante di rimozione del filtro
function generateFilterButton(value,inputId,label,option,suffix,notRemovable){
	if(value && value != ''){
		var buttonId = inputId+'Button'+option+suffix,disabled = eval('searching'+suffix) ? ' disabled' : '';
		if($('#'+buttonId).length > 0) return;
		var button = $('<button type="button"/>').attr('id',buttonId).addClass('btn btn-sm btn-primary marginTop '+disabled).text(label+': '+value);
		if(!notRemovable){
			button.on('click',{input:inputId,button:buttonId,val:option,suffix:suffix},deleteFilter).append('<span class="glyphicon glyphicon-remove"/>');
		}
		$('#filterSummaryDiv'+suffix).append(button);
	}
}

//elimina il filtro sia dalla visualizzazione compatta, sia il valore nel form e poi chiama la ricerca
function deleteFilter(event){
	$('#'+event.data.button).remove();
	var input = $('#'+event.data.input);
	if(input.hasClass('select2-multiple')){
		// select2 deve rimuovere sono uno dei filtri in caso di select multiple
		var values = input.select2('val');
		values.splice($.inArray(event.data.val, values),1);
		input.select2('val', values);
	}else if(input.attr('type') == 'radio' || input.attr('type') == 'checkbox'){
		input.prop('checked',false);
		var par = input.parents('.radio-control,.checkbox-control');
		if(par.length > 0) radioDefaultFilter(par,event.data.suffix);
	}else{input.val('');}
	eval('formSearch'+event.data.suffix+'()');
}
function radioDefaultFilter(radios,suffix){
	var label = $('label[for="'+radios.attr('id')+'"]').text().replace('*', '');
	var ck = radios.find('input[data-default="1"]').prop('checked',true);
	generateFilterButton(ck.val(),ck.attr('id'),label,'',suffix,true);
}