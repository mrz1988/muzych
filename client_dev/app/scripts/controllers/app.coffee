m = window.m

module.exports =
	class AppController
		constructor: (@commArgs) ->
			@message = m.prop 'No contact'
			@commArgs.flask.howdy().then @update

		update: (msg) =>
			console.log "Received a message!"
			console.log msg
			@message msg

		components: ->
			[]
