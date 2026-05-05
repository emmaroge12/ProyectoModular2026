from datetime import datetime

from django import forms
from .models import Student, Professor

class StudentForm(forms.ModelForm):
    # Campo extra: hasta tres tutores
    tutor1 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 1"
    )
    tutor2 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 2"
    )
    tutor3 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 3"
    )

    class Meta:
        model = Student
        fields = [
            'udg_code', 'name', 'udg_email', 'phone',
            'current_semester', 'admission_year',
            'udg_calendar', 'situation', 'last_job'
        ]
        error_messages = {
            'current_semester': {
                'min_value': "El semestre no puede ser menor que 0.",
                'max_value': "El semestre no puede ser mayor que 15.",
                'invalid': "Debes ingresar un número válido para el semestre."
            },
            'admission_year': {
                'min_value': "El año de admisión no puede ser menor que 1950.",
                'max_value': f"El año de admisión no puede ser mayor que {datetime.now().year}.",
                'invalid': "Debes ingresar un año válido."
            }
        }

        # widgets = {
        #     'udg_code': forms.NumberInput(attrs={'max': 15}),
        #     'phone': forms.NumberInput(attrs={'max': 15}),
        #
        # }

        # UDG code field validation
    def clean_udg_code(self):
        udg_code = self.cleaned_data['udg_code']
        if Student.objects.filter(udg_code=udg_code).exists():
            raise forms.ValidationError("Ya existe un estudiante con ese código UDG.")
        return udg_code

    def clean(self):
        cleaned_data = super().clean()

        # Duplicated tutors validiation
        tutors = [cleaned_data.get('tutor1'),
                  cleaned_data.get('tutor2'),
                  cleaned_data.get('tutor3')]

        tutors = [t for t in tutors if t is not None] # get only non-None tutor values

        if len(tutors) != len(set(tutors)):
            raise forms.ValidationError("No puedes elegir el mismo tutor más de una vez.")

        return cleaned_data

    def save(self, commit=True):
        student = super().save(commit=commit)
        tutors = [self.cleaned_data.get('tutor1'),
                  self.cleaned_data.get('tutor2'),
                  self.cleaned_data.get('tutor3')]

        tutors = [t for t in tutors if t is not None]

        # Assign student tutors in crossed-table

        student.tutors.set(tutors)


        return student
