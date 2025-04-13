from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import (
    chi_nhanhViewSet, phongViewSet, gheViewSet, phimViewSet, lich_chieuViewSet,
    nguoi_dungViewSet, vai_troViewSet, nguoi_dung_vai_troViewSet, veViewSet,
    hoa_donViewSet, bai_vietViewSet, thanh_toanViewSet, ForgotPasswordView, ResetPasswordView
)

router = DefaultRouter()
router.register(r'chi_nhanh', chi_nhanhViewSet)
router.register(r'phong', phongViewSet)
router.register(r'ghe', gheViewSet)
router.register(r'phim', phimViewSet, basename="phim")
router.register(r'lich_chieu', lich_chieuViewSet)
router.register(r'nguoi_dung', nguoi_dungViewSet, basename='nguoi_dung')
router.register(r'vai_tro', vai_troViewSet)
router.register(r'nguoi_dung_vai_tro', nguoi_dung_vai_troViewSet)
router.register(r've', veViewSet)
router.register(r'hoa_don', hoa_donViewSet)
router.register(r'bai_viet', bai_vietViewSet)
router.register(r'thanh_toan', thanh_toanViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('forgot-password/', ForgotPasswordView.as_view(), name='forgot-password'),
    path('reset-password/', ResetPasswordView.as_view(), name='reset-password'),
]