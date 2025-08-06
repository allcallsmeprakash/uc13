from flask import Flask
from routes import api

app = Flask(__name__)
app.register_blueprint(api)

@app.route('/')
def home():
    return 'Employee Directory Backend'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
