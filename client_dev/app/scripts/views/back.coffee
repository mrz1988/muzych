m = window.m

module.exports =
	backButtonView = (back) ->
		m 'div.back-button-panel', [
			m 'div.back-button.def-cur', {
				onclick: back.goBack
			}, [
				m 'span.fa.fa-2x.fa-arrow-left'
			]
		]
