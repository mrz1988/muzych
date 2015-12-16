DEBUG = on

m = window.m
docReady = window.docReady

pubSub = window.amplify
modelClasses = require 'models/registry'

loc = window.location
flaskUrl = "http://#{loc.hostname}:#{loc.port}"
constants =
	flaskUrl: flaskUrl

FlaskApi = require 'comm'
AppController = require 'controllers/app'
appView = require 'views/app'

instantiateModels = (commonArgs) ->
	models = {}
	for mtype, Model of modelClasses
		model = new Model commonArgs
		model.connectHandlers()
		models[mtype] = model
	models

bootApp = (apiUrls) ->
	api = new FlaskApi constants.flaskUrl, apiUrls

	models = instantiateModels
		flask: api
		constants: constants
		pubSub: pubSub

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
