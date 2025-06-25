from django.shortcuts import render
from ecommerce_app.models import Product
# Create your views here.
def index(request):
    allProduct = Product.objects.all()
    return render(request, 'index.html', {'allProduct': allProduct})

def contact(request):
    return render(request,"contact.html")

def about(request):
    return render(request,"about.html")


