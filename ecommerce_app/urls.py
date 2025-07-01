from django.urls import path
from ecommerce_app import views

urlpatterns = [
    path('',views.index, name="index"),
    path('contact/',views.contact, name="contact"),
    path('about/',views.about, name="about"),
    path('cart/',views.cart, name="cart"),
    path('checkout/',views.checkout, name="checkout"),
    path('myProfile/',views.myProfile, name="myProfile"),
    path('category/<str:category>/', views.category_view, name='category'),
    path('esewa_payment/', views.esewa_payment, name="esewa_payment"),
    path('esewa_verify/', views.esewa_verify, name="esewa_verify"),
    path('payment_failed/', views.payment_failed, name="payment_failed"),
]
