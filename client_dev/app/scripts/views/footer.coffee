m = window.m

module.exports =
	footerView = (footer) ->
		m 'div.footer-panel.def-cur', [
			m 'div.footer'
			m 'div.footer-bottom'
		]
