from django.urls import path
from .views import deleteTask, index, updateTask,TaskList



urlpatterns = [
    path('',index,name='home'),
    path('update_task/<str:pk>',updateTask,name='update_task'),
    path('delete/<str:pk>',deleteTask,name='delete_task'),
    path('api_data/', TaskList.as_view()),
]
