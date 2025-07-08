from django.contrib import admin
from .models import Product, Order, OrderItem, ShippingAddress
# Register your models here.
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(ShippingAddress)

#Change the admin header
admin.site.site_header = "Admin Dashboard"
admin.site.site_title = "Admin"
admin.site.index_title = "Welcome to Electrolite Admin Dashboard"