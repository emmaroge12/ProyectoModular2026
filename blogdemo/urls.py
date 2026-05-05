from django.urls import path
from .views import StudentCreateView, StudentListView

urlpatterns = [
    path('', StudentListView.as_view(), name='student-list'),
    path('students/new/', StudentCreateView.as_view(), name='student-create'),
]