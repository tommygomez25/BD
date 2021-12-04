# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 00:12:31 2021

@author: maysa
"""

import pandas as pd 

df = pd.read_excel('tblCursosSubTipos.xlsx')
codSubTipoCurso = df['SubTipo'].tolist()
nome = df['Descr'].tolist()
codTipoCurso = df['TpCurso'].tolist()

for i in range(len(codSubTipoCurso)):
    print("INSERT INTO SubTipoCurso(codSubTipoCurso, nome, codTipoCurso) VALUES ('" + str(codSubTipoCurso[i]) + "', '"+ nome[i] + "', '" + str(codTipoCurso[i])  + "');")
