m = window.m

AnimationMgr = require 'animations/base'

listIds = ['pnl-sidelist', 'pnl-sidesearch', 'pnl-sideshutter']

module.exports =
	class ShutterAnimations extends AnimationMgr
		open: =>
			@_animateOnEvent
				ids: listIds
				properties:
					left: '0'
				options:
					begin: @_shrinkMainPnl()

		close: =>
			console.log "getting close func"
			@_animateOnEvent
				ids: listIds
				properties:
					left: '-28.5rem'
				options:
					begin: @_growMainPnl()

		toggle: ->
			console.log "toggle"
			if @_controller.listIsOpen()
				@close()
			else
				@open()

		_growMainPnl: =>
			@_animateOnEvent
				ids: ['pnl-main']
				properties:
					left: '1.5rem'
				options:
					begin: @_closeBegin()
					complete: @_closeComplete()

		_shrinkMainPnl: =>
			@_animateOnEvent
				ids: ['pnl-main']
				properties:
					left: '30rem'
				options:
					begin: @_openBegin()

		_openBegin: =>
			@_controller.openList()
			m.startComputation()
			m.endComputation()

		_closeBegin: =>
			console.log "close Begin"
			m.redraw.strategy('none')

		_closeComplete: =>
			console.log "closeComplete"
			m.startComputation()
			@_controller.closeList()
			m.endComputation()
