BaseModel = require 'models/base'

module.exports =
	class SideListModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_list = []
			@_category = 'artists'
			@_searchQuery = ''
			@_refetch()
			@_selectedKey = undefined

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
				entry = item.toLowerCase()
				if entry.indexOf(query) > -1
					results.push item
			results

		all: =>
			return @_list

		isSelected: ({key}) =>
			return @_selectedKey is key

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

		_refetch: =>
			if @_category is 'artists'
				@_flask.artists().then @_update

