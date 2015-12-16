DEBUG = on

m = window.m
docReady = window.docReady
pubSub = window.amplify
comm = null

if DEBUG
	constants =
		flaskUrl: 'http://localhost:5000'
else
	constants =
		flaskUrl: undefined

FlaskApi = require 'comm'
AppController = require 'controllers/app'
appView = require 'views/app'


bootApp = (apiUrls) ->
	api = new FlaskApi constants.flaskUrl, apiUrls
	models = []
	App =
		controller: ->
			new AppController
				flask: api
				constants: constants
				models: models
				pubSub: pubSub
		view: appView
	
	m.mount document.body, App

docReady ->
	m.request(
		method: 'GET'
		url: constants.flaskUrl + '/api'
		headers: {'Origin': 'localhost'}
	).then bootApp
