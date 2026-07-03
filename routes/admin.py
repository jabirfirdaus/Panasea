from flask import Blueprint, render_template, request, redirect, url_for, flash
from extensions import db
from models.obat import Obat
from flask_login import login_required, current_user
from functools import wraps

admin = Blueprint('admin', __name__, url_prefix='/admin')

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not current_user.is_authenticated or not current_user.is_admin:
            flash('Anda tidak memiliki akses ke halaman ini.', 'danger')
            return redirect(url_for('home'))
        return f(*args, **kwargs)
    return decorated_function

@admin.route('/dashboard')
@login_required
@admin_required
def dashboard():
    data = Obat.query.all()
    return render_template('admin/dashboard.html', data=data)

@admin.route('/tambah-obat', methods=['GET', 'POST'])
@login_required
@admin_required
def tambah_obat():
    if request.method == 'POST':
        nama = request.form.get('nama', '').strip()
        harga = request.form.get('harga', '0')
        stok = request.form.get('stok', '0')
        deskripsi = request.form.get('deskripsi', '').strip()
        aturan = request.form.get('aturan', '').strip()

        if not nama:
            flash('Nama obat harus diisi.', 'danger')
            return render_template('admin/tambah_obat.html')

        try:
            harga = int(harga)
            stok = int(stok)
        except ValueError:
            flash('Harga dan stok harus berupa angka.', 'danger')
            return render_template('admin/tambah_obat.html')

        if harga < 0 or stok < 0:
            flash('Harga dan stok tidak boleh negatif.', 'danger')
            return render_template('admin/tambah_obat.html')

        obat = Obat(
            nama=nama,
            harga=harga,
            stok=stok,
            deskripsi=deskripsi,
            aturan_pakai=aturan,
            foto=''
        )

        db.session.add(obat)
        db.session.commit()

        flash('Obat berhasil ditambahkan!', 'success')
        return redirect(url_for('admin.dashboard'))

    return render_template('admin/tambah_obat.html')

@admin.route('/edit-obat/<int:id>', methods=['GET', 'POST'])
@login_required
@admin_required
def edit_obat(id):
    obat = Obat.query.get_or_404(id)

    if request.method == 'POST':
        nama = request.form.get('nama', '').strip()
        harga = request.form.get('harga', '0')
        stok = request.form.get('stok', '0')
        deskripsi = request.form.get('deskripsi', '').strip()
        aturan = request.form.get('aturan', '').strip()

        if not nama:
            flash('Nama obat harus diisi.', 'danger')
            return render_template('admin/edit_obat.html', obat=obat)

        try:
            harga = int(harga)
            stok = int(stok)
        except ValueError:
            flash('Harga dan stok harus berupa angka.', 'danger')
            return render_template('admin/edit_obat.html', obat=obat)

        obat.nama = nama
        obat.harga = harga
        obat.stok = stok
        obat.deskripsi = deskripsi
        obat.aturan_pakai = aturan

        db.session.commit()

        flash('Obat berhasil diperbarui!', 'success')
        return redirect(url_for('admin.dashboard'))

    return render_template('admin/edit_obat.html', obat=obat)

@admin.route('/hapus-obat/<int:id>', methods=['POST'])
@login_required
@admin_required
def hapus_obat(id):
    obat = Obat.query.get_or_404(id)

    db.session.delete(obat)
    db.session.commit()

    flash('Obat berhasil dihapus.', 'success')
    return redirect(url_for('admin.dashboard'))