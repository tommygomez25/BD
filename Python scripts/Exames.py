# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 00:39:55 2021

@author: maysa
"""

import pandas as pd
import random

df = pd.read_excel('tblExames.xlsx')

anoletivo = "2020/2021"
fase = 2
codExame = df['Exame'].tolist()
j = 67
for i in range(22):
    dataRealizacao = "2021-" + str(random.randrange(7,8)) + "-" + str(random.randrange(1,30))
    print("INSERT INTO Exame(idExame, codExame, fase, anoLetivo, dataRealizacao) VALUES ('" + str(j) + "', '"+ str(codExame[i]) + "', '" + str(fase) + "', '" + anoletivo + "', '" + str(dataRealizacao) + "');")
    j += 1