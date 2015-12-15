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

AppController = require 'controllers/app'
appView = require 'views/app'

bootApp = (consts) ->
	models = []
	App =
		controller: ->
			new AppController
				comm: comm
				constants: consts
				models: models
				pubSub: pubSub
		view: appView
	
	m.mount document.body, App

docReady ->
	bootApp(constants)
