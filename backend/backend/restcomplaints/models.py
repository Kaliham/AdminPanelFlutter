from django.db import models
from django.db.models.fields import EmailField
from django import forms

# Create your models here.
class Account(models.Model):
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=24)
    def __str__(self):
        return self.email
    
class Complaints(models.Model):
    account = models.ForeignKey(Account,on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    description =  models.TextField()
    rating = models.IntegerField()
    gender = models.CharField(max_length=10)
    type_data = models.CharField(max_length=10)
    occurrence = models.IntegerField()
    platforms= models.TextField()
    status = models.CharField(max_length=100,default="pending resolution")
    def __str__(self):
        return self.title

