from rest_framework import generics
from .models import NguoiDung, Phim, Ve, DanhGia, QuanTriVien, ChiNhanh
from .serializers import NguoiDungSerializer, PhimSerializer, VeSerializer, DanhGiaSerializer, QuanTriVienSerializer, ChiNhanhSerializer
from rest_framework.parsers import MultiPartParser, FormParser #cho phép upload file ảnh
from django.shortcuts import render
from .models import Phim


def homepage(request):
    now_showing = Phim.objects.filter(is_now_showing=True)
    coming_soon = Phim.objects.filter(is_now_showing=False)
    
    return render(request, 'homepage.html', {
        "now_showing": now_showing,
        "coming_soon": coming_soon
    })

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



from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

@api_view(['GET', 'POST'])
def phim_list(request):
    if request.method == 'GET':
        phim = Phim.objects.all()
        serializer = PhimSerializer(phim, many=True)
        return Response(serializer.data)
    
    elif request.method == 'POST':
        serializer = PhimSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# hàm đăng nhập
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from .forms import LoginForm
from .models import NguoiDung

def dang_nhap(request):
    form = LoginForm(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            email = form.cleaned_data.get("email")
            password = form.cleaned_data.get("password")
            user = authenticate(username=email, password=password)
            if user:
                login(request, user)
                return redirect("trang_chu")  
    return render(request, "login.html", {"form": form})


