m = window.m

module.exports =
	class CommMgr
		constructor: (url, methods) ->
			@_url = url
			@_initMethods(methods)

		_initMethods: (methods) =>
			for name, url of methods
				console.log "#{name} + #{url}"
				@[name] = @_methodFactory url

		_methodFactory: (url) =>
			request = @_deriveUrl url
			@_request request

		_request: (url) =>
			->
				console.log "Outgoing request: #{url}"
				m.request(
					method: 'GET'
					url: url
					headers: {'Origin': 'localhost'}
				)

		_deriveUrl: (url, params) =>
			@_url + url
