from django.db import models
from datetime import datetime
from django.core.validators import MinValueValidator, MaxValueValidator, RegexValidator


# Create your models here.
class Student(models.Model):
    udg_code = models.CharField(primary_key=True, max_length=15, verbose_name="Código de estudiante UDG")
    name = models.CharField(max_length=255, blank=False, verbose_name="Nombre")
    udg_email = models.EmailField(blank=True, verbose_name="Correo UDG")

    # 7 to 15 digits are only accepted, the '+' symbol is also optional
    phone = models.CharField(max_length=15, blank=True, verbose_name="Teléfono", validators=[
        RegexValidator(r'^\+?\d{7,15}$', "Número de teléfono inválido")])

    # only semesters from 0 to 15
    current_semester = models.IntegerField(default=0, blank=True,  verbose_name="Semestre en curso", validators=[
        MinValueValidator(0), MaxValueValidator(15)])

    # integers from 1950 to the current year are only accepted
    admission_year = models.IntegerField(default=0, blank=True, verbose_name="Año de admisión", validators=[
        MinValueValidator(1950),
        MaxValueValidator(datetime.now().year)
    ])

    udg_calendar = models.CharField(max_length=1, blank=True, verbose_name="Calendario", choices=[("A", "A"), ("B", "B")])

    situation = models.CharField(max_length=20, blank=True, verbose_name="Situación del estudiante", choices=[
            ("ACTIVO", "Activo"),
            ("GRADUADO", "Graduado"),
            ("BAJA", "Baja"),
            ("INACTIVO", "Inactivo"),
            ("DESCONOCIDO", "Desconocido"),
        ]

    )

    last_job = models.TextField(blank=True, verbose_name="Ult. lugar de trabajo")

    # Mid-table, using many-to-many relationship with tutors
    tutors = models.ManyToManyField(
        "Professor",
        through="StudentTutor",
        related_name="students"
    )


    def __str__(self):
        return f"{self.name} | {self.udg_code}"


class Professor(models.Model):
    udg_code = models.CharField(primary_key=True, max_length=15, verbose_name="Código de profesor UDG")
    name = models.CharField(max_length=255, blank=False, verbose_name="Nombre")
    udg_email = models.EmailField(blank=True, verbose_name="Correo UDG")
    tutoring_number = models.IntegerField(default=0, blank=True)

    def __str__(self):
        return f"{self.name} | {self.udg_code}"



class StudentTutor(models.Model):
    student = models.ForeignKey(Student, on_delete=models.PROTECT)
    professor = models.ForeignKey(Professor, on_delete=models.PROTECT)
    role = models.CharField(
        max_length=10,
        choices=[ ("TUTOR1", "Tutor 1"),  ("TUTOR2", "Tutor 2"), ("TUTOR3", "Tutor 3")]
    )

    class Meta:
        unique_together = ("student", "role")  # avoid that a student has two tutors 1

    def __str__(self):
        return f"{self.student.name} - {self.professor.name} ({self.role})"



class ConacytScholarship(models.Model):
    conacyt_id = models.CharField(primary_key=True, max_length=15, verbose_name="ID Beca Conacyt",
    validators = [
        RegexValidator(r'^\d{4,15}$', "ID de beca inválido")]
    )

    start_date = models.DateField(blank=True, verbose_name="Fecha de inicio")
    end_date = models.DateField(blank=True, verbose_name="Fecha de finalización")
    status = models.CharField(max_length=10, verbose_name="Estatus", choices=[
            ("ACTIVA", "Activa"),
            ("BAJA", "Baja"),
            ("SIN BECA", "Sin Beca"),
        ]

    )

    student = models.OneToOneField(
        Student,
        on_delete=models.CASCADE,   # if you delete sudent, also the scholarshop is gone
        related_name="scholarship"  # access from Student
    )

    def __str__(self):
        return f"{self.conacyt_id} - {self.student.name}"


class Thesis(models.Model):
    lgca = models.CharField(max_length=255, verbose_name="LGCAs")
    title = models.TextField(blank=True, verbose_name="Titulo de tesis")
    graduation_date = models.DateField(null=True, blank=True, verbose_name="Fecha de graduación")
    record = models.CharField(max_length=10, blank=True, verbose_name="Acta de tesis")

    student = models.OneToOneField(
        Student,
        on_delete=models.CASCADE,   # if you delete student, also the thesis is gone
        related_name="thesis"  # access from Student
    )

    # Relación muchos a muchos con profesores, usando tabla intermedia
    professors = models.ManyToManyField(
        Professor,
        through="ThesisProfessor",
        related_name="thesis"
    )


    def __str__(self):
        return f"{self.title[:20]} - {self.student.name}"


class ThesisProfessor(models.Model):
    thesis = models.ForeignKey(Thesis, on_delete=models.CASCADE)
    professor = models.ForeignKey(Professor, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, choices=[
        ("DIRECTOR", "Director"),
        ("CO_DIRECTOR", "Co-director"),
        ("ASESOR_CO_DIRECTOR", "Asesor Co-director"),
        ("ASESOR", "Asesor")
        ]
    )

    class Meta:
        unique_together = ("thesis", "role")
        # Esto asegura que en una misma tesis no se repita un rol.
        # Ejemplo: no puede haber dos "DIRECTOR" en la misma tesis.

    def __str__(self):
        return f"{self.thesis.title[:20]} - {self.professor.name} ({self.role})"