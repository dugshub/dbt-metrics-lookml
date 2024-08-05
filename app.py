from flask import Flask, render_template
from main import get_lookml

app = Flask(__name__)

@app.route('/')
def home():
    return get_lookml()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)