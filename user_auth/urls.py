from django.urls import path
from user_auth import views

urlpatterns = [
  path('signup/', views.signup, name='signup'),
  path('login/', views.handlelogin, name='handlelogin'),
  path('logout/', views.handlelogout, name='handlelogout'),
  
    
]
