m = window.m

module.exports =
	listView = (sideList) ->
		m 'div.app', [
			m 'ul', (
				for item in sideList.items()
					m 'li', item
			)
		]
