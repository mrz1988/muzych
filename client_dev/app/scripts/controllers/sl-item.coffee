module.exports =
	class SideListItemController
		constructor: ({key, text}, commArgs) ->
			@_key = key
			@_text = text
			@_pubSub = commArgs.pubSub
			@_sidelist = commArgs.models.sidelist
			@_albums = commArgs.models.albums

		text: =>
			@_text

		select: =>
			@_pubSub.publish 'navigate:fwd',
				sidelistSelection: @_key
				sidelistCategory: 'artists'
				mainPanel: 'albums'
				mainPanelKeys: []
			@_sidelist.setSelected key: @_key

		isSelected: =>
			@_sidelist.isSelected key: @_key

		_selectArtist: ({key}) ->
			albumKeys = @_albums.idsByArtist artist: key
			@_pubSub.publish 'navigate:fwd',
				sidelistSelection: key
				sidelistCategory: 'artists'
				mainPanel: 'albums'
				mainPanelKeys: albumKeys
