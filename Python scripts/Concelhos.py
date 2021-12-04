# -*- coding: utf-8 -*-
"""
Created on Fri Dec  3 23:38:23 2021

@author: maysa
"""

import pandas as pd

df = pd.read_excel('enes2019.mdb.xlsx')
mylist = df['Descr'].tolist()
list2 = df['Concelho'].tolist()
list3 = df['Nuts3'].tolist()
list4 = df['Distrito'].tolist()
for i in range(len(mylist)):
    print("INSERT INTO Concelho(idConcelho, codConcelho, nome, codNUTS3, codDistrito) VALUES ('" + str(i) + "', '"+ str(list2[i]) + "', '" + str(mylist[i]) + "', '" + str(list3[i]) + "', '" + str(list4[i]) + "');")

    