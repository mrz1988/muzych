m = window.m
docReady = window.docReady
pubSub = window.amplify
comm = null

AppController = require 'controllers/app'
appView = require 'views/app'

bootApp = (constants) ->
	models = []
	App =
		controller: ->
			new AppController
				comm: comm
				constants: constants
				models: models
				pubSub: pubSub
		view: appView
	
	m.mount document.body, App

docReady ->
	bootApp({})
