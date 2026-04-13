from django.contrib import admin
from .models import Student, Professor, StudentTutor, ConacytScholarship, Thesis, ThesisProfessor

# Register your models here.
admin.site.register(Student)
admin.site.register(Professor)
admin.site.register(StudentTutor)
admin.site.register(ConacytScholarship)
admin.site.register(Thesis)
admin.site.register(ThesisProfessor)