from django.urls import path
from .views import deleteTask, index, updateTask

urlpatterns = [
    path('',index,name='home'),
    path('update_task/<str:pk>',updateTask,name='update_task'),
    path('delete/<str:pk>',deleteTask,name='delete_task')
]
