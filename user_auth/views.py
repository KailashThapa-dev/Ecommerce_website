from django.shortcuts import render, redirect,HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages

# Create your views here.
def signup(request):
    if request.method == "POST":
        email = request.POST.get('email', '').strip()
        password = request.POST.get('password', '')
        confirm_password = request.POST.get('confirm_password', '')

        if not email or not password or not confirm_password:
            messages.warning(request, "All fields are required.")
            return render(request, 'authentication/signup.html')

        if password != confirm_password:
            messages.warning(request, "Passwords do not match!")
            return render(request, 'authentication/signup.html')

        if User.objects.filter(username=email).exists():
            messages.warning(request, "Email already taken!")
            return render(request, 'authentication/signup.html')

        try:
            user = User.objects.create_user(username=email, email=email, password=password)
            user.save()
            messages.success(request, "Account created successfully!")
            return redirect('handlelogin')
        except Exception as e:
            messages.error(request, "Error creating account. Please try again.")
            return render(request, 'authentication/signup.html')

    return render(request, "authentication/signup.html")
def handlelogin(request):
    if request.method == "POST":
        email = request.POST.get('email', '').strip()
        password = request.POST.get('password', '')
        confirm_password = request.POST.get('confirm_password', '')

        if not email or not password or not confirm_password:
            messages.warning(request, "All fields are required.")
            return render(request, 'authentication/login.html')

        if password != confirm_password:
            messages.warning(request, "Passwords do not match!")
            return render(request, 'authentication/login.html')

        from django.contrib.auth import authenticate, login

        user = authenticate(request, username=email, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "Logged in successfully!")
            return redirect('/')
        else:
            messages.error(request, "Invalid email or password.")
            return render(request, 'authentication/login.html')
        
    return render(request, "authentication/login.html")

def handlelogout(request):
    return redirect(request, '/auth/login')
