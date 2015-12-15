from flask import Flask

app = Flask(__name__, 
        static_folder='client_build/static',
        template_folder='client_build')
from muzych import views
