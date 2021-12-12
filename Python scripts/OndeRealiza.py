# -*- coding: utf-8 -*-
"""
Created on Sat Dec  4 01:58:38 2021

@author: maysa
"""

import random

for i in range(1,101):
    print ("INSERT INTO OndeRealiza(idEscola, idAluno) VALUES ('" + str(random.randint(1, 619)) +"', '" + str(i) + "');")
    