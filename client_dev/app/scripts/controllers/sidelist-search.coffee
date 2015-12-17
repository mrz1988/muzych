m = window.m

module.exports =
	class SideListSearchController
		constructor: (commArgs) ->
			@_artists = commArgs.models.artists
			@_searchQuery = ''
			@searchHasFocus = m.prop(no)
			@searchIsOpen = m.prop(no)

		changeSearch: (query) =>
			m.startComputation()
			@_artists.changeQuery(query)
			m.endComputation()

		closeSearch: =>
			@searchHasFocus no
			@searchIsOpen no

		openSearch: =>
			@searchIsOpen yes
			@searchHasFocus yes
