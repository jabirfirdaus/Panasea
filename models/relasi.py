from extensions import db

class Relasi(db.Model):
    __tablename__ = 'relasi'

    id = db.Column(db.Integer, primary_key=True)
    obat_id = db.Column(db.Integer, db.ForeignKey('obat.id'), nullable=False)
    penyakit_id = db.Column(db.Integer, db.ForeignKey('penyakit.id'), nullable=False)

    def __repr__(self):
        return f'<Relasi obat={self.obat_id} penyakit={self.penyakit_id}>'