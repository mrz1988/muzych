m = window.m

module.exports =
	mainPaneView = (mainPane) ->
		m 'div.main-panel', {id: 'pnl-main'}, [
			m 'div.empty-message', [
				m 'span.fa.fa-arrow-left'
				m 'span.content', 'Select an artist'
			]
		]
