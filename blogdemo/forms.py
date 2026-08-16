from datetime import datetime

from django import forms
from .models import Student, Professor, StudentTutor


class StudentForm(forms.ModelForm):
    tutor1 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 1",
        empty_label="-- Seleccionar Tutor 1 --"
    )
    tutor2 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 2",
        empty_label="-- Seleccionar Tutor 2 --"
    )
    tutor3 = forms.ModelChoiceField(
        queryset=Professor.objects.all(),
        required=False,
        label="Tutor 3",
        empty_label="-- Seleccionar Tutor 3 --"
    )

    class Meta:
        model = Student
        fields = [
            'udg_code', 'name', 'udg_email', 'phone',
            'current_semester', 'admission_year',
            'udg_calendar', 'situation', 'last_job'
        ]
        error_messages = {
            'udg_code': {
                'required': "El código UDG es obligatorio.",
                'unique': "Ya existe un estudiante registrado con ese código UDG."
            },
            'name': {
                'required': "El nombre del estudiante es obligatorio."
            },
            'udg_email': {
                'invalid': "Ingresa un correo institucional UDG válido."
            },
            'phone': {
                'invalid': "Número de teléfono inválido (debe contener entre 7 y 15 dígitos)."
            },
            'current_semester': {
                'min_value': "El semestre no puede ser menor que 0.",
                'max_value': "El semestre no puede ser mayor que 15.",
                'invalid': "Debes ingresar un número válido para el semestre."
            },
            'admission_year': {
                'min_value': "El año de admisión no puede ser menor que 1950.",
                'max_value': f"El año de admisión no puede ser mayor que {datetime.now().year}.",
                'invalid': "Debes ingresar un año de cuatro dígitos válido."
            },
            'situation': {
                'required': "Debes seleccionar la situación actual del alumno."
            }
        }

    def clean_udg_code(self):
        udg_code = self.cleaned_data.get('udg_code')
        # Check if code exists only if we are creating a new record
        if not self.instance.pk and Student.objects.filter(udg_code=udg_code).exists():
            raise forms.ValidationError("Ya existe un estudiante con ese código UDG.")
        return udg_code

    def clean(self):
        cleaned_data = super().clean()

        t1 = cleaned_data.get('tutor1')
        t2 = cleaned_data.get('tutor2')
        t3 = cleaned_data.get('tutor3')

        selected_tutors = [t for t in [t1, t2, t3] if t is not None]

        if len(selected_tutors) != len(set(selected_tutors)):
            raise forms.ValidationError("No puedes seleccionar al mismo profesor como tutor múltiple veces.")

        return cleaned_data

    def save(self, commit=True):
        # 1. Save core student record parameters
        student = super().save(commit=commit)

        if commit:
            # 2. Clear out old relationship parameters to prevent index cluttering
            StudentTutor.objects.filter(student=student).delete()

            # 3. Re-build explicit intermediate records matching your model's roles
            tutor_mappings = [
                ('TUTOR1', self.cleaned_data.get('tutor1')),
                ('TUTOR2', self.cleaned_data.get('tutor2')),
                ('TUTOR3', self.cleaned_data.get('tutor3')),
            ]

            for role_code, professor_obj in tutor_mappings:
                if professor_obj:
                    StudentTutor.objects.create(
                        student=student,
                        professor=professor_obj,
                        role=role_code
                    )
        return student
