m = window.m

module.exports =
	class SideListShutterController
		constructor: (commArgs) ->
			@listIsOpen = m.prop yes

		openList: ->
			@listIsOpen yes

		closeList: ->
			@listIsOpen no

