from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def index(request):
    return HttpResponse("<!DOCTYPE html><html><body><h1>SENAI</h1><h2>MODELAGEM DE DADOS</h2><h3>TESTE 1</h3><h4>TESTE 2</h4></body></html>")
