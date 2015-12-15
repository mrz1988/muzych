exec = require('child_process').exec
path = require 'path'
notifier = require 'node-notifier'

icon =
	pass: path.join __dirname, 'pass.png'
	fail: path.join __dirname, 'fail.png'

appPattern = /^app/
# block regexes (http://coffeescript.org/#regexes)
vendorScriptsPattern = ///^ # all matches must start at beginning of string
	(
		vendor
		[\\/] # path separator
		(?!test) # exclude vendor/test scripts
		|bower_components # or instead of all that, bower dependencies
	)
	///
vendorStylesheetsPattern = ///^
	(
		vendor
		[\\/] # path separator
		(?!test) # exclude vendor/test stylesheets
		|bower_components # or instead of all that, bower dependencies
	)
	///
vendorTestPattern = ///^
	vendor
	[\\/] # path separator
	test
	///

exports.config =
	paths:
		public: '../server/static'
	files:
		javascripts:
			joinTo:
				'javascripts/app.js': appPattern
				'javascripts/vendor.js': vendorScriptsPattern
		stylesheets:
			joinTo:
				'stylesheets/app.css': appPattern
				'stylesheets/vendor.css': vendorStylesheetsPattern
	modules:
		nameCleaner: (path) ->
			path.replace(///^
				app
				[\\/] # path separator
				scripts
				[\\/] # path separator
				///, '')
	notifications: [
		'error'
		'warn'
	]
	plugins:
		coffeelint:
			pattern: ///^
				(
					app
					|test # app or test directory
				)
				[\\/] # path separator
				.* # allow subdirectories and any file name
				\.coffee$ # that ends in .coffee
				///
			options:
				arrow_spacing:
					level: 'warn'
				braces_spacing:
					level: 'warn'
					spaces: 0
				colon_assignment_spacing:
					level: 'warn'
					spacing:
						left: 0
						right: 1
				cyclomatic_complexity:
					level: 'warn'
					value: 10
				indentation:
					level: 'error'
					value: 1
				line_endings:
					level: 'warn'
				max_line_length:
					level: 'warn'
					value: 120
					limitComments: yes
				missing_fat_arrows:
					level: 'warn'
				newlines_after_classes:
					level: 'warn'
					value: 2
				no_empty_param_list:
					level: 'warn'
				no_interpolation_in_single_quotes:
					level: 'warn'
				no_tabs:
					level: 'ignore'
				no_unnecessary_double_quotes:
					level: 'warn'
				prefer_english_operator:
					level: 'warn'
					doubleNotLevel: 'ignore'
				space_operators:
					level: 'warn'
				spacing_after_comma:
					level: 'warn'
	sourceMaps: no
	overrides:
		production:
			plugins:
				# override postBrunch tasks, they're considered development-time only (e.g. testing and styleguide)
				postBrunch: ->
