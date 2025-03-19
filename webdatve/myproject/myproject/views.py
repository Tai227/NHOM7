#from django.http import HttpResponse
from django.shortcuts import render

def homepage(request):
   # return HttpResponse("Xin chào Django")
    return render(request, 'home.html')

def gioithieupage(request):
   # return HttpResponse("Đây là trang giới thiệu")
    return render(request, 'gioithieu.html')

def datvepage(request):
    #return HttpResponse("Đây là trang đặt vé")
     return render(request, 'datve.html')

def thanhtoanpage(request):
    #return HttpResponse("Đây là trang thanh toán")
     return render(request, 'thanhtoan.html')

def dangnhappage(request):
    #return HttpResponse("Đăng nhập")
     return render(request, 'dangnhap.html')

def dangkypage(request):
    #return HttpResponse("Đăng ký")
     return render(request, 'Dangky.html')
