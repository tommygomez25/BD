# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 01:58:38 2021

@author: maysa
"""

j = 1

for i in range(1,61):
    print ("INSERT INTO OndeRealiza(idEscola, idAluno) VALUES ('" + str(j) +"', '" + str(i) + "');")
    if (i % 2 == 0):
        j += 1