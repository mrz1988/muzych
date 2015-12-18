BaseModel = require 'models/base'

module.exports =
	class SideListModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_list = []
			@_searchQuery = ''
			@_pubSubHandlers =
				'sidelist:navigate': @_navigate
			@connectHandlers()
			@_navigate {category: 'artists', selection: undefined}

		listArtists: =>
			@_category = 'artists'
			@_refetch()

		listPlaylists: =>
			@_category = 'playlists'
			@_refetch()

		listSongs: =>
			@_category = 'songs'
			@_refetch()

		sideListCategory: =>
			@_category

		changeQuery: (query) =>
			@_searchQuery = query

		query: =>
			if @_searchQuery is ''
				return @_list

			query = @_searchQuery.toLowerCase()

			results = []
			for item in @_list
				entry = item.text.toLowerCase()
				if entry.indexOf(query) > -1
					results.push item
			results

		all: =>
			@_list

		selectionMade: =>
			@_selectedKey?

		isSelected: ({key}) =>
			@_selectedKey is key

		setSelected: ({key}) =>
			@_selectedKey = key

		_update: (results) =>
			newList = []
			if @_category is 'artists'
				for artist in results
					newList.push
						id: artist
						text: artist
			@_list = newList

		_navigate: ({category, selection}) =>
			@_changeCategory category
			@_selectedKey = selection

		_changeCategory: (category) =>
			if category is @_category
				return
			@_category = category
			@_refetch()

		_refetch: =>
			if @_category is 'artists'
				@_flask.artists().then @_update

