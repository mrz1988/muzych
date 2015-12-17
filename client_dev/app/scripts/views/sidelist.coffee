m = window.m
v = window.Velocity

{animateById} = require 'views/animations'

# display: none seems to have some weird issues getting removed
# during animation. This will effectively hide the element until
# we are ready to see it
showIf = (visible) ->
	if visible then '' else 'hide-hack'

module.exports =
	listView = (sideList) ->
		searchOpen = sideList.searchOpen()
		searchArrowDir = if searchOpen then 'left' else 'right'
		searchArrowClass = 'fa-caret-' + searchArrowDir
		m 'div', [
			m 'div.sl-search', {
				class: if searchOpen then 'open' else ''
				onclick: animateById
					id: 'sidebar-search'
					playWhen: not searchOpen
					properties:
						width: '20rem'
						"margin-left": '1rem'
						"margin-right": '1rem'
					onStart: sideList.openSearch
			},[
				m 'span.fa.fa-lg.fa-search'
				m 'input[type=text].search-input',
					class: showIf searchOpen
					id: 'sidebar-search'
				m 'span.fa.fa-lg.search-arrow', class: searchArrowClass
			]
			m 'div.sidelist', [
				m 'div.items', (
					for item in sideList.items()
						m 'div.sl-item', item
				)
			]
		]
