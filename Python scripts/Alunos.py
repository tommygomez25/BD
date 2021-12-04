# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 01:23:02 2021

@author: maysa
"""

import pandas as pd
import random

mylist = ["11","12"," "]

df = pd.read_excel('ginasio_Vlookup.xlsx')
df1 = pd.read_excel('tbCursos.xlsx')

codCurso = df1['Curso'].tolist()

nome = df['Nome'].tolist()

j = 1

for i in range(len(nome)):
    dataNascimento = str(random.randrange(1999,2004)) + "-" + str(random.randrange(1,12)) + "-" + str(random.randrange(1,28))
    print ("INSERT INTO Aluno (idAluno, nome, sexo, dataNasc, anoEscolaridade, codCurso) VALUES ('" + str(j) + "', '"+ str(nome[i]) + "' '" + ", '" + dataNascimento + ", '" + random.choice(mylist) + "', '"  + str(codCurso[random.randrange(0,len(codCurso))])+ "');")
    j += 1
