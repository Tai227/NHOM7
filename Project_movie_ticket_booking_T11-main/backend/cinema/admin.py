from django.contrib import admin
from .models import (
    chi_nhanh, phong, ghe, phim, lich_chieu,
    nguoi_dung, vai_tro, nguoi_dung_vai_tro, ve, hoa_don, bai_viet, thanh_toan
)

admin.site.register(chi_nhanh)
admin.site.register(phong)
admin.site.register(ghe)
admin.site.register(phim)
admin.site.register(lich_chieu)
admin.site.register(nguoi_dung)
admin.site.register(vai_tro)
admin.site.register(nguoi_dung_vai_tro)
admin.site.register(ve)
admin.site.register(hoa_don)
admin.site.register(bai_viet)
admin.site.register(thanh_toan)
