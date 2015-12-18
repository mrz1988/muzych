BaseModel = require 'models/base'

module.exports =
	class AnimationModel extends BaseModel
		constructor: (commonArgs) ->
			super commonArgs
			@_states = {}
			@_locks = {}
			@_queues = {}

		register: ({control, defaultState}) =>
			console.log "registering #{control}"
			@_states[control] = defaultState
			@_locks[control] = off
			@_queues[control] = []

		changeState: ({control, newState}) =>
			console.log "changing state of #{control} to #{newState}"
			if newState is 'toggle'
				newState = not @_states[control]
			if not @isAnimating {control: control}
				@_update control: control, newState: newState
			else
				@_queues[control].push newState

		completed: ({control, newState}) =>
			console.log "finishing state change of #{control} to #{newState}"
			@_states[control] = newState
			@_pubSub.publish 'ui-state:updated'
			queuedState = @_flush({control: control})
			console.log "queued state: #{queuedState} newState: #{newState}"
			if queuedState is newState
				@_locks[control] = off
				@_queues[control] = []
			else
				console.log "updating animation..."
				@_update control: control, newState: queuedState

		stateOf: ({control}) =>
			@_states[control]

		isAnimating: ({control}) =>
			console.log "Lock exists?: #{@_locks[control]?} Lock taken?: #{@_locks[control]}"
			if not @_locks[control]?
				return yes
			return @_locks[control]

		_update: ({control, newState}) =>
			# Currently only binary toggling is implemented.
			# Rotating multi-state controls might be interesting
			# to do later.
			if newState is 'toggle'
				newState = not @_states[control]
			console.log "checking history: #{newState} vs old: #{@_states[control]}"
			if newState isnt @_states[control]
				@_locks[control] = on
				@_pubSub.publish 'ui-state:update',
					control: control
					state: newState

		_flush: ({control}) =>
			console.log "flushing #{control}"
			queue = @_queues[control]
			console.log "Queue:"
			console.dir queue
			newState = @_states[control]
			for item in queue
				if item is 'toggle'
					newState = not newState
					console.log "toggling newState to #{newState}"
				else
					newState = item
					console.log "setting newState to #{newState}"
			console.log "New state from queue: #{newState}"
			@_queues[control] = []
			newState

