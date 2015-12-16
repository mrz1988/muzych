m = window.m

module.exports =
	appView = (app) ->
		m 'div.app', (m.component component, app.commonArgs for component in app.components())

