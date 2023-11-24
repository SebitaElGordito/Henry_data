import numpy as np

#1. indexacion y slicing

#. no se puden mezclar distintos tipos de datos, y el array es mutable en cuanto al valor del dato e inmutable en cuanto a la cantidad de valores

#. la diferencia radica en la diemnsion y la forma en que se almacenan los elementos en el arreglo. 

arreglo_1d = np.array ([1, 2, 3, 4, 5])
print (arreglo_1d.shape) #salida (5,) vector


#import numpy as np
arreglo_2d_columna = np.array([[1], [2], [3], [4], [5] ])
print (arreglo_2d_columna.shape) #salida (5, 1) matriz


#import numpy as np
arreglo_2d_fila = np.array([[1], [2], [3], [4], [5] ])
print (arreglo_2d_fila.shape) #salida (1, 5) matriz

#2 

#import numpy as np
arreglo_2 = np.arange(0, 10)
print(arreglo_2)


#import numpy as np
arreglo_3 = np.linspace(0, 9, 100)
print(arreglo_3)

#3


#import numpy as np
arreglo = np.arange(10, 101)
mascara = ((arreglo % 3) == 0)
print(arreglo[mascara])


#4

#import numpy as np
arreglo_zeros = np.zeros((5, 10))
print(arreglo_zeros)


#import numpy as np
arreglo_zeros = np.zeros((5, 10))
arreglo_zeros[[1, 3], :] = 1
print(arreglo_zeros)

print("--------")


#import numpy as np
arreglo_zeros = np.zeros((5, 10))
arreglo_zeros[:, [2, 7]] = 2
print(arreglo_zeros)
