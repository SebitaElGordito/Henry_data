from scipy import stats 
from math import e, factorial

#DISTRIBUCIÓN BINOMIAL
def funcion_binomial(k,n,p):
  num_exitos = factorial(n)
  num_eventos = factorial (k) * factorial(n-k)
  exitos_fracaso = pow(p,k) * pow(1-p,(n-k))

  binomial = (num_exitos / num_eventos) * exitos_fracaso

  return binomial


#DISTRIBUCIÓN DE POISSON
def probabilidad_poisson(lamba_np,x):
     probabilidad = (pow(e,-lamba_np) * pow(lamba_np,x))/factorial(x)
     return probabilidad


#DISTRIBUCIÓN HIPERGEOMÉTRICA
#M es N, N es n, n es k, k es x

M, n, k, N = [12, 5, 1, 3]
# hypergeom.cdf(x, M, n, N)
hypergeo = stats.hypergeom(M,n,N)

def probabilidad_hipergeometrica(N,X,n,x):
  Xx = factorial(X)/(factorial(x)*factorial(X-x))
  NX_nx= factorial(N-X)/(factorial(n-x)*factorial((N-X)-(n-x)))
  Nn = factorial(N)/(factorial(n)*factorial(N-n))
  hipergeometrica = (Xx * NX_nx)/Nn

  return hipergeometrica



#1. Considera el experimento que consiste en un empleado que arma un producto.
  #- a. Defina la variable aleatoria que represente el tiempo en minutos requerido para armar el producto.
  #- b. ¿Qué valores toma la variable aleatoria?<br>
  #- c. ¿Es una variable aleatoria discreta o continua?<br>


#a
t_min = 0

#b
"la variable aleatoria toma cualquier valor mayor a 0"

#c
"al ser una variable que expresa tiempo, se trata de una variable continua"


#2. Considera el experimento que consiste en lanzar una moneda dos veces.
  #- a. Enumere los resultados experimentales.
  #- b. Defina una variable aleatoria que represente el número de caras en los dos lanzamientos.
  #- c. Dé el valor que la variable aleatoria tomará en cada uno de los resultados experimentales.
  #- d. ¿Es una variable aleatoria discreta o continua?

#a 
"los resultados experimentales son 4, (cara, cara), (cara, seca), (seca,cara), (seca,seca), y la fórmula es 2 elevado a la N"

#b
resul_caras_lanzamientos = 0

#c
"si la moneda se lanza 2 veces, los resultados de la variable resul_caras_lanzamientos puede tomar los valores (0,0), (0,1), (1,1) y (1,2)"

#d
"es una variable discreta, porque sale o no sale... vale 0 o vale 1 si sale"


#3. Considera las decisiones de compra de los próximos tres clientes que lleguen a la tienda de ropa Martin Clothing Store. De acuerdo con la experiencia, el gerente de la tienda estima que la probabilidad de que un cliente realice una compra es 0.30. 
  #- a. Describa si cumple con las reglas para clasificarlo como un experimiento binomial.
  #- b. ¿Cuál es la probabilidad de que dos de los próximos tres clientes realicen una compra?
  #- c. ¿Cuál es la probabilidad de que cuatro de los próximos diez clientes realicen una compra?


#a
"si, cumple con las reglas para clasificarlo como un experimento binomial porque son independientes y hay dos opciones o compra o no compra"

#b
print(funcion_binomial(2,3,0.3))

#c
print(funcion_binomial(4,10,0.3))


#4.  A la oficina de reservaciones de una aerolínea regional llegan 48 llamadas por hora.
#- a. Calcule la probabilidad de recibir cinco llamadas en un lapso de 5 minutos.
#- b. Estime la probabilidad de recibir exactamente 10 llamadas en un lapso de 15 minutos.
#- c. Suponga que no hay ninguna llamada en espera. Si el agente de viajes necesitará 5 minutos para la llamada que está atendiendo, ¿cuántas llamadas habrá en espera para cuando él termine? ¿Cuál es la probabilidad de que no haya ninguna llamada en espera?
#- d. Si en este momento no hay ninguna llamada, ¿cuál es la probabilidad de que el agente de viajes pueda tomar 3 minutos de descanso sin ser interrumpido por una llamada?


#a



