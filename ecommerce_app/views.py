from django.shortcuts import render,redirect,get_list_or_404, get_object_or_404
from ecommerce_app.models import Product
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages
import json
from .models import Order, OrderItem, ShippingAddress, Product
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
import hmac, hashlib, base64
import requests

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


@login_required
def checkout(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            cart = data.get('cart', {})
            shipping = data.get('shipping', {})
            # Store in session for use after payment
            request.session['cart'] = cart
            request.session['shipping'] = shipping
            return JsonResponse({'success': True})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})
    return render(request, "checkout.html")

def category_view(request, category):
    if category == "All":
        products = Product.objects.all()
    else:
        products = Product.objects.filter(category=category)
    return render(request, 'index.html', {'allProduct': products, 'selected_category': category})

def myProfile(request):
    
    return render(request,"myProfile.html")

@login_required
def esewa_payment(request):
    cart = request.session.get('cart')
    shipping = request.session.get('shipping')
    if not cart or not shipping:
        return redirect('checkout')

    # Calculate total
    total_amount = sum(Product.objects.get(product_id=int(pid)).price * item['quantity'] for pid, item in cart.items())
    total_amount = int(total_amount)
    product_code = "ECOM"  # or any static code, or generate a temp order code
    merchant_code = 'EPAYTEST'
    secret_key = '8gBm/:&EnhH.1/q'

    raw_data = f"{total_amount},{product_code},{merchant_code}"
    signature = base64.b64encode(
        hmac.new(secret_key.encode(), raw_data.encode(), hashlib.sha256).digest()
    ).decode()

    context = {
        'totalAmount': total_amount,
        'productCode': product_code,
        'merchantCode': merchant_code,
        'signature': signature,
        'success_url': request.build_absolute_uri('/esewa_verify/'),
        'failure_url': request.build_absolute_uri('/payment_failed/')
    }
    return render(request, "esewa_payment.html", context)

@login_required
def esewa_verify(request):
    ref_id = request.GET.get('refId')
    cart = request.session.get('cart')
    shipping = request.session.get('shipping')
    if not ref_id or not cart or not shipping:
        return render(request, "payment_failed.html", {'error': 'Missing payment or session data.'})

    total_amount = sum(Product.objects.get(product_id=int(pid)).price * item['quantity'] for pid, item in cart.items())
    total_amount = int(total_amount)
    product_code = "ECOM"
    merchant_code = 'EPAYTEST'
    secret_key = '8gBm/:&EnhH.1/q'

    # Generate signature for verification
    raw_data = f"{total_amount},{product_code},{merchant_code}"
    signature = base64.b64encode(
        hmac.new(secret_key.encode(), raw_data.encode(), hashlib.sha256).digest()
    ).decode()

    # Call eSewa API to verify payment
    payload = {
        'totalAmount': total_amount,
        'productCode': product_code,
        'merchantCode': merchant_code,
        'signature': signature,
        'refId': ref_id,
    }
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    response = requests.post('https://rc-epay.esewa.com.np/api/epay/main/v2/form', data=payload, headers=headers)

    try:
        result = response.json()
        # Only create order if payment is confirmed by eSewa
        if result.get('status') == 'COMPLETE':
            order = Order.objects.create(user=request.user, status='Paid', is_delivered=False)
            for pid, item in cart.items():
                product = Product.objects.get(product_id=int(pid))
                OrderItem.objects.create(
                    order=order,
                    product=product,
                    quantity=item['quantity'],
                    price=product.price
                )
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
            # Clear session
            del request.session['cart']
            del request.session['shipping']
            return render(request, "payment_successful.html", {'order': order})
        else:
            # Payment not successful
            return render(request, "payment_failed.html", {'error': result.get('message', 'Payment failed')})
    except Exception as e:
        return render(request, "payment_failed.html", {'error': str(e)})

    
def payment_failed(request):
    return render(request,"payment_failed.html")


 
