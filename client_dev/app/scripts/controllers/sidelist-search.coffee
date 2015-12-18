m = window.m

SEARCHBAR = 'sl-search'
Animation = require 'animations'

module.exports =
	class SideListSearchController
		constructor: (commArgs) ->
			@_sidelist = commArgs.models.sidelist
			@_uistate = commArgs.models.uistate
			@_animation = new Animation commArgs, SEARCHBAR, off
			@_configureAnimation()
			@_searchQuery = ''

		changeSearch: (query) =>
			m.startComputation()
			@_sidelist.changeQuery(query)
			m.endComputation()

		toggleSearch: =>
			@_uistate.changeState
				control: SEARCHBAR
				newState: 'toggle'

		closeSearch: =>
			@_uistate.changeState
				control: SEARCHBAR
				newState: off

		searchIsOpen: =>
			@_uistate.stateOf {control: SEARCHBAR}

		searchBarVisible: =>
			@searchIsOpen() or @_uistate.isAnimating {control: SEARCHBAR}

		_configureAnimation: =>
			@_animation.addRule
				ids: ['sidelist-search']
				whenOpen:
					width: '30rem'
					opacity: '1'
					'margin-left': '1rem'
					'margin-right': '1rem'
				whenClosed:
					width: '0'
					opacity: '0'
					'margin-left': '0'
					'margin-right': '0'

