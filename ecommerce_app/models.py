from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    subcategory = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    desc = models.CharField(max_length=300)
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return f"{self.product_name}"


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date_ordered = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=20, default='Pending')
    is_delivered = models.BooleanField(default=False)

    def __str__(self):
        return f"Order #{self.id} by {self.user.username} - {self.status}"


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.quantity} x {self.product.product_name} in Order #{self.order.id}"


class ShippingAddress(models.Model):
    order = models.OneToOneField(Order, on_delete=models.CASCADE, related_name='shipping')
    name = models.CharField(max_length=100)
    email = models.EmailField()
    address = models.TextField()
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    zip_code = models.CharField(max_length=10)
    phone = models.CharField(max_length=15)

    def __str__(self):
        return f"Shipping for Order #{self.order.id} - {self.name}, {self.city}"
