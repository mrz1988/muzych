m = window.m

module.exports =
	class SideListSearchController
		constructor: (commArgs) ->
			@_artists = commArgs.models.artists
			@_searchQuery = ''
			@searchHasFocus = m.prop(no)
			@searchIsOpen = m.prop(no)

		changeSearch: (query) =>
			console.log query
			m.startComputation()
			@_artists.changeQuery(query)
			m.endComputation()

		closeSearch: =>
			console.log "close search"
			@searchHasFocus no
			@searchIsOpen no

		openSearch: =>
			console.log "open search"
			@searchIsOpen yes
			@searchHasFocus yes
