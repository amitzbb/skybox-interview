from flask import request, Flask
import json
import os


app1 = Flask(__name__)


@app1.route('/')
def hello_world():
    return "Hello world from webserver " + os.environ['HOSTNAME']


@app1.route('/health')
def health():
    return "webserver name is " + os.environ['HOSTNAME']

if __name__ == '__main__':
   app1.run(debug=True, host='0.0.0.0')


