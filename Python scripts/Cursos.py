# -*- coding: utf-8 -*-
"""
Created on Fri Dec  3 23:59:56 2021

@author: maysa
"""

import pandas as pd

df = pd.read_excel('tbCursos.xlsx')
codCurso = df['Curso'].tolist()
nome = df['Descr'].tolist()
subTipo = df['SubTipo'].tolist()

for i in range(0,234):
    print("INSERT INTO Curso(codCurso, nome, codSubTipoCurso) VALUES ('" + str(codCurso[i]) + "', '"+ nome[i] + "', '" + str(subTipo[i])  + "');")