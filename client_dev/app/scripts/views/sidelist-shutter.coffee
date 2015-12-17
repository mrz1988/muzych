m = window.m

module.exports =
	shutterView = (shutter) ->
		m 'div.sl-shutter-panel', [
			m 'div.sidelist-shutter', [
				m 'span.fa.fa-2x.fa-chevron-left'
			]
		]
