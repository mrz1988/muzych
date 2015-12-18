m = window.m

module.exports =
	backButtonView = (back) ->
		m 'div.back-button-panel', [
			m 'div.back-button', [
				m 'span.fa.fa-2x.fa-arrow-left'
			]
		]
