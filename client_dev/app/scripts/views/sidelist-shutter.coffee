m = window.m

module.exports =
	shutterView = (shutter) ->

		listOpen = shutter.listIsOpen()
		shutterArrowDir = if listOpen then 'left' else 'right'
		shutterArrowClass = 'fa-chevron-' + shutterArrowDir

		m 'div.sl-shutter-panel', {id: 'pnl-sideshutter'}, [
			m 'div.sidelist-shutter', {
				onclick: shutter.toggleList
			}, [
				m 'span.fa.fa-2x.def-cur', class: shutterArrowClass
			]
		]
