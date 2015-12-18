module.exports =
	class SideListItemController
		constructor: ({key, text}, commArgs) ->
			@_key = key
			@_text = text
			@_sidelist = commArgs.models.sidelist

		text: =>
			@_text

		select: =>
			console.log "selecting: #{@_key}"
			@_sidelist.setSelected key: @_key

		isSelected: =>
			@_sidelist.isSelected key: @_key
