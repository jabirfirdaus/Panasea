from flask import Flask, render_template
from config import Config
from extensions import db, login_manager

app = Flask(__name__)
app.config.from_object(Config)

db.init_app(app)
login_manager.init_app(app)

from models.user import User

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

from routes.admin import admin
from routes.user import user
from routes.auth import auth

app.register_blueprint(admin)
app.register_blueprint(user)
app.register_blueprint(auth)

@app.route("/")
def home():
    return render_template("index.html")

if __name__ == "__main__":
    with app.app_context():
        db.create_all()

        # Create default admin if not exists
        if not User.query.filter_by(username="admin").first():
            admin_user = User(
                username="admin",
                email="admin@panasea.com",
                is_admin=True
            )
            admin_user.set_password("admin123")
            db.session.add(admin_user)
            db.session.commit()
            print("Default admin created: admin / admin123")

    app.run(debug=True)