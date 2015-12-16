BaseModel = require 'models/base'

module.exports =
	class ArtistsModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_refetch()
			@_pubSubHandlers =
				'artists:refetch': @_refetch

		_refetch: =>
			console.log "refetch..."
			@_flask.artists().then @_update

		_update: (artists) =>
			artists.sort()
			@_artists = artists
		all: =>
			return @_artists
