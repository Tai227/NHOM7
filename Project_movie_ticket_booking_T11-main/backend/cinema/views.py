from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from django.contrib.auth.hashers import check_password, make_password
from django.utils import timezone
from datetime import timedelta
import random
from django.core.mail import send_mail
from .models import (
    chi_nhanh, phong, ghe, phim, lich_chieu, nguoi_dung, vai_tro, 
    nguoi_dung_vai_tro, ve, hoa_don, bai_viet, thanh_toan, PasswordResetCode
)
from .serializers import (
    chi_nhanhSerializer, phongSerializer, gheSerializer, phimSerializer, 
    lich_chieuSerializer, nguoi_dungSerializer, DangNhapSerializer, 
    vai_troSerializer, nguoi_dung_vai_troSerializer, veSerializer, 
    hoa_donSerializer, bai_vietSerializer, thanh_toanSerializer,
)

class chi_nhanhViewSet(viewsets.ModelViewSet):
    queryset = chi_nhanh.objects.all()
    serializer_class = chi_nhanhSerializer

class phongViewSet(viewsets.ModelViewSet):
    queryset = phong.objects.all()
    serializer_class = phongSerializer


class gheViewSet(viewsets.ModelViewSet):
    queryset = ghe.objects.all()
    serializer_class = gheSerializer

    def create(self, request, *args, **kwargs):
        # Kiểm tra xem dữ liệu gửi lên là danh sách hay một bản ghi
        many = isinstance(request.data, list)
        serializer = self.get_serializer(data=request.data, many=many)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def get_queryset(self):
        lich_chieu_id = self.request.query_params.get('lich_chieu_id')
        if lich_chieu_id:
            ghe_list = ghe.objects.filter(phong__lich_chieu__id=lich_chieu_id)
            booked_ghe_ids = ve.objects.filter(lich_chieu_id=lich_chieu_id).values_list('ghe_id', flat=True)
            return ghe_list.exclude(id__in=booked_ghe_ids)
        return super().get_queryset()
    
class phimViewSet(viewsets.ModelViewSet):
    queryset = phim.objects.all()
    serializer_class = phimSerializer

    @action(detail=False, methods=['get'])
    def tim_kiem(self, request):
        phim_id = request.query_params.get('id')
        if not phim_id:
            return Response({"error": "Thiếu ID phim"}, status=400)
        
        try:
            phim_obj = phim.objects.get(id=phim_id)
            serializer = self.get_serializer(phim_obj)
            return Response(serializer.data)
        except phim.DoesNotExist:
            return Response({"error": "Không tìm thấy phim"}, status=404)
        
    

class lich_chieuViewSet(viewsets.ModelViewSet):
    queryset = lich_chieu.objects.all()
    serializer_class = lich_chieuSerializer

class nguoi_dungViewSet(viewsets.ModelViewSet):
    queryset = nguoi_dung.objects.all()
    serializer_class = nguoi_dungSerializer

    def create(self, request, *args, **kwargs):
        data = request.data.copy()
        data['mat_khau'] = make_password(data['mat_khau'])  # Mã hóa mật khẩu
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        nguoi = serializer.save()
        
        # Gán vai trò mặc định "KhachHang"
        vai_tro_mac_dinh = vai_tro.objects.get_or_create(ten='KhachHang')[0]
        nguoi_dung_vai_tro.objects.create(nguoi_dung=nguoi, vai_tro=vai_tro_mac_dinh)
        
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    @action(detail=False, methods=['post'], url_path='dang_nhap')
    def dang_nhap(self, request):
        serializer = DangNhapSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        ten_dang_nhap = serializer.validated_data['ten_dang_nhap']
        mat_khau = serializer.validated_data['mat_khau']
        
        print("Đăng nhập:", ten_dang_nhap, mat_khau)
        
        try:
            nguoi = nguoi_dung.objects.get(ten_dang_nhap=ten_dang_nhap)
            print("Hash từ DB:", nguoi.mat_khau)
            result = check_password(mat_khau, nguoi.mat_khau)
            print("So sánh mật khẩu:", result)
            
            if not result:
                print("Sai mật khẩu!")
                return Response({'error': 'Sai mật khẩu'}, status=status.HTTP_401_UNAUTHORIZED)
            
            vai_tro_list = nguoi_dung_vai_tro.objects.filter(nguoi_dung=nguoi).values_list('vai_tro__ten', flat=True)
            return Response({
                'nguoi_dung': nguoi_dungSerializer(nguoi).data,
                'vai_tro': list(vai_tro_list)
            })
        
        except nguoi_dung.DoesNotExist:
            print("Không tìm thấy tài khoản!")
            return Response({'error': 'Tài khoản không tồn tại'}, status=status.HTTP_404_NOT_FOUND)

    @action(detail=False, methods=['post'], url_path='dang-ky')
    def dang_ky(self, request):
        serializer = nguoi_dungSerializer(data=request.data)
        if serializer.is_valid():
            # Mã hóa mật khẩu trước khi lưu
            data = serializer.validated_data
            data['mat_khau'] = make_password(data['mat_khau'])
            nguoi = serializer.save()
            vai_tro_mac_dinh = vai_tro.objects.get_or_create(ten='KhachHang')[0]
            nguoi_dung_vai_tro.objects.create(nguoi_dung=nguoi, vai_tro=vai_tro_mac_dinh)
            return Response({'message': 'Đăng ký thành công'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class vai_troViewSet(viewsets.ModelViewSet):
    queryset = vai_tro.objects.all()
    serializer_class = vai_troSerializer

class nguoi_dung_vai_troViewSet(viewsets.ModelViewSet):
    queryset = nguoi_dung_vai_tro.objects.all()
    serializer_class = nguoi_dung_vai_troSerializer

class veViewSet(viewsets.ModelViewSet):
    queryset = ve.objects.all()
    serializer_class = veSerializer

class hoa_donViewSet(viewsets.ModelViewSet):
    queryset = hoa_don.objects.all()
    serializer_class = hoa_donSerializer

class bai_vietViewSet(viewsets.ModelViewSet):
    queryset = bai_viet.objects.all()
    serializer_class = bai_vietSerializer

class thanh_toanViewSet(viewsets.ModelViewSet):
    queryset = thanh_toan.objects.all()
    serializer_class = thanh_toanSerializer

class ForgotPasswordView(APIView):
    def post(self, request):
        email = request.data.get('email')

        # Kiểm tra email có tồn tại không
        try:
            user = nguoi_dung.objects.get(email=email)
        except nguoi_dung.DoesNotExist:
            return Response({'error': 'Email không tồn tại!'}, status=status.HTTP_404_NOT_FOUND)

        # Tạo mã xác nhận ngẫu nhiên (6 chữ số)
        reset_code = str(random.randint(100000, 999999))

        # Lưu mã xác nhận vào cơ sở dữ liệu
        expires_at = timezone.now() + timedelta(minutes=15)  # Hết hạn sau 15 phút
        PasswordResetCode.objects.create(
            nguoi_dung=user,
            code=reset_code,
            expires_at=expires_at
        )

        # Gửi email
        subject = 'Mã Xác Nhận Đặt Lại Mật Khẩu'
        message = f'Mã xác nhận của bạn là: {reset_code}. Mã này có hiệu lực trong 15 phút.'
        from_email = 'your-email@gmail.com'
        recipient_list = [email]

        try:
            send_mail(subject, message, from_email, recipient_list, fail_silently=False)
            return Response({'message': 'Mã xác nhận đã được gửi đến email của bạn!'}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'error': f'Gửi email thất bại: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class ResetPasswordView(APIView):
    def post(self, request):
        email = request.data.get('email')
        code = request.data.get('code')
        new_password = request.data.get('new_password')

        # Kiểm tra mã xác nhận
        try:
            reset_code = PasswordResetCode.objects.get(nguoi_dung__email=email, code=code)
            if reset_code.expires_at < timezone.now():
                return Response({'error': 'Mã xác nhận đã hết hạn!'}, status=status.HTTP_400_BAD_REQUEST)
        except PasswordResetCode.DoesNotExist:
            return Response({'error': 'Mã xác nhận không hợp lệ!'}, status=status.HTTP_400_BAD_REQUEST)

        # Cập nhật mật khẩu
        user = reset_code.nguoi_dung
        user.mat_khau = make_password(new_password)  # Mã hóa mật khẩu mới
        user.save()

        # Xóa mã xác nhận sau khi sử dụng
        reset_code.delete()

        return Response({'message': 'Đặt lại mật khẩu thành công!'}, status=status.HTTP_200_OK)