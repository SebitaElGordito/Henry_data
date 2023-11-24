#Homework 1

def numeroBinario(numero):
    if type(numero) != int or numero < 0: return None
    elif numero ==0: return 0
    binario = ""
    div_resto=0
    while numero > 0:
        div_resto = numero%2
        numero = numero // 2
        binario=str(div_resto) + binario
        return binario
        
        
        

print(numeroBinario(29))





#2) Convertir de decimal a binario las fracciones 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9. Luego analizar los resultados y observar qué particularidad se encuentra en los mismos. Se puede usar Python o una calculadora, lo importante es ver si hay algo que podemos notar...

def decimal_a_binario(fraccion):
    partes = fraccion.split("/")
    numerador =int(partes[0])
    denominador = int(partes[1])
    resultado= ""

    while numerador > 0:
        resultado = str(numerador % 2 ) + resultado
        numerador = numerador //2

    resultado +="."

    while len(resultado) < 24 and denominador > 0:
        numerador = denominador * 2
        if numerador >= denominador:
            resultado += "1"
            numerador -= denominador

        else:
            resultado +="0"
        denominador = denominador * 2

    return resultado

