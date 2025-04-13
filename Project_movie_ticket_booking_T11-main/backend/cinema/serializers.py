from rest_framework import serializers
from .models import (
    chi_nhanh, phong, ghe, phim, lich_chieu, nguoi_dung, vai_tro, 
    nguoi_dung_vai_tro, ve, hoa_don, bai_viet, thanh_toan
)

class chi_nhanhSerializer(serializers.ModelSerializer):
    class Meta:
        model = chi_nhanh
        fields = '__all__'

class phongSerializer(serializers.ModelSerializer):
    class Meta:
        model = phong
        fields = '__all__'

class gheSerializer(serializers.ModelSerializer):
    class Meta:
        model = ghe
        fields = '__all__'

class phimSerializer(serializers.ModelSerializer):
    class Meta:
        model = phim
        fields = '__all__'

class lich_chieuSerializer(serializers.ModelSerializer):
    class Meta:
        model = lich_chieu
        fields = '__all__'

class nguoi_dungSerializer(serializers.ModelSerializer):
    class Meta:
        model = nguoi_dung
        fields = ['id', 'ten_dang_nhap', 'mat_khau', 'ten', 'email']  # Điều chỉnh theo model
        extra_kwargs = {
            'mat_khau': {'write_only': True},
        }

class DangNhapSerializer(serializers.Serializer):
    ten_dang_nhap = serializers.CharField(max_length=100)
    mat_khau = serializers.CharField(max_length=128)

class vai_troSerializer(serializers.ModelSerializer):
    class Meta:
        model = vai_tro
        fields = '__all__'

class nguoi_dung_vai_troSerializer(serializers.ModelSerializer):
    class Meta:
        model = nguoi_dung_vai_tro
        fields = '__all__'

class veSerializer(serializers.ModelSerializer):
    class Meta:
        model = ve
        fields = '__all__'

class hoa_donSerializer(serializers.ModelSerializer):
    class Meta:
        model = hoa_don
        fields = '__all__'

class bai_vietSerializer(serializers.ModelSerializer):
    class Meta:
        model = bai_viet
        fields = '__all__'

class thanh_toanSerializer(serializers.ModelSerializer):
    class Meta:
        model = thanh_toan
        fields = '__all__'
