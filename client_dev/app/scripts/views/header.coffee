m = window.m

module.exports =
	headerView = (header) ->
		m 'div', [
			m 'div.header-topbar'
			m 'div.header', header.headline()
		]
