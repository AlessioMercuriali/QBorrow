/*
 * Quartz CronExpression composer helper
 * 
 * TODO aggiungere il controllo per il valore 'L' per i giorni (mese e settimana)
 * TODO aggiungere il controllo per il valore '#' per il giorno della settimana
 * TODO aggiungere il controllo per il valore 'W' per il giorno del mese
 * Specifiche secondo la documentazione: http://quartz-scheduler.org/documentation/quartz-1.x/tutorials/crontrigger
 * @author Davide Setti
 * @year 2014
 */

+function ($) {
	'use strict';
	function createDelBtn(){return $('<button type="button" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-remove"></span></button>');}
	function createAddBtn(){return $('<button type="button" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-plus"></span></button>');}
	function createReplaceBtn(){return $('<button type="button" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-cog"></span></button>');}
	function createBtnDrop(clazz){return $('<button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">...</button>').addClass(clazz);}
	function createBtnGroup(){return $('<div class="btn-group"/>');}
	function createTabLink(href,text){return $('<li/>').append($('<a data-toggle="tab" role="tab"/>').attr('href','#'+href).text(text));}
	var CronExpr = function(el, opt){
		this.$el = $(el);
		this.months = opt.months;
		this.weekday = opt.weekdays;
		if(!this.$el.val()) this.$el.val(opt.value);
		this.href = [];
		this.createPickers(opt.periods,opt.incs,opt.interval,opt.label_every);
	};
	CronExpr.prototype.createPickers = function(periods,incs,interval,label){
		var tabList = $('<ul class="nav nav-tabs small" role="tab-list"/>'), tabPanes = $('<div class="tab-content"/>'), id = this.$el.attr('id');
		// SECONDS
		tabList.append(createTabLink(id+'Sec',periods[6]));
		tabPanes.append(this.createTimePicker(id+'Sec',incs[6], interval, label,false));
		this.href.push(id+'Sec');
		// MINUTES
		tabList.append(createTabLink(id+'Min',periods[5]));
		tabPanes.append(this.createTimePicker(id+'Min',incs[5], interval, label,true));
		this.href.push(id+'Min');
		// HOUR
		tabList.append(createTabLink(id+'Hour',periods[4]));
		tabPanes.append(this.createHourPicker(id+'Hour',incs[4], interval, label));
		this.href.push(id+'Hour');
		// DOM
		tabList.append(createTabLink(id+'DOM',periods[3]));
		tabPanes.append(this.createDOMPicker(id+'DOM',incs[3], interval, label));
		this.href.push(id+'DOM');
		// MONTH
		tabList.append(createTabLink(id+'Month',periods[1]));
		tabPanes.append(this.createMonthPicker(id+'Month',incs[1], interval, label));
		this.href.push(id+'Month');
		// DOW
		tabList.append(createTabLink(id+'DOW',periods[2]));
		tabPanes.append(this.createDOWPicker(id+'DOW',incs[2], interval, label));
		this.href.push(id+'DOW');
		// YEAR
		tabList.append(createTabLink(id+'Year',periods[0]).addClass('active'));
		tabPanes.append(this.createYearPicker(id+'Year',incs[0], interval, label));
		this.href.push(id+'Year');
		// final functions
		var that = this;
		tabList.children().click(function(e){
			e.preventDefault();
			if($(this).hasClass('active')) return;
			$(this).tab('show');
			that.clearVals();
			var a = $(this).children('a');
			$(a.attr('href')).find('.dropdown-toggle').html('...').css('border-color','');// ripulise i pulsanti di selezione
		});
		var inputG = $('<div class="input-group"/>'), pre = this.$el.siblings('label'), addon = $('<span class="input-group-addon"/>')
			.append($('<span class="glyphicon glyphicon-trash clickable"/>')).click({val:-1},$.proxy(this.clearExpr,this));
		this.$el.detach();
		inputG.append(this.$el,addon);
		pre.after(inputG,tabList,tabPanes);
	};
	CronExpr.prototype.createButonActionGroup = function(val){
		return createBtnGroup().append(createAddBtn().click({val:val},$.proxy(this.addExpr,this)),
			createReplaceBtn().click({val:val},$.proxy(this.setExpr,this)),
			createDelBtn().click({val:val},$.proxy(this.clearExpr,this)));
	};
	CronExpr.prototype.createTabPane = function(id,val){
		return $('<div class="tab-pane"/>').attr('id',id).append(this.createButonActionGroup(val));
	};
	CronExpr.prototype.createYearPicker = function(id,yearInc,interval,label){
		var tab = this.createTabPane(id, 6).addClass('active'), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-not-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(1970,2099,bDisp1,0));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(1970,2099,bDisp2,1));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,50,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,yearInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createMonthPicker = function(id,monthInc,interval,label){
		var tab = this.createTabPane(id,4), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(1,12,bDisp1,0,2));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(1,12,bDisp2,1,2));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,11,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,monthInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createDOWPicker = function(id,dowInc,interval,label){
		var tab = this.createTabPane(id,5), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(1,7,bDisp1,0,1));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(1,7,bDisp2,1,1));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,6,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,dowInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createDOMPicker = function(id,domInc,interval,label){
		var tab = this.createTabPane(id,3), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(1,31,bDisp1,0));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(1,31,bDisp2,1));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,30,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,domInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createHourPicker = function(id,hourInc,interval,label){
		var tab = this.createTabPane(id,2), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(0,23,bDisp1,0));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(0,23,bDisp2,1));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,23,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,hourInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createTimePicker = function(id,timeInc,interval,label,minSec){
		var tab = this.createTabPane(id,minSec?1:0), row = $('<p class="cron-picker"/>');
		var btnPick1 = createBtnGroup(), bDisp1 = createBtnDrop('pick-required');
		btnPick1.append(bDisp1,this.createBtnListWithRange(0,59,bDisp1,0));
		var btnPick2 = createBtnGroup(), bDisp2 = createBtnDrop('pick-not-required');
		btnPick2.append(bDisp2,this.createBtnListWithRange(0,59,bDisp2,1));
		var btnPick3 = createBtnGroup(), bDisp3 = createBtnDrop('pick-not-required');
		btnPick3.append(bDisp3,this.createBtnListWithRange(1,59,bDisp3,2));
		row.append(interval[0],btnPick1,interval[1],btnPick2,label,btnPick3,timeInc);
		tab.append(row);
		return tab;
	};
	CronExpr.prototype.createBtnListWithRange = function(start,end,display,type,special){
		var list = $('<ul class="dropdown-menu dropdown-scrollable" role="menu"/>'), fun;
		switch(type){
		case 0: fun = this.setBeginVal;break;
		case 1: fun = this.setEndVal;break;
		case 2: fun = this.setIncVal;break;
		}
		var a = $('<a href="#"/>').html('...').click({disp:display,dv:'...'},$.proxy(fun,this));
		list.append($('<li/>').append(a));
		for(var i = start; i <= end; ++i){
			a = $('<a href="#"/>');
			switch(special){
			case 1: a.html(this.weekday[i-1]).click({val:i,disp:display,dv:this.weekday[i-1]},$.proxy(fun,this)); break; // DOW
			case 2: a.html(this.months[i-1]).click({val:i,disp:display,dv:this.months[i-1]},$.proxy(fun,this)); break; // mesi
			default: a.html(i).click({val:i,disp:display,dv:i},$.proxy(fun,this)); break;
			}
			list.append($('<li/>').append(a));
		}
		return list;
	};
	CronExpr.prototype.clearExpr = function(ev){
		var v = this.$el.val().split(' ');
		switch(ev.data.val){
		case 0: case 1: case 2: case 4: v[ev.data.val] = '*'; break;
		case 3:
			v[3] = (v[5] == '?')? '*':'?'; break;
		case 5:
			v[5] = (v[3] == '?')? '*':'?'; break;
		case 6:
			if(v.length > 6) v.pop();
			break;
		default:
			this.$el.val('* * * * * ?');
			return;
		}
		this.clearVals();
		if(0 <= ev.data.val && ev.data.val <= 6){// ripulise i pulsanti di selezione
			$('#'+this.href[ev.data.val]).find('.dropdown-toggle').html('...').css('border-color','');
		}
		this.$el.val(v.join(' '));
	};
	CronExpr.prototype.calcVal = function(){
		var val = '';
		if(typeof this.beginVal !== 'undefined'){
			val += this.beginVal;
			if(this.endVal && this.endVal > this.beginVal) val += '-'+this.endVal;
			if(this.incVal) val += '/'+this.incVal;
		}
		return val;
	};
	CronExpr.prototype.clearVals = function(){
		this.beginVal = undefined;
		this.endVal = undefined;
		this.incVal = undefined;
	};
	/**
	 * Quartz non supporta bene gli incroci tra giorni del mese e giorni della settimana
	 * quindi se uno viene valorizzato l'altro deve essere '?'
	 */
	CronExpr.prototype.manageDay = function(v,val){
		if(val == 3){
			if(v[5] != '?') v[5] = '?';
		}else if(val == 5){
			if(v[3] != '?') v[3] = '?';
		}
	};
	CronExpr.prototype.setExpr = function(ev){
		var v = this.$el.val().split(' '), val = this.calcVal();
		if(val){
			v[ev.data.val] = val;
			this.manageDay(v,ev.data.val);
			this.$el.val(v.join(' '));
		}
	};
	CronExpr.prototype.addExpr = function(ev){
		var v = this.$el.val().split(' '), val = this.calcVal();
		if(val){
			if(!v[ev.data.val] || v[ev.data.val] == '*' || v[ev.data.val] == '?'){
				v[ev.data.val] = val;
				this.manageDay(v,ev.data.val);
			}
			else v[ev.data.val] += ','+val;
			this.$el.val(v.join(' '));
		}
	};
	CronExpr.prototype.setBeginVal = function(e){
		e.preventDefault();
		this.beginVal = e.data.val;
		var btn = e.data.disp.html(e.data.dv).css('border-color',this.beginVal ? CronExpr.COLORS.ok : '');
		btn.parent().siblings('.btn-group').find('button').each($.proxy(function(i,bt){
			//per ora prevedo che vi siano solo 3 picker, quindi 2 siblings (0 = end, 1 = inc)
			var $bt = $(bt);
			if(this.beginVal){
				if(i == 0){
					if(!this.endVal) $bt.css('border-color','');
					else if(this.endVal && this.endVal > this.beginVal) $bt.css('border-color', CronExpr.COLORS.ok);
					else $bt.css('border-color', CronExpr.COLORS.error);
				}
				if(i == 1) $bt.css('border-color',this.incVal ? CronExpr.COLORS.ok : '');
			} else {
				if(i == 0) $bt.css('border-color',this.endVal ? CronExpr.COLORS.error : '');
				if(i == 1) $bt.css('border-color',this.incVal ? CronExpr.COLORS.error : '');
			}
		},this));
	};
	CronExpr.prototype.setEndVal = function(e){
		e.preventDefault();
		this.endVal = e.data.val;
		var css = (this.beginVal && this.endVal > this.beginVal) ? CronExpr.COLORS.ok : CronExpr.COLORS.error;
		e.data.disp.html(e.data.dv).css('border-color',!this.endVal ? '' : css);
	};
	CronExpr.prototype.setIncVal = function(e){
		e.preventDefault();
		this.incVal = e.data.val;
		var css = this.beginVal ? CronExpr.COLORS.ok : CronExpr.COLORS.error;
		e.data.disp.html(e.data.dv).css('border-color',!this.incVal ? '' : css);
	};
	CronExpr.DEFAULTS = {
		months: 'Gennaio_Febbraio_Marzo_Aprile_Maggio_Giugno_Luglio_Agosto_Settembre_Ottobre_Novembre_Dicembre'.split('_'),
		weekdays: 'Domenica_Luned&igrave;_Marted&igrave;_Mercoled&igrave;_Gioved&igrave;_Venerd&igrave;_Sabato'.split('_'),
		periods: 'Anno_Mese_GdS_GdM_Ora_Min._Sec.'.split('_'),
		label_every: 'ogni',
		incs: 'anni_mesi_giorni_giorni_ore_minuti_secondi'.split('_'),
		interval: ['il/da','a'],
		value: '* * * * * ?',
	};
	CronExpr.COLORS = {ok:'#398439', error:'#ac2925'};
	CronExpr.SPEC = ['#','L','W'];
	$.fn.cronexpr = function (option) {
		return this.each(function () {
			var $this = $(this);
			if($this.prop('tagName').toLowerCase() != 'input') return;
			var opt = $.extend({}, CronExpr.DEFAULTS, typeof option == 'object' && option), data = $this.data('bs.cronexpr');

			if (!data) $this.data('bs.cronexpr', (data = new CronExpr(this, opt)));
		});
	};
}(jQuery);

