wrapConstructor = require 'wrap-constructor'

Header =
	controller: require 'controllers/header'
	view: require 'views/header'

SideList =
	controller: require 'controllers/sidelist'
	view: require 'views/sidelist'

SideListSearch =
	controller: require 'controllers/sidelist-search'
	view: require 'views/sidelist-search'

SideListShutter =
	controller: require 'controllers/sidelist-shutter'
	view: require 'views/sidelist-shutter'

MainPane =
	controller: require 'controllers/main-pane'
	view: require 'views/main-pane'

components = [
	MainPane
	Header
	SideList
	SideListSearch
	SideListShutter
]

wrapController = (component) ->
	component.controller = wrapConstructor component.controller
	component

components = (wrapController component for component in components)

module.exports =
	class AppController
		constructor: (@commonArgs) ->

		components: ->
			components
