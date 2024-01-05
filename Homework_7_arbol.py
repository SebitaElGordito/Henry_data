class Nodo:
    def __init__(self, dato):
        self.izq = None
        self.der = None
        self.dato = dato

    def insertaVal(self, dato):
        if dato < self.dato:
            if self.izq == None:
                self.izq = Nodo(dato)
            else:
                self.izq.insertaVal(dato)
        elif dato > self.dato:
            if self.der == None:
                self.der = Nodo(dato)
            else:
                self.der.insertaVal(dato)
        else:
            print("es igual")

        

    def buscaVal(self, val):
        if val < self.dato:
            if self.izq == None:
                return False
            return self.izq.buscaVal(val)
        elif val > self.dato:
            if self.der == None:
                return False
            return self.der.buscaVal(val)
        else:
            return True

    def verVal(self):
        if self.izq:
            self.izq.verVal()
        print(self.dato)
        if self.der:
            self.der.verVal()


a = Nodo()

a.insertaVal(2)
a.insertaVal(5)
a.insertaVal(6)
a.insertaVal(14)
a.insertaVal(8)
a.insertaVal(9)


valorBuscado = 8
if (a.buscaVal(valorBuscado)):
    print(valorBuscado, 'Encontrado!')
else:
    print(valorBuscado, 'No Encontrado!')

a.verVal()