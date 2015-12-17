m = window.m

Animator = require 'animations/sidelist-search'

# display: none seems to have some weird issues getting removed
# during animation. This will effectively hide the element until
# we are ready to see it
showIf = (visible) ->
	if visible then '' else 'hide-hack'

updateFocus = (hasFocus) ->
	(el, isInitialized, context) ->
		if hasFocus
			el.focus()

module.exports =
	sideSearchView = (sideSearch) ->
		animator = new Animator sideSearch

		searchOpen = sideSearch.searchIsOpen()
		searchArrowDir = if searchOpen then 'left' else 'right'
		searchArrowClass = 'fa-caret-' + searchArrowDir

		m 'div.sl-search-panel', {id: 'pnl-sidesearch'}, [
			m 'div.sl-search', {
				class: if searchOpen then 'open' else ''
				onclick: animator.toggle()
			}, [
				m 'span.fa.fa-lg.fa-search.def-cur'
				m 'input[type=text].search-input',
					class: showIf searchOpen
					id: 'sidelist-search'
					onblur: animator.close()
					onkeyup: m.withAttr 'value', sideSearch.changeSearch
					config: updateFocus(searchOpen)
				m 'span.fa.fa-lg.search-arrow.def-cur', class: searchArrowClass
			]
		]

