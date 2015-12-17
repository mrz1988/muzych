BaseModel = require 'models/base'

module.exports =
	class ArtistsModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_refetch()
			@_searchQuery = ''
			@_pubSubHandlers =
				'artists:refetch': @_refetch

		_refetch: =>
			@_flask.artists().then @_update

		_update: (artists) =>
			artists.sort()
			@_artists = artists

		changeQuery: (query) =>
			@_searchQuery = query

		query: =>
			if @_searchQuery is ''
				return @_artists

			query = @_searchQuery.toLowerCase()

			results = []
			for artist in @_artists
				entry = artist.toLowerCase()
				if entry.indexOf(query) > -1
					results.push artist
			results

		all: =>
			return @_artists
