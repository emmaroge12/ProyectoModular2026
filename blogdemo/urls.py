from django.urls import path
from .views import StudentCreateView, StudentListView
from .views import HTMXLoginView

urlpatterns = [
    path('students/list/', StudentListView.as_view(), name='student-list'),
    path('students/new/', StudentCreateView.as_view(), name='student-create'),
    path('login/', HTMXLoginView.as_view(), name='login')
]