#1. Alistamos los datos
Pa=0.50
Pb=0.60
PAnB=0.4

A=round((PAnB/Pb)*100, 2)
B=round((PAnB/Pa)*100, 2)

if A==Pa:
    C='Si son independientes'
else:
    C='No son independientes'

print('a. La probabilidad es: ',A,'%')
print('b. La probabilidad es: ',B,'%')
print('c. Las variables A y B :',C)



#2. P_A=0.30
P_B=0.40
P_AnB=0

#pregunta a.
P_AnB=0

#pregunta b.
P_AlB=P_AnB/P_B

print('a. No comparten interseccion: ',P_AnB)
print('b. Calcule P_AlB : ',P_AlB)
print('c. Un evento es excluyente en tanto un resultado, excluya a otro (Si/No). Un evento puede ser indepeniente en la medida ,mientra que la probabilidad de un evento no afecta al otro (Lanzar una moneda por 1ra vez y que salga cara no afecta "La probabilidad" de los resultados de la 2da moneda)')


#3 Datos
P_A1=30/80
P_A2=34/80

#Pregunta a.
P_A1nA2= P_A1*P_A2*100

#Pregunta b.
P_B1=(50/80)*2*100

print(f'a. La probabilidad es : {round(P_A1nA2,2)} %')
print(f'b. La probabilidad de que los 2 autos sean nacionales : {P_B1} %')


#4 Datos
P_A3=30/80
P_A4=34/79

#Pregunta a.
P_A1nA2= P_A3*P_A4*100

#Pregunta b.
P_B2=(50/80)*(49/79)*100

print(f'a. La probabilidad es : {round(P_A1nA2,2)} %')
print(f'b. La probabilidad de que los 2 autos sean nacionales : {P_B2} %')