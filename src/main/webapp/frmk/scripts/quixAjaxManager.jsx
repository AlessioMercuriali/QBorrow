<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
function qamCall(url,params,callback,format,method,isFile){
	format = format.toLowerCase();
	qAM.send(url,params,callback,format,method,isFile);
}
if(typeof qAM != 'undefined'){
	console.log('ajax manager already init');
}else{
console.log('init qAM e qSM');
if (typeof FormData !== 'undefined') {
	FormData.prototype.push = function (obj) {
		this.append(obj.name, obj.value);
	}
}
/**
 * Ajax Manager
 */
qAM = {
	lock: false,
	callStack: [],
	normalizeUrl: function(url,params){
		var qsI = url.indexOf('?');
		if (qsI < 0) return url;
		var qs = url.substring(qsI+1);
		var match, search = /([^&=]+)=?([^&]*)/g;
		while(match = search.exec(qs)) params.push({name:match[1],value:match[2]});
		return url.substring(0,qsI);
	},
	send: function(url,params,callback,format,method,isFile){
		if (format == 'json' || format == 'json/html')
			params.push({name:'fRmKjSoN', value:true});
		url = this.normalizeUrl(url,params);
		var currentCall = {
			url: url,
			callback: callback,
			format: format,
			method: method,
			params: params
		};
		this.callStack.push(currentCall);
		if(this.lock) return;
		this.lock = true;
		var settings = {
			data: params,
			dataType: format == 'json/html' ? 'text': format,
			type : method,
			success: $.proxy(this.response,this)
		};
		if(isFile){
			settings.contentType = false;
			settings.processData = false;
			settings.cache = false;
		}
		$.ajax(url,settings);
		qSM.startInactiveTimer();
	},
	response: function(data){
		var currentCall = this.callStack.shift(), ko = false;
		if (currentCall.format == 'json' || currentCall.format == 'json/html'){
			if(typeof data == 'object'){
				ko = data.frmkstatus == 'ko';
				if(ko) qamErrorModal(data);
			}
			else{
				try{
					var d = $.parseJSON(data);
					ko = d.frmkstatus == 'ko';
					if(ko) this.errorModal(d);
				}catch(e){}
			}
		}
		if(!ko && currentCall.callback != null){
			currentCall.callback(data);
			parentDoResize();
		}
		if(this.callStack.length == 0){
			this.lock = false;
			return;
		}
		var nextCall = this.callStack[0];
		settings = {
			data: nextCall.params,
			dataType: nextCall.format == 'json/html'? 'text' : nextCall.format,
			type: nextCall.method,
			success: $.proxy(this.response,this)
		};
		$.ajax(nextCall.url,settings);
	},
	errorModal: function(data){
		$('.modal.in').modal('hide');//cerco modali aperte e le chiudo
		var errModal = $('<div class="modal modal-embedded fade" tabindex="-1" role="dialog" aria-labelledby="frmkErrModalLabel" aria-hidden="true"/>');
		var dialog = $('<div class="modal-dialog modal-lg"/>');
		var content = $('<div class="modal-content"/>'), header = $('<div class="modal-header alert alert-warning"/>');
		var h = $('<h4 class="modal-title" id="frmkErrModalLabel"/>').text(data.frmktitle), b = $('<div class="modal-body"/>');
		header.append(h); content.append(h,b); dialog.append(content); errModal.append(dialog);
		var al = $('<div class="alert text-center h5"/>'), sp = $('<span class="glyphicon"/>');
		al.append(sp).append('&nbsp;'+data.frmkmsg); b.append(al);
		switch(data.frmktype){
		case 0://security
			al.addClass('alert-danger'); sp.addClass('glyphicon-ban-circle');
			break;
		case 1://permission
			al.addClass('alert-active'); sp.addClass('glyphicon-ban-circle');
			break;
		case 2://lock
			al.addClass('alert-active'); sp.addClass('glyphicon-ban-circle');
			var info = $('<div class="alert alert-info"/>'), p = $('<p/>').text(data.user), ul = $('<ul/>');
			data.resource.forEach(function(res){
				if (res.name.indexOf('.') >= 0) res.name = res.name.slice(res.name.lastIndexOf('.')+1);
				var li = $('<li/>').text(+res.name+' '+res.key);
				ul.append(li);
			});
			info.append(p,ul);
			b.append(info);
			break;
		case 3://conflict
			if (data.resource.indexOf('.') >= 0) data.resource = data.resource.slice(data.resource.lastIndexOf('.')+1);
			al.addClass('alert-warning'); sp.addClass('glyphicon-warning-sign');
			var info = $('<div class="alert alert-info"/>').text(data.resource+' '+data.key+' <s:text name="ajax.json.msg.editConflictShow"/>');
			b.append(info);
			break;
		default://generic
			al.addClass('alert-danger'); sp.addClass('glyphicon-warning-sign');
		}
		var tracePane = $('<div class="panel-group" id="frmkTrace"/>');
		var panel = $('<div class="panel panel-warning"/>'), ph = $('<div class="panel-heading"/>');
		var pt = $('<div class="panel-title"/>'), aMail = $('<a id="errMail" class="btn btn-warning pull-left"/>').append(data.frmkmsgmail+'&nbsp;');
		var sp2 = $('<span class="glyphicon glyphicon-envelope"/>'); aMail.append(sp2);
		var aColl = a = $('<a class="pull-right" data-toggle="collapse" data-parent="#frmkTrace" href="#collapseTrace"/>').append(data.frmktracetitle+'&nbsp;');
		aColl.append($('<span class="caret"/>'));
		var coll = $('<div id="collapseTrace" class="panel-collapse collapse"/>'),
			pbody = $('<div class="panel-body"/>'); pre = $('<pre class="pre-scrollable"/>').text(data.frmktrace);
		pbody.append(pre); pt.append(aMail,aColl,'<div class="clearfix"/>'); ph.append(pt); panel.append(ph,pbody); tracePane.append(panel);
		b.append(tracePane).css('max-height',(getViewportHeight()-120)+'px');;
		var email = 'mailto:support@quix.it?subject=segnalazione%20errore&body='+encodeURIComponent(data.frmktrace).substring(0, 1500) +'...';//tanto è molto più lunga
		aMail.attr('href', email);
		$('.container,.container-fluid').append(errModal);
		errModal.on('hidden.bs.modal', function(){
			errModal.remove();
		});
		errModal.modal('show').on('show.bs.modal', function(){
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
						errModal.css({top: parseInt(parentOffset-r.top), position:'absolute', bottom:'auto'});
					} else {
						errModal.css({top: 0, position:'fixed', bottom:0});
					}
				}
			}catch(e){}
		}).on('shown.bs.modal',parentDoResize);
	}
};
/**
 * Session Manager
 */
qSM = {
	maxInactiveInterval: <%= request.getSession().getMaxInactiveInterval() %> - 120, // tolgo 2 minuti per sicurezza
	timer: undefined,
	startInactiveTimer: function(){
		if(this.timer) clearTimeout(this.timer)
		this.timer = setTimeout($.proxy(this.sessionExpired,this),this.maxInactiveInterval*1000);
	},
	sessionExpired: function(){
		$('.modal.in').modal('hide').on('hidden.bs.modal',this.showModal);
	},
	showModal: function(){
		modal.alert('<s:text name="sessionExpired.title"/>','<s:text name="sesssionExpired.message"/>','info');
		$(this).off('hidden.bs.modal',qSM.showModal);
	}
};
qSM.startInactiveTimer();
}
