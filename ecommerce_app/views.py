from django.shortcuts import render,redirect
from ecommerce_app.models import Product
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages
import json
from .models import Order, OrderItem, ShippingAddress, Product
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
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
        return redirect('handlelogin')
    
    if request.method == 'POST':
        data = json.loads(request.body)
        cart = data.get('cart', [])
        shipping = data.get('shipping', {})
        order = Order.objects.create(user=request.user, status='Pending', is_delivered=False)

        ShippingAddress.objects.create(
            order=order,
            name=shipping['name'],
            email=shipping['email'],
            address=shipping['address'],
            city=shipping['city'],
            state=shipping['state'],
            zip_code=shipping['zipcode'],
            phone=shipping['phone'],
        )

        for item in cart:
            product = Product.objects.get(product_id=item['product_id'])
            OrderItem.objects.create(
                order=order,
                product=product,
                quantity=item['quantity'],
                price=product.price
            )

        return JsonResponse({'success': True})

    # For GET request, we'll let JavaScript handle cart display
    return render(request, "checkout.html")

def category_view(request, category):
    if category == "All":
        products = Product.objects.all()
    else:
        products = Product.objects.filter(category=category)
    return render(request, 'index.html', {'allProduct': products, 'selected_category': category})

def myProfile(request):
    
    return render(request,"myProfile.html")