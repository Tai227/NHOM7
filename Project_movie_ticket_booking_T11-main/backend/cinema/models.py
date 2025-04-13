from django.db import models

class chi_nhanh(models.Model):
    ten = models.CharField(max_length=255)
    dia_chi = models.CharField(max_length=255)
    so_dien_thoai = models.CharField(max_length=20)
    duong_dan_anh = models.URLField(max_length=1000, blank=True, null=True)
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)

class phong(models.Model):
    ten = models.CharField(max_length=255)
    suc_chua = models.IntegerField()
    tong_dien_tich = models.FloatField()
    chi_nhanh = models.ForeignKey(chi_nhanh, on_delete=models.CASCADE)
    duong_dan_anh = models.URLField(max_length=1000, blank=True, null=True)

class ghe(models.Model):
    ten = models.CharField(max_length=255)
    loai_ghe = models.IntegerField()
    phong = models.ForeignKey(phong, on_delete=models.CASCADE)

class phim(models.Model):
    ten = models.CharField(max_length=255)
    dao_dien = models.CharField(max_length=255)
    dien_vien = models.TextField()
    the_loai = models.CharField(max_length=255)
    ngon_ngu = models.CharField(max_length=100)
    danh_gia = models.CharField(max_length=100)
    ngay_phat_hanh = models.DateField()
    trailer = models.URLField(max_length=1000, blank=True, null=True)
    mo_ta_ngan = models.TextField()
    mo_ta_dai = models.TextField()
    dang_chieu = models.BooleanField(default=False)
    duong_dan_anh = models.URLField(max_length=255)
    gia_ve = models.FloatField(null=True, blank=True)  # Thêm trường gia_ve
    banner = models.URLField(max_length=255, default='https://example.com/no_banner.jpg')

class lich_chieu(models.Model):
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)
    ngay_bat_dau = models.DateField()
    gio_bat_dau = models.TimeField()
    chi_nhanh = models.ForeignKey(chi_nhanh, on_delete=models.CASCADE)
    phim = models.ForeignKey(phim, on_delete=models.CASCADE)
    phong = models.ForeignKey(phong, on_delete=models.CASCADE)

class nguoi_dung(models.Model):
    ten = models.CharField(max_length=255)
    email = models.EmailField(max_length=100, unique=True)
    mat_khau = models.CharField(max_length=100)
    ten_dang_nhap = models.CharField(max_length=15, unique=True)
    duong_dan_anh = models.URLField(max_length=100, blank=True, null=True)
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)

class vai_tro(models.Model):
    ten = models.CharField(max_length=60)

class nguoi_dung_vai_tro(models.Model):
    nguoi_dung = models.ForeignKey(nguoi_dung, on_delete=models.CASCADE)
    vai_tro = models.ForeignKey(vai_tro, on_delete=models.CASCADE)

class ve(models.Model):
    lich_chieu = models.ForeignKey(lich_chieu, on_delete=models.CASCADE)
    ghe = models.ForeignKey(ghe, on_delete=models.CASCADE)
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)

class hoa_don(models.Model):
    nguoi_dung = models.ForeignKey(nguoi_dung, on_delete=models.CASCADE)
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)

class bai_viet(models.Model):
    tieu_de = models.CharField(max_length=255)
    tom_tat = models.TextField()
    anh_chinh = models.URLField(max_length=255)
    trang_thai = models.IntegerField()
    loai = models.IntegerField()
    ngay_tao = models.DateTimeField(auto_now_add=True)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)
    
class thanh_toan(models.Model):
    nguoidung = models.ForeignKey('nguoi_dung', on_delete=models.CASCADE, null=False) 
    ve = models.JSONField(null=False)  # JSON
    phuongthucthanhtoan = models.CharField(max_length=50, null=False) 
    trangthai = models.IntegerField(default=0, null=False)  
    ngay_tao = models.DateTimeField(auto_now_add=True, null=False)  
    ngay_cap_nhat = models.DateTimeField(null=True, blank=True)  
    tong_gia_ve = models.BigIntegerField(null=True, blank=True)     

    
# Thêm model PasswordResetCode
class PasswordResetCode(models.Model):
    nguoi_dung = models.ForeignKey(nguoi_dung, on_delete=models.CASCADE)
    code = models.CharField(max_length=6)
    created_at = models.DateTimeField(auto_now_add=True)
    expires_at = models.DateTimeField()

    def __str__(self):
        return f"Reset code {self.code} for {self.nguoi_dung.email}"
