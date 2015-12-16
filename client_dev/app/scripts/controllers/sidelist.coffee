module.exports =
	class SideListController
		constructor: (commArgs) ->
			@_artists = commArgs.models.artists

		searchOpen: =>
			return no

		items: =>
			@_artists.all()
