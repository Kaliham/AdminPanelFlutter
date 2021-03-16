from restcomplaints.serializers import ComplaintsSerializer,AccountSerializer
from django.http.response import JsonResponse
from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from restcomplaints.models import Account, Complaints

# Create your views here.
@api_view(['POST'])
def create_account(request):
    try:
        data = request.data
        email = data["email"].strip()
        password = data["password"].strip()
        admin = data['admin']
        
        if(len(Account.objects.filter(email=email))>0):
            return Response({"response":"Account exists","status":"failed"})
        new_account = Account.objects.create(email=email,password=password,admin=admin)
        
        new_account.save()
        return Response({"response":"Account Created!","status":"success"})
    except Exception:
        return Response({"resposne":"error occured","status":"error"})


@api_view(['POST'])
def login(request):
    try:
        data = request.data
        email = data["email"].strip()
        password = data["password"].strip()
        accounts = Account.objects.filter(email=email,password=password)
        if(len(accounts)>0):
            account=accounts.get(email=email)
            
            return Response({"response":True,"status":"success","admin":account.admin})
        return Response({"response":False,"status":"failed"})
    except Exception:
        return Response({"resposne":False,"status":"error"})

@api_view(['POST'])
def add_complaints(request):
    data = request.data
    title = data['title']
    description = data['description']
    type_data = data['type']
    occurrence = data['occurrence']
    gender = data['gender']
    platforms = ""
    for i in data['platforms']:
        platforms+=i+","
    rating = data['rating']
    account = Account.objects.get(email=data['email'])
    if (data['status']!= None):
        status =data['status']
    else:
        status ='pending resolution'
    complaint = Complaints.objects.create(status=status,title=title,description=description,occurrence=occurrence,gender=gender,platforms=platforms,rating=rating,type_data = type_data,account=account)
    complaint.save()
    return Response({"response":"Complaint added!","status":"success"})

@api_view(['POST'])
def get_complaints(request):
    try:
        data = request.data
        account = Account.objects.get(email=data['email'].strip())
        complaints = Complaints.objects.filter(account=account)
        serializer = ComplaintsSerializer(complaints,many=True)

        return Response({"response":serializer.data,"status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})
    
@api_view(['POST'])
def edit_complaints(request):
    try:
        data = request.data
        c_id = data['id']
        status = data['status']
        complaint = Complaints.objects.get(id=c_id)
        complaint.status = status
        complaint.save()

        return Response({"response":"updated!","status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})
    

@api_view(['POST'])
def get_all_complaints(request):
    try:
        complaints = Complaints.objects.all()
        serializer = ComplaintsSerializer(complaints,many=True)
        return Response({"response":serializer.data,"status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})
    

@api_view(['POST'])
def change_account(request):
    try:
        data = request.data
        email = data['email']
        admin = data['admin']
        account = Account.objects.get(email=email)
        account.admin = admin
        account.save()
        return Response({"response":"updated!","status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})

@api_view(['POST'])  
def get_accounts(request):
    try:
        account = Account.objects.all()
        serializer = AccountSerializer(account,many=True)
        return Response({"response":serializer.data,"status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})
    
@api_view(['POST'])
def change_password(request):
    try:
        data = request.data
        email = data['email']
        password = data['password']
        newpassword = data['newpassword']
        account = Account.objects.get(email=email,password=password)
        account.password = newpassword
        account.save()
        return Response({"response":"updated!","status":"success"})
    except Exception:
        return Response({"response":"error occurred!","status":"failed"})