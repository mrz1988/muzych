m = window.m

Animator = require 'animations/sidelist-shutter'

module.exports =
	shutterView = (shutter) ->
		animator = new Animator shutter

		listOpen = shutter.listIsOpen()
		shutterArrowDir = if listOpen then 'left' else 'right'
		shutterArrowClass = 'fa-chevron-' + shutterArrowDir

		m 'div.sl-shutter-panel', [
			m 'div.sidelist-shutter', {
				onclick: animator.toggle()
			}, [
				m 'span.fa.fa-2x.def-cur', class: shutterArrowClass
			]
		]
