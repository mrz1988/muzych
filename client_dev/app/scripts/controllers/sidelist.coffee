m = window.m

module.exports =
	class SideListController
		constructor: (commArgs) ->
			@_sidelist = commArgs.models.sidelist

		items: =>
			@_sidelist.query()
