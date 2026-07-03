from flask import Blueprint, render_template, request
from models.obat import Obat
from models.relasi import Relasi
from models.penyakit import Penyakit

user = Blueprint('user', __name__)

@user.route('/rekomendasi', methods=['GET', 'POST'])
def rekomendasi():
    penyakit_list = Penyakit.query.all()
    hasil = []

    if request.method == 'POST':
        selected = request.form.getlist('penyakit')

        if selected:
            relasi = Relasi.query.filter(
                Relasi.penyakit_id.in_(selected)
            ).all()

            obat_ids = list(set([r.obat_id for r in relasi]))

            if obat_ids:
                hasil = Obat.query.filter(Obat.id.in_(obat_ids)).all()

    return render_template(
        'rekomendasi.html',
        penyakit=penyakit_list,
        hasil=hasil
    )

@user.route('/detail-obat/<int:id>')
def detail_obat(id):
    obat = Obat.query.get_or_404(id)
    return render_template('detail_obat.html', obat=obat)