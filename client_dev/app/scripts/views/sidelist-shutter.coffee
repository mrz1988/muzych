m = window.m

module.exports =
	shutterView = (shutter) ->

		listOpen = shutter.listIsOpen()
		shutterArrowDir = if listOpen then 'times' else 'caret-right'
		shutterArrowClass = 'fa-' + shutterArrowDir

		m 'div.sl-shutter-panel', {id: 'pnl-sideshutter'}, [
			m 'div.sidelist-shutter', {
				onclick: shutter.toggleList
			}, [
				m 'span.fa.fa-lg.def-cur', class: shutterArrowClass
			]
		]
