import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY', 'panasea_secret_key_2026')
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL', 'mysql+pymysql://root:@localhost/panasea')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    UPLOAD_FOLDER = os.path.join('static', 'uploads', 'obat')