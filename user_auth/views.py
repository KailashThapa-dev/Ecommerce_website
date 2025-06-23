from django.shortcuts import render, redirect,HttpResponse
from django.contrib.auth.models import User

# Create your views here.
def signup(request):
    # print("Checking the signin works fine")
    # if (request.method == "POST"):
    #     print("it is a post request")
    # else:
    #     print("it is get method")

    if (request.method == "POST"):
        email = request.POST['email']
        password = request.POST['password']
        confirm_password = request.POST['confirm_password']

        if password != confirm_password:
            return HttpResponse("Password is incorrect!")
            # return render(request, 'auth/signup.html')

        try: 
            if User.objects.get(username = email):
                return HttpResponse("Email is already exist!")
                # return render(request, 'auth/signup.html')

        except Exception as identifier:
            pass
        user = User.objects.create_user(email, email, password)
        user.save()
        return HttpResponse("User is created",email)
    return render(request,"authentication/signup.html")


def handlelogin(request):
    return render(request,"authentication/login.html")


def handlelogout(request):
    return redirect(request, '/auth/login')
