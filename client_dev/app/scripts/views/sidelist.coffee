m = window.m

module.exports =
	listView = (sideList) ->
		m 'div.sl-panel', [
			m 'div.sidelist-backdrop', [
				m 'div.sidelist', [
					m 'div.items', (
						for item in sideList.items()
							m 'div.sl-item.def-cur', item
					)
				]
			]
		]
