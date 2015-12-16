m = window.m

module.exports =
	class SideListController
		constructor: (commArgs) ->
			@_artists = commArgs.models.artists

		items: =>
			@_artists.all()
