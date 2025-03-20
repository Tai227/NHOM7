from rest_framework import serializers
from .models import NguoiDung, Phim, Ve, DanhGia, QuanTriVien,ChiNhanh

class NguoiDungSerializer(serializers.ModelSerializer):
    class Meta:
        model = NguoiDung
        fields = '__all__'

class PhimSerializer(serializers.ModelSerializer):
    class Meta:
        model = Phim
        fields = '__all__'

class VeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ve
        fields = '__all__'

class DanhGiaSerializer(serializers.ModelSerializer):
    class Meta:
        model = DanhGia
        fields = '__all__'

class QuanTriVienSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuanTriVien
        fields = '__all__'

class ChiNhanhSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChiNhanh
        fields = '__all__'
