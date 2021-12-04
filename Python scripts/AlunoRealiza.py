# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 15:13:06 2021

@author: maysa
"""

import pandas as pd
import random

S_N = ["S", "N"]
sitFreqPossiveis = ["Admitido a exame", "Anulou a matrícula", "Excluído por faltas", "Reprovou por frequência"]
serInterno = ""
classInt = 0
notaExame = 0.0
classFinal = 0
paraAprov = "S"
paraMelhoria = ""
provaIngresso = ""
CFCEPE = ""
j = 1

for i in range(1,68):
    sitFreq = random.choice(sitFreqPossiveis)
    if sitFreq == "Admitido a exame" :
        serInterno = "S"
        classInt = random.randrange(10,20)
        notaExame = round(random.uniform(0.0,20.0),1)
        classFinal = round(int(0.7*classInt + 0.3 * notaExame),0)
        paraMelhoria = random.choice(S_N)
        provaIngresso = random.choice(S_N)
        CFCEPE = random.choice(S_N)
    else:
        serInterno = "N"
        classInt = 0
        notaExame = round(random.uniform(0.0,20.0),1)
        classFinal = round(int(notaExame+0.5),0)
        paraMelhoria = random.choice(S_N)
        provaIngresso = random.choice(S_N)
        CFCEPE = random.choice(S_N)
    print("INSERT INTO AlunoRealiza(idAluno, idExame, idSitFreq, serInterno, classInt, notaExame, classFinal, paraAprov, paraMelhoria, provaIngresso, CFCEPE) VALUES ('" + str(j) + "', '" + str(j) + "', '" + sitFreq  + "', '" + serInterno + "', '" + str(classInt) + "', '" + str(notaExame) + "', '" + str(classFinal) + "', '" + paraAprov + "', '" + paraMelhoria + "', '" + provaIngresso + "', '" + CFCEPE +"');")
    j += 1
    
