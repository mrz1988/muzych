m = window.m

module.exports =
	class BackButtonController
		constructor: (commArgs) ->
			@_pubSub = commArgs.pubSub

		goBack: =>
			@_pubSub.publish 'navigate:back'
