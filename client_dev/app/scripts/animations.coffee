m = window.m
v = window.Velocity

module.exports =
	class Animation
		constructor: (commonArgs, name, defaultState) ->
			@_pubSub = commonArgs.pubSub
			@_uistate = commonArgs.models.uistate
			@_name = name
			@_pubSub.subscribe 'ui-state:update', @_changeState
			@_rules = []
			@_uistate.register
				control: name
				defaultState: defaultState

		addRule: ({whenOpen, whenClosed, ids}) =>
			@_rules.push
				whenOpen: whenOpen
				whenClosed: whenClosed
				ids: ids

		_changeState: ({control, state}) =>
			if @_name is control
				@_animateTo state

		_animateTo: (state) =>
			rules = @_rules.slice()
			lastRule = rules.pop()

			for rule in rules
				props = if state then rule.whenOpen else rule.whenClosed
				run = @_animation(
					ids: rule.ids
					properties: props
				)
				run()

			lastProps = if state then lastRule.whenOpen else lastRule.whenClosed
			runLast = @_animation(
				ids: lastRule.ids
				properties: lastProps
				callbacks: @_makeCallbacks {state: state}
			)
			runLast()

		_animation: ({playWhen, properties, callbacks, ids}) ->
			->
				els = []
				for id in ids
					els.push document.getElementById(id)
				callbacks = callbacks or {}
				predicate = if playWhen? then playWhen else yes
				if predicate
					last = els.pop()
					for el in els
						v el, properties
					v last, properties, callbacks
				undefined

		_makeCallbacks: ({state}) =>
			that = @
			name = @_name
			begin: ->
				m.startComputation()
				m.endComputation()
			complete: ->
				m.startComputation()
				that._uistate.completed control: name, newState: state
				m.endComputation()
