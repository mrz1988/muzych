m = window.m

module.exports =
	headerView = (header) ->
		m 'div.header-panel', [
			m 'div.header-topbar'
			m 'div.header.def-cur', [
				m 'span', header.headline()
				m 'span.fa.fa-sm.fa-music'
			]
		]
