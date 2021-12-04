# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 00:19:34 2021

@author: maysa
"""

import pandas as pd

df = pd.read_excel('tblEscolas.xlsx')

nome = df['Descr'].tolist()
codDGAE = df['CodDGAE'].tolist()
codDGEEC = df['CodDGEEC'].tolist()
tipo = df['PubPriv'].tolist()
idConcelho = df['Concelho'].tolist()

for i in range(len(tipo)):
    if tipo[i] == 'PUB':
        tipo[i] = 'PÚBLICO'
    else :
        tipo[i] = 'PRIVADO'


k = 1
for j in range(len(nome)):
    if (j% 20 == 0):
        print("INSERT INTO Escola(idEscola, nome, codDGAE, codDGEEC, tipo, idConcelho) VALUES ('" + str(k) + "', '"+ str(nome[j]) + "', '" + str(codDGAE[j]) + "', '" + str(codDGEEC[j]) + "', '" + str(tipo[j]) + "', '" + str(idConcelho[j]) + "');")
        k += 1