# Create your views here.
from django.http import HttpResponse
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
    model = Student
    form_class = StudentForm
    # Make sure this points to your new modal partial template file path:
    template_name = "partials/student_form_modal.html"
    context_object_name = 'form'
    success_url = reverse_lazy("student-list")

    def form_valid(self, form):
        """Called when valid form data has been POSTed."""
        # Save the student and intermediate tables using your updated clean save logic
        self.object = form.save()

        # Check if the request is coming via HTMX
        if self.request.headers.get('HX-Request'):
            # Return an empty response, but send a custom HX-Trigger header.
            # This tells Alpine.js to close the window, and triggers your
            # student list view to refresh the table.
            response = HttpResponse(status=204)  # 204 No Content
            response['HX-Trigger'] = 'close-add-modal, refresh-student-list'
            return response

        return super().form_valid(form)

    def form_invalid(self, form):
        """Called when invalid form data has been POSTed."""
        # If HTMX sent the form, re-render ONLY the modal partial
        # carrying the updated form validation errors.
        if self.request.headers.get('HX-Request'):
            return self.render_to_response(self.get_context_data(form=form))

        return super().form_invalid(form)


from django.contrib.auth import views as auth_views
from django.http import HttpResponse
from django.shortcuts import render


class HTMXLoginView(auth_views.LoginView):
    template_name = 'login.html'  # Path to your partial template

    def form_valid(self, form):
        # 1. Authenticate and log the user in
        super().form_valid(form)

        # 2. Instruct HTMX to perform a client-side redirect to LOGIN_REDIRECT_URL
        response = HttpResponse(status=200)
        response['HX-Redirect'] = self.get_success_url()
        return response

    def form_invalid(self, form):
        # If the request comes from HTMX, return ONLY the error alert snippet
        if self.request.headers.get('HX-Request'):
            return render(
                self.request,
                'partials/alert_error.html',
                {'form': form},
                status=422
            )
        # Fallback to standard Django CBV behavior if requested normally
        return super().form_invalid(form)
