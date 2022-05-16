from django.db import models


class Departamento(models.Model):
    nome = models.CharField(max_length=255)



class Colaborador(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)
    salario = models.DecimalField(decimal_places=2,max_digits=10)
