wrapConstructor = require 'wrap-constructor'

SideList =
	controller: require 'controllers/sidelist'
	view: require 'views/sidelist'

components = [
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
