# Create your views here.

from django.views.generic import CreateView, ListView
from django.urls import reverse_lazy
from .models import Student
from .forms import StudentForm


class StudentListView(ListView):
    """
    This view handles displaying the list of students at the dashboard.
    It adapts dynamically to HTMX requests to filter rows efficiently.
    """
    model = Student
    context_object_name = "students"

    # This acts as our fallback/default template
    template_name = "partials/students_table.html"

    def get_template_names(self):
        # If HTMX is requesting data, only return the raw rows partial
        if self.request.headers.get('HX-Request'):
            return ['partials/student_rows.html']
        # Otherwise, render the whole dashboard table template
        return [self.template_name]

    def get_queryset(self):
        # Start with all students
        queryset = super().get_queryset()

        # Get the HTMX parameters from the URL
        filter_by = self.request.GET.get('filter_by', 'name')
        search_text = self.request.GET.get('search_text', '').strip()

        # If the user typed something, filter the database
        if search_text:
            filter_rule = f"{filter_by}__icontains"
            queryset = queryset.filter(**{filter_rule: search_text})

        return queryset

class StudentCreateView(CreateView):

    """ This view is in charge of creating a new student record the model is defined in a class variable,
    as well as the form utilized for registering the data into the form of the student class, we also define the
    template where this view will redirect to, and the context name for accessing from the html document, and
    in case something wrong or successful happens this view will redirect to the student list template
     (which is the student dashboard)"""

    model = Student
    form_class = StudentForm
    template_name = "partials/add_student_form.html"
    context_object_name = 'form'
    success_url = reverse_lazy("student-list")  # Redirige a la lista de estudiantes al guardar




