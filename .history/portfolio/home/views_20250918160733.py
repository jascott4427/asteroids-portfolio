from django.shortcuts import render
from django.http import FileResponse

def home(request):
    return render(request, 'home/home.html')

def resume(request):
    # Serve a resume PDF
    return FileResponse(open('static/resume.pdf', 'rb'), content_type='application/pdf')

def projects(request):
    return render(request, 'home/projects.html')

def game_projects(request):
    return render(request, 'home/game_projects.html')