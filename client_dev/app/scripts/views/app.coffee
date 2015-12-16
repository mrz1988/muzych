m = window.m

module.exports =
	appView = (app) ->
		m 'div.app', [
			m 'ul', (
				for album in app.artists()
					m 'li', album
			)
		]
