m = window.m

module.exports =
	mainPanelView = (mainPanel) ->
		m 'div.main-panel', {id: 'pnl-main'}, [
			m 'div.empty-message', {
				class: if mainPanel.selectionMade() then 'hidden' else ''
			}, [
				m 'span.fa.fa-arrow-left'
				m 'span.content', 'Select an artist'
			]
		]
