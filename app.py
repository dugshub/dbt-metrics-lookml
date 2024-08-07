from flask import render_template
import connexion
from main import get_lookml

app = connexion.App(__name__, specification_dir='./')
app.add_api('swagger.yaml')


@app.route('/')
def home():
    return render_template("home.html")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
