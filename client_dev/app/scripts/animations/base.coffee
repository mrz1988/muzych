v = window.Velocity

module.exports =
	class AnimationMgr
		constructor: (controller) ->
			@_controller = controller

		_animate: ({playWhen, properties, options, els}) ->
			options = options or {}
			predicate = if playWhen? then playWhen else yes
			if predicate
				for el in els
					v el, properties, options
			undefined

		_animateOnRedraw: ({playWhen, properties, options, ids}) ->
			animator = @
			return (el, isInitialized, context) ->
				if isInitialized
					els = []
					if ids.length > 0
						for id in ids
							els.push document.getElementById(id)
					else
						els.push el
					animator._animate
						playWhen: playWhen
						properties: properties
						options: options
						els: els

		_animateOnEvent: ({playWhen, properties, options, preventDefault, ids}) ->
			animator = @
			return (e) ->
				if preventDefault
					e.preventDefault()
				els = []
				if ids.length > 0
					for id in ids
						els.push document.getElementById(id)
				else
					els.push e.currentTarget
				animator._animate
					playWhen: playWhen
					properties: properties
					options: options
					els: els
