from django.db import models

# Create your models here.


from django.db import models

class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    subcategory = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    desc = models.CharField(max_length=300)
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.product_name



