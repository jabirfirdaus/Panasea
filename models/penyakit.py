from extensions import db

class Penyakit(db.Model):
    __tablename__ = 'penyakit'

    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(100), nullable=False)

    relasi = db.relationship('Relasi', backref='penyakit', lazy=True, cascade='all, delete-orphan')

    def __repr__(self):
        return f'<Penyakit {self.nama}>'