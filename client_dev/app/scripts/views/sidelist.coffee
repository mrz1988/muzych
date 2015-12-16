m = window.m

module.exports =
	listView = (sideList) ->
		searchBarClass = if sideList.searchOpen() then 'open' else 'closed'
		m 'div', [
			m 'div.sl-search', class: searchBarClass, [
				m 'span.fa.fa-lg.fa-search'
				m 'span.fa.fa-lg.fa-caret-right'
			]
			m 'div.sidelist', [
				m 'div.items', (
					for item in sideList.items()
						m 'div.sl-item', item
				)
			]
		]
