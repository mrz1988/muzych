from flask import render_template
from server import app

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html',
            title='Hello World')

@app.route('/hello')
def hello():
    return '"You have made contact!"'