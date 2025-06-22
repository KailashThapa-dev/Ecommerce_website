from django.urls import path
from ecommerce_app import views

urlpatterns = [
    path('',views.index, name="index")
    
]
