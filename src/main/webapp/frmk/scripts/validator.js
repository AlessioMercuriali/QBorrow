/*!
 * Original:
 * Validator v0.5.0 for Bootstrap 3, by @1000hz
 * Copyright 2014 Spiceworks, Inc.
 * Licensed under http://opensource.org/licenses/MIT
 * https://github.com/1000hz/bootstrap-validator
 *
 *
 * Modificato: al posto di .control-group usa ora .control-group
 * per la segnalazione degli errori, quindi i campi da validare
 * devono essere all'interno di un div.control-group
 */

+function ($, moment) {
	'use strict';

	function parseNumber(val){
		if(typeof val == 'number') return val
		var iD = val.lastIndexOf('.'), iC = val.lastIndexOf(','),
			dS = iC > iD ? ',' : '.', tS = iC > iD ? '.' : ','
		val = val.replace(tS,'').replace(dS,'.')
		return parseFloat(val)
	}
	// VALIDATOR CLASS DEFINITION
	// ==========================

	var Validator = function (element, options) {
		this.$element = $(element)
		this.options = options

		this.toggleSubmit()

		this.$element.on('input.bs.validator change.bs.validator focusout.bs.validator', $.proxy(this.validateInput, this))

		this.$element.find('[data-match]').each(function () {
			var $this = $(this)
			var target = $this.data('match')

			$(target).on('input.bs.validator', function (e) {
				$this.val() && $this.trigger('input')
			})
		})
	}

	Validator.DEFAULTS = {
		delay: 500,
		html: false,
		errors: {
			match: 'Does not match',
			minlength: 'Not long enough'
		}
	}

	Validator.VALIDATORS = {
		match: function ($el) {
			var target = $el.data('match')
			return !$el.val() || $el.val() === $(target).val()
		},
		minlength: function ($el) {
			var minlength = $el.data('minlength')
			return !$el.val() || $el.val().length >= minlength
		},
		date: function ($el) {
			if (typeof moment === 'undefined') {
				console.log('moment.js required')
				return false
			}
			var format = $el.data('date')
			return !$el.val() || moment($el.val(),format,true).isValid()
		},
		number: function ($el) {
			var re = /^\-?(\d|\.|\,)+$/g
			return !$el.val() || re.test($el.val())
		},
		precision: function($el) {
			var prec = $el.data('precision'), v = $el.val()
			if(!v) return true
			var m = v.match(/\d/g)
			return m && m.length <= prec
		},
		min: function ($el) {
			var min = $el.data('min'),v = $el.val()
			if(!v) return true
			min = parseNumber(min)
			v = parseNumber(v)
			return isNaN(v) || isNaN(min) || v > min
		},
		max: function ($el) {
			var max = $el.data('max'),v = $el.val()
			if(!v) return true
			max = parseNumber(max)
			v = parseNumber(v)
			return isNaN(v) || isNaN(max) || v < max
		},
		email: function ($el) {
			var re = new RegExp('^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$','i')
			return !$el.val() || re.test($el.val())
		},
		required: function ($el) {
			var el = $el[0]
			return el.type === 'checkbox' ? el.checked:
				el.type === 'radio' ? $('[name="' + el.name + '"]:checked').length : $.trim(el.value) !== ''
		},
	}

	Validator.prototype.validateInput = function (e) {
		var $el = $(e.target)
		var prevErrors = $el.data('bs.validator.errors')
		var errors

		if ($el.is('[type="radio"]')) $el = this.$element.find('input[name="' + $el.attr('name') + '"]')

		this.$element.trigger(e = $.Event('validate.bs.validator', {relatedTarget: $el[0]}))

		if (e.isDefaultPrevented()) return

		var self = this

		this.runValidators($el).done(function (errors) {
			$el.data('bs.validator.errors', errors)

			errors.length ? self.showErrors($el) : self.clearErrors($el)

			if (!prevErrors || errors.toString() !== prevErrors.toString()) {
				e = errors.length
					? $.Event('invalid.bs.validator', {relatedTarget: $el[0], detail: errors})
					: $.Event('valid.bs.validator', {relatedTarget: $el[0], detail: prevErrors})

				self.$element.trigger(e)
			}

			self.toggleSubmit()

			self.$element.trigger($.Event('validated.bs.validator', {relatedTarget: $el[0]}))
		})
	}


	Validator.prototype.runValidators = function ($el) {
		var errors = []
		var deferred = $.Deferred()
		var options = this.options

		$el.data('bs.validator.deferred') && $el.data('bs.validator.deferred').reject()
		$el.data('bs.validator.deferred', deferred)

		function getErrorMessage(key) {
			return $el.data(key + '-error') || $el.data('error') || options.errors[key]
		}
		if ($el.is(':enabled')){
			$.each(Validator.VALIDATORS, $.proxy(function (key, validator) {
				if (($el.data(key) || (key == 'required' && $el.prop(key))) && !validator.call(this, $el)) {
					var error = getErrorMessage(key)
					!~errors.indexOf(error) && errors.push(error)
				}
			}, this))
	
			if (!errors.length && $el.val() && $el.data('remote')) {
				this.defer($el, function () {
					$.get($el.data('remote'), [$el.attr('name'), $el.val()].join('='))
						.fail(function (jqXHR, textStatus, error) { errors.push(getErrorMessage('remote') || error) })
						.always(function () { deferred.resolve(errors)})
				})
			} else deferred.resolve(errors)
		} else deferred.resolve(errors)

		return deferred.promise()
	}

	Validator.prototype.validate = function () {
		var delay = this.options.delay

		this.options.delay = 0
		this.$element.find(':input').trigger('input')
		this.options.delay = delay

		return this
	}

	Validator.prototype.showErrors = function ($el) {
		var method = this.options.html ? 'html' : 'text'

		this.defer($el, function () {
			var $group = $el.closest('.control-group')
			var $block = $group.find('.help-block.with-errors')
			var errors = $el.data('bs.validator.errors')

			if (!errors.length) return

			errors = $('<ul/>').addClass('list-unstyled').append($.map(errors, function (error) { return $('<li/>')[method](error) }))

			$block.data('bs.validator.originalContent') === undefined && $block.data('bs.validator.originalContent', $block.contents())
			$block.children().detach();
			$block.empty().append(errors)

			$group.addClass('has-error')
		})
	}

	Validator.prototype.clearErrors = function ($el) {
		var $group = $el.closest('.control-group')
		var $block = $group.find('.help-block.with-errors')
		if ($block.data('bs.validator.originalContent')) {
			$block.children('ul').remove()
			$block.append($block.data('bs.validator.originalContent'))
		}
		$group.removeClass('has-error')
	}

	Validator.prototype.hasErrors = function () {
		function fieldErrors() {
			return !!($(this).data('bs.validator.errors') || []).length
		}

		return !!this.$element.find(':input:enabled').filter(fieldErrors).length
	}

	Validator.prototype.isIncomplete = function () {
		function fieldIncomplete() {
			return $(this).is(':enabled') && (this.type === 'checkbox' ? !this.checked:
				this.type === 'radio' ? !$('[name="' + this.name + '"]:checked').length :
					$.trim(this.value) === '')
		}

		return !!this.$element.find(':input[required]:enabled').filter(fieldIncomplete).length
	}

	Validator.prototype.toggleSubmit = function () {
		var $btn = this.$element.find('input[type="submit"], button[type="submit"]')
		$btn.prop('disabled', this.isIncomplete() || this.hasErrors())
	}

	Validator.prototype.defer = function ($el, callback) {
		window.clearTimeout($el.data('bs.validator.timeout'))
		$el.data('bs.validator.timeout', window.setTimeout(callback, this.options.delay))
	}

	// VALIDATOR PLUGIN DEFINITION
	// ===========================
	function Plugin(option) {
		return this.each(function () {
			var $this	 = $(this)
			var options = $.extend({}, Validator.DEFAULTS, $this.data(), typeof option == 'object' && option)
			var data = $this.data('bs.validator')

			if (!data) $this.data('bs.validator', (data = new Validator(this, options)))
			if (typeof option == 'string') data[option]()
		})
	}

	var old = $.fn.validator

	$.fn.validator = Plugin
	$.fn.validator.Constructor = Validator


	// VALIDATOR NO CONFLICT
	// =====================

	$.fn.validator.noConflict = function () {
		$.fn.validator = old
		return this
	}


	// VALIDATOR DATA-API
	// ==================

	$(window).on('load', function () {
		$('form[data-toggle="validator"]').each(function () {
			var $form = $(this)
			Plugin.call($form, $form.data())
		})
	})

}(jQuery, moment);
