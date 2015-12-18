m = window.m

SIDESHUTTER = 'sl-shutter'
Animation = require 'animations'

module.exports =
	class SideListShutterController
		constructor: (commArgs) ->
			@_uistate = commArgs.models.uistate
			@_animation = new Animation commArgs, SIDESHUTTER, on
			@_configureAnimation()

		listIsOpen: =>
			@_uistate.stateOf {control: SIDESHUTTER}

		toggleList: =>
			@_uistate.changeState
				control: SIDESHUTTER
				newState: 'toggle'

		_configureAnimation: =>
			@_animation.addRule
				ids: ['pnl-sidelist', 'pnl-sidesearch', 'pnl-sideshutter']
				whenOpen:
					left: '0'
				whenClosed:
					left: '-33rem'

			@_animation.addRule
				ids: ['pnl-main']
				whenOpen:
					left: '34.5rem'
				whenClosed:
					left: '1.5rem'
