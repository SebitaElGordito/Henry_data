import pandas as pd
import numpy as np
import random

class Juegobj():
    def init(self):
        self.list=[]
        totalcartas=0

    def cartasdisp(self):   #Creamos la lista aleatoria de cartas
        self.cartas=[i for i in range(1,21)] #Creamos la list ordenada
        np.random.shuffle(self.cartas)  #Desordena la lista
        return self.cartas   #Devuelve el valor de la lista desordenada

    def seleccioncartas(self):
        #pila=self.cartas
        self.pilajuego=self.cartas[:self.totalcartas]
        return print(self.pilajuego)

    def mecanica(self):
        self.suma_total=0
        for i in self.pilajuego:
            self.suma_total+=i
            if self.suma_total >50:
                break
        return self.suma_total

    def puntaje(self):
        if self.suma_total>50:
            return print('Perdiste, resultado mayor a 50')
        else:
            restante=self.cartas[self.totalcartas:]
            suma_restante=self.suma_total
            contador=0
            for i in restante:
                suma_restante+=i
                contador+=1
                if suma_restante>50:
                    return 10-(contador-1)

    def juego(self):
        self.totalcartas=int(input('cuantas cartas quieres: '))
        lista_cartas=self.cartasdisp()
        cartas_juego=self.seleccioncartas()
        resultado=self.mecanica()
        puntaje_final=self.puntaje()
        return type(resultado) , self.suma_total, puntaje_final