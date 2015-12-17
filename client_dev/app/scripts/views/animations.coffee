v = window.Velocity

animateEvent = ({playWhen, properties, options, onStart, onFinish, preventDefault}) ->
	options = options or {}
	predicate = if playWhen? then playWhen else yes
	return (e) ->
		if preventDefault
			e.preventDefault()
		if predicate
			el = e.currentTarget
			v el, properties, options

animate = ({playWhen, properties, options, onStart, onFinish}) ->
	options = options or {}
	predicate = if playWhen? then playWhen else yes
	return (el, isInitialized, context) ->
		if isInitialized and predicate
			v el, properties, options
			onStart el, isInitialized, context

animateById = ({playWhen, properties, options, id, onStart, onFinish, preventDefault}) ->
	options = options or {}
	predicate = if playWhen? then playWhen else yes
	return (e) ->
		if preventDefault
			e.preventDefault()
		if predicate
			el = document.getElementById(id)
			v el, properties, options

module.exports =
	growX: ({to, options}, callback = ->) ->
		animate {
			properties:
				width: to
			options: options
		}, callback

	animateEvent: animateEvent

	animate: animate

	animateById: animateById
