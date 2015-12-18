m = window.m

module.exports =
	hamburgerView = (hamburger) ->
		m 'div.hamburger-panel', [
			m 'div.hamburger', [
				m 'span.fa.fa-2x.fa-bars'
			]
		]
