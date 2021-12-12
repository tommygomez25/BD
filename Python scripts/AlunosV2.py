# -*- coding: utf-8 -*-
"""
Created on Sun Dec 12 11:22:23 2021

@author: maysa
"""
import random
import pandas as pd
M_F = ["M","F"]
mylist = ["11","12"," "]
df1 = pd.read_excel('tbCursos.xlsx')

codCurso = df1['Curso'].tolist()
for i in range(68,100):
    dataNascimento = str(random.randrange(1999,2004)) + "-" + str(random.randrange(1,12)) + "-" + str(random.randrange(1,28))
    print ("INSERT INTO Aluno (idAluno, nome, sexo, dataNasc, anoEscolaridade, codCurso) VALUES ('" + str(i) + "', ' ', '" +random.choice(M_F)+ "'" + ", '" + dataNascimento + "', '" + random.choice(mylist) + "', '"  + str(codCurso[random.randrange(0,len(codCurso))])+ "');")