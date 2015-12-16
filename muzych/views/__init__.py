import os
import json
from flask import url_for
from muzych import app

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
