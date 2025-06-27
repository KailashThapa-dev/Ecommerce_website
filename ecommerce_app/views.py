from django.shortcuts import render
from ecommerce_app.models import Product
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages
# Create your views here.
def index(request):
    allProduct = Product.objects.all()
    return render(request, 'index.html', {'allProduct': allProduct, 'selected_category': 'All'})

def contact(request):
    return render(request,"contact.html")

def about(request):
    return render(request,"about.html")


def cart(request):
    return render(request, "cart.html")

def checkout(request):
    
    if not request.user.is_authenticated:
        messages.warning(request, "You must be logged in to checkout.")
        return render(request, "authentication/login.html")

    return render(request, "checkout.html")

def category_view(request, category):
    if category == "All":
        products = Product.objects.all()
    else:
        products = Product.objects.filter(category=category)
    return render(request, 'index.html', {'allProduct': products, 'selected_category': category})