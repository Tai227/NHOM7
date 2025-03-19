from django.db import models

class NguoiDung(models.Model):
    VAI_TRO_CHOICES = [
        ('NguoiDung', 'Người Dùng'),
        ('QuanTriVien', 'Quản Trị Viên'),
    ]
    ten_dang_nhap = models.CharField(max_length=50)
    email = models.EmailField(max_length=100)
    mat_khau = models.CharField(max_length=255)
    vai_tro = models.CharField(max_length=20, choices=VAI_TRO_CHOICES)

class Phim(models.Model):
    tieu_de = models.CharField(max_length=100)
    the_loai = models.CharField(max_length=50)
    thoi_luong = models.IntegerField()
    ngay_phat_hanh = models.DateField()
    anh_phim = models.ImageField(upload_to='phim/') 
    dao_dien=models.CharField(max_length=100)

class Ve(models.Model):
    nguoi_dung = models.ForeignKey(NguoiDung, on_delete=models.CASCADE)
    phim = models.ForeignKey(Phim, on_delete=models.CASCADE)
    thoi_gian_chieu = models.DateTimeField()

class DanhGia(models.Model):
    nguoi_dung = models.ForeignKey(NguoiDung, on_delete=models.CASCADE)
    phim = models.ForeignKey(Phim, on_delete=models.CASCADE)
    diem_danh_gia = models.PositiveSmallIntegerField()
    binh_luan = models.TextField()
    ngay_danh_gia = models.DateTimeField(auto_now_add=True)

class QuanTriVien(models.Model):
    nguoi_dung = models.ForeignKey(NguoiDung, on_delete=models.CASCADE)


class ChiNhanh(models.Model):
    ten_chi_nhanh = models.CharField(max_length=100)
    dia_chi = models.TextField()


