from django.db import models

class Empresa(models.Model):
    nome = models.CharField(max_length=255, default=None, blank=True, null=True)

    def __str__(self):
        return self.nome

class Departamento(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.DO_NOTHING, blank=True, null=True)
    nome = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.nome


class dpto_empresa(models.Model):
    id_empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, blank=True, null=True)
    id_dpto = models.ForeignKey(Departamento, on_delete=models.CASCADE, blank=True, null=True)



class Cargo(models.Model):
    departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE, blank=True, null=True)
    nome = models.CharField(max_length=200, blank=True, null=True)

    def __str__(self):
        return self.nome
        
class Colaborador(models.Model):
    nome = models.CharField(max_length=200, blank=True, null=True)
    cargo = models.ForeignKey(Cargo, on_delete=models.PROTECT,default=1, blank=True, null=True)
    salario = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    idade = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    formacao = models.CharField(max_length=100, blank=True, null=True)
    tempo_experiencia = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    cursos = models.CharField(max_length=200, blank=True, null=True)
    entrega_resultados = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    score_colaborador = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    projetos = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)


    def __str__(self):
        return f'N-{self.id} - {self.nome} {self.cargo} - {self.salario}'

class Folha_pgto(models.Model):
    colaborador = models.ForeignKey(Colaborador, on_delete=models.CASCADE, blank=True, null=True)
    hora_extra = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    descontos = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    atestados = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    faltas = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    valor_total = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    data = models.DateField()
    
    def __str__(self):
        return f'N-{self.id} - {self.colaborador.nome} {self.valor_total}'

    

class Nota_fiscal(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.PROTECT, blank=True, null=True)
    data = models.DateField()
    desconto = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)
    forma_pgto = models.CharField(max_length=255, blank=True, null=True)
    total = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)


    def __str__(self):
        return f'N-{self.id} - {self.data} {self.empresa}'


class item_nota(models.Model):
    item_nota = models.ForeignKey(Nota_fiscal, on_delete=models.CASCADE, blank=True, null=True)
    produto = models.CharField(max_length=255, blank=True, null=True)
    valor = models.DecimalField(decimal_places=2,max_digits=10, blank=True, null=True)

    def __str__(self):
        return f'{self.item_nota} - {self.produto} / ({self.item_nota.id} - {self.item_nota.data})'

