from django.contrib import admin

from .models import Stock, Product

admin.site.register(Product)
admin.site.register(Stock)