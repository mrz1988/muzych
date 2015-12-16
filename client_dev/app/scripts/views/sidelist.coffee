m = window.m

module.exports =
	listView = (sideList) ->
		m 'div.sidelist', (
			for item in sideList.items()
				m 'div.sl-item', item
		)
