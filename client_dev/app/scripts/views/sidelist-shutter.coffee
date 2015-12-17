m = window.m

ShutterAnimator = require 'animations/sidelist-shutter'

module.exports =
	shutterView = (shutter) ->
		animator = new ShutterAnimator shutter

		listOpen = shutter.listIsOpen()
		shutterArrowDir = if listOpen then 'left' else 'right'
		shutterArrowClass = 'fa-chevron-' + shutterArrowDir

		m 'div.sl-shutter-panel', {id: 'pnl-sideshutter'}, [
			m 'div.sidelist-shutter', {
				onclick: animator.toggle()
			}, [
				m 'span.fa.fa-2x.def-cur', class: shutterArrowClass
			]
		]
