from django.urls import path
from .views import NguoiDungListCreate, PhimListCreate, VeListCreate, DanhGiaListCreate, QuanTriVienListCreate, ChiNhanhListCreate
from django.conf import settings
from django.conf.urls.static import static
from rest_framework.views import APIView
from rest_framework.response import Response


urlpatterns = [
    path('nguoidung/', NguoiDungListCreate.as_view(), name='nguoidung-api'),
    path('phim/', PhimListCreate.as_view(), name='phim-api'),
    path('ve/', VeListCreate.as_view(), name='ve-api'),
    path('danhgia/', DanhGiaListCreate.as_view(), name='danhgia-api'),
    path('quantrivien/', QuanTriVienListCreate.as_view(), name='quantrivien-api'),
    path('chinhanh/', ChiNhanhListCreate.as_view(), name='chinhanh-api'),
]
#thêm để up ảnh 
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)