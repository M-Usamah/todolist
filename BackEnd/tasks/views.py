from django.http import HttpResponse
from django.shortcuts import redirect, render 
from .models import Task
from .forms import TaskForm,TaskSerializer
from rest_framework import generics
# Create your views here.


# simple views
def index(request):
    tasks = Task.objects.all()
    
    form = TaskForm()
    
    if request.method=='POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            form.save()
        return redirect('/')
    
    
    context = {'tasks':tasks,
               'form': form }
    
    return render(request,'tasks/list.html',context)

def updateTask(request,pk):
    task = Task.objects.get(id=pk)
    form = TaskForm(instance=task)
    if request.method=="POST":
        form = TaskForm(request.POST,instance=task)
        if form.is_valid():
            form.save()
            return redirect('/')
    context = {'form': form }
    return render(request,'tasks/update_form.html',context)

def deleteTask(request,pk):
    item = Task.objects.get(id=pk)
    if request.method =="POST":
        item.delete()
        return redirect('/')
    context = {'item': item }
    return render(request,'tasks/delete.html',context)



# api views

class TaskList(generics.ListCreateAPIView):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer


class TaskDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer