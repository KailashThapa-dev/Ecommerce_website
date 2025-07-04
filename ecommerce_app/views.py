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
import uuid

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
            request.session['cart'] = cart
            request.session['shipping'] = shipping
            request.session.modified = True  # Ensure session is saved
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

@login_required
def myProfile(request):
    user = request.user
    orders = Order.objects.filter(user=user).order_by('-date_ordered')
    total_orders = orders.count()
    total_spent = sum(
        sum(item.price * item.quantity for item in order.items.all())
        for order in orders
    )
    # Prepare order history data
    order_history = []
    for order in orders:
        for item in order.items.all():
            order_history.append({
                'order_id': order.id,
                'product': item.product.product_name,
                'quantity': item.quantity,
                'price': item.price,
                'date': order.date_ordered,
                'status': order.status,
                'is_delivered': order.is_delivered,
            })
    context = {
        'user': user,
        'total_orders': total_orders,
        'total_spent': total_spent,
        'order_history': order_history,
    }
    return render(request, "myProfile.html", context)

@login_required
def esewa_payment(request):
    cart = request.session.get('cart')
    shipping = request.session.get('shipping')
    if not cart or not shipping:
        return redirect('checkout')

    # Calculate total
    total_amount = sum(Product.objects.get(product_id=int(pid)).price * item['quantity'] for pid, item in cart.items())
    total_amount = int(total_amount)
 
 #Generate the unique transaction uuid
   
    transaction_uuid = str(uuid.uuid4())

#Store transaction uuid in session for verification

    request.session['transaction_uuid'] = transaction_uuid

#Esewa configuration

    product_code = "EPAYTEST"  # Use EPAYTEST for testing
    merchant_code = 'EPAYTEST'
    secret_key = '8gBm/:&EnhH.1/q'

    #Create message for the signature (format:total_amount,transaction_uuid,product_code)
    message = f"total_amount={total_amount},transaction_uuid={transaction_uuid},product_code={product_code}"

    #Generate the signature
    signature = base64.b64encode(
        hmac.new(secret_key.encode(), message.encode(), hashlib.sha256).digest()
    ).decode()

    context = {
        'amount': total_amount,
        'tax_amount': 0,
        'total_amount': total_amount,
        'transaction_uuid': transaction_uuid,
        'product_code': product_code,
        'product_service_charge': 0,
        'product_delivery_charge': 0,
        'success_url': request.build_absolute_uri('/esewa_verify/'),
        'failure_url': request.build_absolute_uri('/payment_failed/'),
        'signed_field_names': 'total_amount,transaction_uuid,product_code',
        'signature': signature
    }
    print("Session cart:", request.session.get('cart'))
    print("Session shipping:", request.session.get('shipping'))
                
    return render(request, "esewa_payment.html", context)

@login_required
def esewa_verify(request):
    data_param = request.GET.get('data')
    if not data_param:
        return render(request, "payment_failed.html", {'error': 'Missing payment data from eSewa.'})

    try:
        decoded = base64.b64decode(data_param).decode('utf-8')
        esewa_data = json.loads(decoded)
    except Exception as e:
        return render(request, "payment_failed.html", {'error': f'Failed to decode eSewa data: {str(e)}'})

    status = esewa_data.get('status')
    transaction_uuid = esewa_data.get('transaction_uuid')
    total_amount = esewa_data.get('total_amount')

    cart = request.session.get('cart')
    shipping = request.session.get('shipping')

    if not cart or not shipping or not transaction_uuid:
        return render(request, 'payment_failed.html', {'error': 'Missing payment or session data.'})

    if status == 'COMPLETE':
        # Create order
        order = Order.objects.create(
            user=request.user,
            status='Paid',
            is_delivered=False
        )
        # Create order items
        for pid, item in cart.items():
            product = Product.objects.get(product_id=int(pid))
            OrderItem.objects.create(
                order=order,
                product=product,
                quantity=item['quantity'],
                price=product.price
            )
        # Create shipping address
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
        del request.session['transaction_uuid']
        return render(request, "payment_successful.html", {'order': order})
    else:
        return render(request, "payment_failed.html", {'error': f'Payment not complete. Status: {status}'})

def payment_failed(request):
    return render(request,"payment_failed.html")

def view_details(request, product_id):
    product = get_object_or_404(Product, product_id=product_id)
    context = {
        'product': product
    }
    return render(request, "view_details.html", context)


 
