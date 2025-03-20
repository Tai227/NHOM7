from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models

class NguoiDungManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("Người dùng phải có email")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_admin', True)
        return self.create_user(email, password, **extra_fields)

class NguoiDung(AbstractBaseUser):
    email = models.EmailField(unique=True)
    ho_ten = models.CharField(max_length=100, null=True, blank=True, default="Unknown")
    so_dien_thoai = models.CharField(max_length=15, unique=True, null=True, blank=True)
    password = models.CharField(max_length=128, null=True, blank=True)  # Cần thêm null=True
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = NguoiDungManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['ho_ten']

    def __str__(self):
        return self.email

    @property
    def is_staff(self):
        return self.is_admin

class Phim(models.Model):
    tieu_de = models.CharField(max_length=100)
    the_loai = models.CharField(max_length=50)
    thoi_luong = models.IntegerField()
    ngay_phat_hanh = models.DateField()
    anh_phim = models.ImageField(upload_to='phim/') 
    dao_dien=models.CharField(max_length=100)
    
    is_now_showing = models.BooleanField(default=False)  # Phim đang chiếu
    coming_soon = models.BooleanField(default=False)  # Phim sắp chiếu
    def __str__(self):
        return self.tieu_de

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


