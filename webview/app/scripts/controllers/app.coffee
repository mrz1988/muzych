m = window.m

module.exports =
	class AppController
		constructor: (@commArgs) ->
			@message = m.prop 'No contact'
			url = @commArgs.constants.flaskUrl + '/hello'
			m.request(
				method: 'GET'
				url: url
				headers: {'Origin': 'localhost'}
			).then @update

		update: (msg) =>
			console.log "Received a message!"
			console.log msg
			@message msg

		components: ->
			[]
