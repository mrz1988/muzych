m = window.m

module.exports =
	class AppController
		constructor: (commArgs) ->
			@message = m.prop 'No contact'
			@_artists = commArgs.models.artists

		update: (msg) =>
			console.log "Received a message!"
			console.log msg
			@message msg

		artists: =>
			console.log "artists!"
			@_artists.all()

		components: ->
			[]
