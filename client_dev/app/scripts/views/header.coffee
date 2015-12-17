m = window.m

module.exports =
	headerView = (header) ->
		m 'div.header-panel', {id: 'pnl-header'}, [
			m 'div.header-topbar'
			m 'div.header.def-cur', [
				m 'span', header.headline()
				m 'span.fa.fa-sm.fa-music'
			]
		]
