from rest_framework import serializers
from django.db import models
from restcomplaints.models import Complaints,Account

class ComplaintsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Complaints
        fields = ['id','account','title','description','rating','gender','type_data','occurrence','platforms',"status"]
    
class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields=['id','email','admin']