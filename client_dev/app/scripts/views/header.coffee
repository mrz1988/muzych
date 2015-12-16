m = window.m

module.exports =
	headerView = (header) ->
		m 'div', [
			m 'div.header-topbar'
			m 'div.header', [
				m 'span', header.headline()
				m 'span.fa.fa-sm.fa-music'
			]
		]
