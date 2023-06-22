from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://mywebapp@localhost/mydatabase'  
app.config['SQLALCHEMY_POOL_SIZE'] = 10
app.config['SQLALCHEMY_MAX_OVERFLOW'] = 5

db = SQLAlchemy(app)

@app.route('/')
def home():
    return "Welcome to my web app!"

@app.route('/healthz')
def health_check():
    return jsonify({'status': 'healthy'})

@app.route('/api')
def api():
    return jsonify({'message': 'Hello, world!'})

if __name__ == '__main__':
    app.run(host='0.0.0.0')  
