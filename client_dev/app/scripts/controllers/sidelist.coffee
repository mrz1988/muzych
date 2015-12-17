m = window.m

module.exports =
	class SideListController
		constructor: (commArgs) ->
			@_artists = commArgs.models.artists
			@searchAni = m.prop(1)
			@searchOpen = m.prop(no)

		openSearch: =>
			console.log "open search"
			@searchOpen(yes)

		items: =>
			@_artists.all()
