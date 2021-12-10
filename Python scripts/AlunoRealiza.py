# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 15:13:06 2021

@author: maysa
"""

import pandas as pd
import random

S_N = ["S", "N"]
sitFreqPossiveis = ["Admitido a exame", "Anulou a matrícula", "Excluído por faltas", "Reprovou frequência"]
serInterno = ""
notaExame = 0.0
paraAprov = "N"
paraMelhoria = ""
provaIngresso = ""
CFCEPE = ""
j = 1

for i in range(1,68):
    sitFreq = random.choice(sitFreqPossiveis)
    if sitFreq == "Admitido a exame" :
        serInterno = "S"
        paraAprov = "N"
        notaExame = round(random.uniform(0.0,20.0),1)
        paraMelhoria = random.choice(S_N)
        provaIngresso = random.choice(S_N)
        CFCEPE = random.choice(S_N)
    else:
        serInterno = "N"
        paraAprov = "S"
        notaExame = round(random.uniform(0.0,20.0),1)
        paraMelhoria = random.choice(S_N)
        provaIngresso = random.choice(S_N)
        CFCEPE = random.choice(S_N)
    print("INSERT INTO AlunoRealiza(idAluno, idExame, idSitFreq, serInterno, notaExame, paraAprov, paraMelhoria, provaIngresso, CFCEPE) VALUES ('" + str(j) + "', '" + str(j) + "', '" + sitFreq  + "', '" + serInterno + "', '"  + str(notaExame) + "', '"  + paraAprov + "', '" + paraMelhoria + "', '" + provaIngresso + "', '" + CFCEPE +"');")
    j += 1
    
