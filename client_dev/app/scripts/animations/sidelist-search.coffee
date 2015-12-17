m = window.m

AnimationMgr = require 'animations/base'

openProperties =
	width: '20rem'
	opacity: '1'
	"margin-left": '1rem'
	"margin-right": '1rem'

closedProperties =
	width: '0'
	opacity: '0'
	'margin-left': '0'
	'margin-right': '0'

targetId = 'sidelist-search'


module.exports =
	class SearchBarAnimations extends AnimationMgr
		open: =>
			@_animateOnEvent
				ids: [targetId]
				preventDefault: yes
				properties: openProperties
				options:
					begin: @_openBegin

		close: =>
			@_animateOnEvent
				ids: [targetId]
				preventDefault: yes
				properties: closedProperties
				options:
					begin: @_closeBegin
					complete: @_closeComplete

		toggle: =>
			if @_controller.searchIsOpen()
				@close()
			else
				@open()

		_openBegin: =>
			@_controller.openSearch()
			m.startComputation()
			m.endComputation()

		_closeBegin: ->
			m.redraw.strategy("none")

		_closeComplete: =>
			m.startComputation()
			@_controller.closeSearch()
			m.endComputation()

