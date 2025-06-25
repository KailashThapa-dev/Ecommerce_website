from django.shortcuts import redirect
from django.urls import reverse

class BlockAdminOnMainSiteMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
           # Allow admin pages
        if request.path.startswith(reverse('admin:index').replace('/index/', '/')):
               return self.get_response(request)
           # If user is superuser or staff and not on admin page, log them out but stay on the same page
        if request.user.is_authenticated and (request.user.is_superuser or request.user.is_staff):
            from django.contrib.auth import logout
            logout(request)
               # Optionally, add a message here
               # Just continue to the requested page (base.html will show as normal, but user is logged out)
        if request.user.is_authenticated and (request.user.is_superuser or request.user.is_staff):
            from django.contrib.auth import logout
            logout(request)
               # Optionally, add a message here
            return redirect('/admin/login/?next=/admin/')  # or redirect to a custom page
        return self.get_response(request)