module.exports =
	class BaseModel
		constructor: ({pubSub, flask}) ->
			@_flask = flask
			@_pubSub = pubSub
			@_pubSubHandlers = {}
		
		connectHandlers: =>
			@_pubSub.subscribe route, handler for route, handler of @_pubSubHandlers

		disconnectHandlers: =>
			@_pubSub.unsubscribe route, handler for route, handler of @_pubSubHandlers
