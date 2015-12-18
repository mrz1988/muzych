m = window.m

wrapConstructor = require 'wrap-constructor'

SideListItem =
	controller: require 'controllers/sl-item'
	view: require 'views/sl-item'
SideListItem.controller = wrapConstructor SideListItem.controller

module.exports =
	listView = (sideList, commonArgs) ->
		m 'div.sl-panel', {id: 'pnl-sidelist'}, [
			m 'div.sidelist-backdrop', [
				m 'div.sidelist', [
					m 'div.items', (
						for item in sideList.items()
							key = item.id
							text = item.text
							m.component SideListItem, {key: key, text: text}, commonArgs
					)
				]
			]
		]
