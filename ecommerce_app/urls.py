from django.urls import path
from ecommerce_app import views

urlpatterns = [
    path('',views.index, name="index"),
    path('contact/',views.contact, name="contact"),
    path('about/',views.about, name="about"),
    path('',views.index, name="index"),
    
]
