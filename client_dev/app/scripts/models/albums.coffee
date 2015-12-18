BaseModel = require 'models/base'

# store 100 albums in memory
CACHE_SIZE = 100

module.exports =
	class AlbumsModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_cachedKeys = []
			@_albums = {}

		# New entries come in as a list, fire up the cache
		# We trust here that we did a good job of selecting unique newEntries
		# that did not previously exist in the cache.
		_cache: (newEntries) =>
			sizeAfterCache = @_cachedKeys.length + newEntries.length
			trimAmount = sizeAfterCache - CACHE_SIZE

			if trimAmount > 0
				keysToRemove = @_cachedKeys.splice 0, trimAmount
				for key in keysToRemove
					delete @_albums[key]

			for entry in newEntries
				key = entry.id
				@_cachedKeys.push key
				@_albums[key] = entry

		getByIds: ({ids}) =>
			uncachedIds = []
			results = {}
			for id in ids
				if @_albums[id]?
					results[id] = @_albums[id]
				else
					uncachedIds.push id

			newEntries = @_flask.albums(uncachedIds)()
			@_cache newEntries

			for id in ids
				results[id] = @_albums[id]
			results

		idsByArtist: ({artist}) =>
			@_flask.artistAlbumIds(artist)()
