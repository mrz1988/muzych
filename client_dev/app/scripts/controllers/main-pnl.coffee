m = window.m

wrapConstructor = require 'wrap-constructor'

module.exports =
	class MainPaneController
		constructor: (commArgs) ->
			@_sidelist = commArgs.models.sidelist

		selectionMade: (commArgs) ->
			@_sidelist.selectionMade()
