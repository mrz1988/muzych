m = window.m

module.exports =
	slItemView = (item) ->
		m 'div.sl-item.def-cur', {
			class: if item.isSelected() then 'highlight' else ''
			onclick: item.select
		}, item.text()
