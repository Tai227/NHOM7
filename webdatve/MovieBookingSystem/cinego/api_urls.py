from django.urls import path
from .views import phim_list

urlpatterns = [
    path('phim/', phim_list, name='api-phim'),
]
