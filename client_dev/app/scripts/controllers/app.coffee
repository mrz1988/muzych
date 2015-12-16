wrapConstructor = require 'wrap-constructor'

Header =
	controller: require 'controllers/header'
	view: require 'views/header'

SideList =
	controller: require 'controllers/sidelist'
	view: require 'views/sidelist'

components = [
	Header
	SideList
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
