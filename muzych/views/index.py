from flask import render_template
from muzych import app

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html',
            title='Hello World')

@app.route('/hello')
def howdy():
    return '"Hello, World!"'
