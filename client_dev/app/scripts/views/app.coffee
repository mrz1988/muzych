m = window.m

module.exports =
	appView = (app) ->
		m 'div.app', app.message()
