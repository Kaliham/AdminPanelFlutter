from django import forms
from django.db.models import fields
from .models import *

class AccountForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model = Account
        fields =('email','password')