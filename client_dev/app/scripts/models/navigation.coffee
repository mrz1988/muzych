BaseModel = require 'models/base'

module.exports =
	class NavigationModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_history = []
			@_current =
				sidelistSelection: undefined
				sidelistCategory: 'artists'
				mainPanel: ''
				mainPanelKeys: []
			@_pubSubHandlers =
				'navigate:fwd': @_forward
				'navigate:back': @_back

		_forward: (args) =>
			unless @_isNewState args
				return
			@_pubSub.publish 'mainPnl:change', args.mainPanel
			@_history.push @_current
			@_current = args
			slArgs =
				selection: args.sidelistSelection
				category: args.sidelistCategory
			@_pubSub.publish 'sidelist:navigate', slArgs

			if @_history.length > 25
				@_history.splice 0, 1

		_back: =>
			if @_history.length is 0
				return
			prev = @_history.pop()
			@_current = prev
			@_pubSub.publish 'mainPnl:change', prev.mainPanel
			slArgs =
				selection: prev.sidelistSelection
				category: prev.sidelistCategory
			@_pubSub.publish 'sidelist:navigate', slArgs

		_isNewState: (args) =>
			if args.sidelistSelection isnt @_current.sidelistSelection
				return yes
			if args.sidelistCategory isnt @_current.sidelistCategory
				return yes
			if args.mainPanel isnt @_current.mainPanel
				return yes

			return args.mainPanelKeys.join() isnt @_current.mainPanelKeys.join()
