# Create your views here.

from django.views.generic import CreateView, ListView
from django.urls import reverse_lazy
from .models import Student
from .forms import StudentForm

class StudentCreateView(CreateView):
    model = Student
    form_class = StudentForm
    template_name = "students/partials/add_form_student.html"
    context_object_name = 'form'
    success_url = reverse_lazy("student-list")  # Redirige a la lista de estudiantes al guardar



class StudentListView(ListView):
    model = Student
    template_name = "students/students_dashboard.html"   # el template que usaremos
    context_object_name = "students"

