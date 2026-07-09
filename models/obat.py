from extensions import db

class Obat(db.Model):
    __tablename__ = 'obat'

    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(100), nullable=False)
    harga = db.Column(db.Integer, nullable=False)
    deskripsi = db.Column(db.Text)
    aturan_pakai = db.Column(db.String(200))
    foto = db.Column(db.String(255))

    relasi = db.relationship('Relasi', backref='obat', lazy=True, cascade='all, delete-orphan')

    def __repr__(self):
        return f'<Obat {self.nama}>'