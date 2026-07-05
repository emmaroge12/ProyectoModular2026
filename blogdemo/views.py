# Create your views here.

from django.views.generic import CreateView, ListView
from django.urls import reverse_lazy
from .models import Student
from .forms import StudentForm


class StudentListView(ListView):

    """This view wiill be in charge of displaying the list of students in the student table at the dashboard
    this class access to the DB student entity and displays the student data with a for-loop from the HTML template"""

    model = Student
    template_name = "students/students_dashboard.html"   # el template que usaremos
    context_object_name = "students"


class StudentCreateView(CreateView):

    """ This view is in charge of creating a new student record the model is defined in a class variable,
    as well as the form utilized for registering the data into the form of the student class, we also define the
    template where this view will redirect to, and the context name for accessing from the html document, and
    in case something wrong or successful happens this view will redirect to the student list template
     (which is the student dashboard)"""

    model = Student
    form_class = StudentForm
    template_name = "students/partials/add_form_student.html"
    context_object_name = 'form'
    success_url = reverse_lazy("student-list")  # Redirige a la lista de estudiantes al guardar




