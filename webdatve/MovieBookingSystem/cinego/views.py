from rest_framework import generics
from .models import NguoiDung, Phim, Ve, DanhGia, QuanTriVien, ChiNhanh
from .serializers import NguoiDungSerializer, PhimSerializer, VeSerializer, DanhGiaSerializer, QuanTriVienSerializer, ChiNhanhSerializer
from rest_framework.parsers import MultiPartParser, FormParser #cho phép upload file ảnh

class NguoiDungListCreate(generics.ListCreateAPIView):
    queryset = NguoiDung.objects.all()
    serializer_class = NguoiDungSerializer

class ThemPhim(generics.CreateAPIView):
    queryset = Phim.objects.all()
    serializer_class = PhimSerializer
    #thêm
    
class PhimListCreate(generics.ListCreateAPIView):
    queryset = Phim.objects.all()
    serializer_class = PhimSerializer


class VeListCreate(generics.ListCreateAPIView):
    queryset = Ve.objects.all()
    serializer_class = VeSerializer

class DanhGiaListCreate(generics.ListCreateAPIView):
    queryset = DanhGia.objects.all()
    serializer_class = DanhGiaSerializer

class QuanTriVienListCreate(generics.ListCreateAPIView):
    queryset = QuanTriVien.objects.all()
    serializer_class = QuanTriVienSerializer

class ChiNhanhListCreate(generics.ListCreateAPIView):
    queryset = ChiNhanh.objects.all()
    serializer_class = ChiNhanhSerializer
