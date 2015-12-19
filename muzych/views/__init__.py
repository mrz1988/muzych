import os
import json
from flask import url_for, g
from muzych import app
from beets.library import Library

# View MAGIC!
# This file imports all view route functions from python modules in this directory.
# No special work is required to register a view function outside of the normal decorators.
#
# For the frontend, it adds a special '/api' route, which packages and registers all functions
# within its 'flask' communication object for convenience. However, it recklessly assumes
# that you have properly managed your routes and function names such that there is no overlap. (TODO?)
# The functions are packaged for the frontend in camelCase so no conventions are broken there.
#
# Example:
#
# @app.route('/myroute')
# def my_route()
#     pass
#
# Can be called on the frontend via:
#
# commonArgs.flask.myRoute().then handler
#
# without any special work required. It should 'Just Work'

module_files = os.listdir(os.path.dirname(__file__))

for f in module_files:
    fname, ext = os.path.splitext(f)
    if ext == '.py' and fname != '__init__':
        __import__(fname, locals(), globals(), [], -1)

def has_no_empty_params(rule):
    defaults = rule.defaults if rule.defaults is not None else ()
    arguments = rule.arguments if rule.arguments is not None else ()
    return len(defaults) >= len(arguments)

def to_camel_case(underscore_name):
    #remove leading/trailing underscores
    underscore_name = underscore_name.strip('_')

    result = ''
    make_capital = False
    for c in underscore_name:
        if c == '_':
            make_capital = True
        result += c.upper() if make_capital else c.lower()
        make_capital = False
    return result

@app.route('/api')
def api():
    api_list = {}
    for rule in app.url_map.iter_rules():
        if "GET" in rule.methods and has_no_empty_params(rule):
            url = url_for(rule.endpoint, **(rule.defaults or {}))
            method_name = to_camel_case(rule.endpoint)
            api_list[method_name] = url
    return json.dumps(api_list)


# Load Beets
@app.before_request
def before_request():
    g.lib = Library("F:/data/musiclibrary.blb")