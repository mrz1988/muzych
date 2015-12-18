m = window.m

module.exports =
	mainPaneView = (mainPane) ->
		m 'div.main-panel', {id: 'pnl-main'}, [
			m 'div', 'Check out whats on your left'
		]
