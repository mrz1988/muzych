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

@app.route('/api')
def api():
    api_list = {}
    for rule in app.url_map.iter_rules():
        if "GET" in rule.methods and has_no_empty_params(rule):
            url = url_for(rule.endpoint, **(rule.defaults or {}))
            api_list[rule.endpoint] = url
    return json.dumps(api_list)
