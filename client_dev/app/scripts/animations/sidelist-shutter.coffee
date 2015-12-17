m = window.m

AnimationMgr = require 'animations/base'

listIds = ['#pnl-header', '#pnl-sidelist', '#pnl-sidesearch', '#pnl-side-shutter']

module.exports =
	class ShutterAnimations extends AnimationMgr
		toggle: ->
			->
