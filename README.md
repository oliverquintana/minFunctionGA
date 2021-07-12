# minFunctionGA
Algoritmo genético para calcular el valor mínimo de una función dada.

Características:

* Población inicial generada aleatoriamente, donde cada individuo posee 16 genes.
* Selección Rank.
* Métodos de cruza:
  * Un corte 
  * Dos cortes
  * Uniforme
* Mutación.

## Introducción

Un algoritmo genético es una técnica de búsqueda heurística inspirada en la teoría de la evolución natural. Este algoritmo refleja el proceso de selección natural donde los individuos más aptos son seleccionados para reproducirse y transmitir su código genético a la siguiente generación, con el fin
de mejorar los individuos de la población.

Dada una función, un algoritmo genético es capaz de explorar el espacio de búsqueda generado por esta y, conforme al paso de las generaciones, converger la población hacia un óptimo local o global, que representa el minimizar o maximizar la función en base a las variables de entrada. 

Para la implementación del algoritmo genético, se consideran los siguientes puntos:

* Población Inicial
* Evaluación de Aptitud
* Método de Selección
* Método de Cruza
* Método de Mutación


### Población Inicial
Dada una función f(x1, x2), el código genético de la población es adaptado para contener ambas
variables dentro de un mismo individuo. Cada cromosoma está compuesto de 16 genes, donde la
mitad del mismo corresponde a la variable x 1 y la otra mitad a x 2 .
Restricciones:

* Población de tamaño par.
* Población de tamaño igual o mayor a 10.
* Alelos binarios.

### Evaluación de Aptitud
La aptitud de un individuo corresponde directamente a evaluar la función a minimizar f(x1, x2) y
obtener su inverso.

### Método de Selección
Para este trabajo, el método de selección Rank ha sido elegido debido a experiencia previa donde
se obtuvieron buenos resultados, donde la población es ordenada por aptitud de manera
descendente, cada par de individuos consecutivos en la lista conforman la pareja a cruzarse.

Así mismo, de manera complementaria al método de selección, se implementa competencia
genética a la población de padres y descendientes, donde únicamente la mitad mejor adaptada
trasciende a la siguiente generación, asegurando así que no exista un decaimiento en la aptitud
global y que los individuos seleccionados son los mejores de toda la población, contrastando con la
técnica de elitismo donde trascienden los mejores dos individuos de un sub grupo de 4,
correspondientes a padres y descendientes, donde es probable seleccionar individuos no tan
buenos con respecto al resto de la población meramente por la necesidad de seleccionar a un par
de individuos que trascienden.

### Método de Cruza
Se utiliza el método de cruza uniforme. Para cada gen que conformará a un descendiente, se asigna
una probabilidad de escoger el gen de un padre u otro para generar un hijo, donde el complemento
de este genera al segundo descendiente.

### Método de Mutación
Se selecciona una sub cadena del código genético de un individuo, la cual será alterada al ser
reemplazada por otra del mismo tamaño conformada por genes generados de manera aleatoria. El
tamaño de esta sub cadena, así como su tamaño son seleccionados de manera aleatoria en cada
generación, aplicada en cierto porcentaje de la población.

## Implementación

La función a minimizar es f(x_1, x_2) = 10 − e^(−x_1 − 3x_2), visualizada en la ilustración siguiente.

<img src="/img/fig1_func.png" width="400">

La población inicial es generada de manera aleatoria. Cada individuo posee 16 genes
correspondientes a las dos variables x 1 , x 2 dentro del intervalo [-1, 1].
Cada individuo es evaluado directamente sobre la función a minimizar para obtener su aptitud y
realizar el ordenamiento de mejor a peor aptitud, donde se forman parejas en este orden como es
indicado por el método de selección Rank para generar a los individuos descendientes.
La cruza es realizada de manera uniforme. Un número binario aleatorio es generado para
determinar si el descendiente tomará el código genético de un padre u otro. Este proceso aleatorio
es realizado para cada uno de los genes del cromosoma. Una vez generado un descendiente, el
segundo se obtiene por medio del complemento del primero, es decir, tomando el gen del padre
opuesto al que recibe el otro descendiente. De esta manera se obtiene una mayor diversidad en la
descendencia de la población.
Al combinar la población inicial y los descendientes de esta, se implementa la competencia genética,
donde únicamente la mitad de la población total es seleccionada para trascender a la siguiente
generación, esto con el fin de conservar únicamente a los individuos más aptos y mantener el
tamaño de la población invariante.
Se establece la condición de paro con respecto a la variabilidad que hay en la aptitud del mejor
individuo de la población. Al paso de cierto número de generaciones sin una mejora en la aptitud
del mejor individuo, se termina la ejecución del algoritmo. Así mismo, te contempla otra condición
que depende únicamente del número de generaciones que se desean ejecutar, esto con el fin de
visualizar el efecto que tiene el correr un número específico de generaciones.

## Resultados

<img src="/img/fig2_indiv1.png" width="400"> 

Se consideró la implementación de la mutación, por lo que se realizó una prueba para determinar
si ayuda a la convergencia del algoritmo. De una población de 50 individuos se corrió el algoritmo
por 10 generaciones con selección Rank y competencia genética, con y sin mutación, partiendo de
la misma población inicial. Al paso de estas generaciones se observó que no todos los individuos
convergen en un mismo punto, pero sí tienen la tendencia a hacerlo. Sin mutación se obtuvo lo
siguiente:

<img src="/img/fig3_indiv2.png" width="400">

<img src="/img/fig4_apt1.png" width="400">

Es claro que el algoritmo tiende a converger hacia un mismo punto, pero con el uso de la mutación
se llegó a que con el mismo número de épocas se obtuviera un mejor resultado en cuanto a aptitud
global se refiere, lo cual se comprobó con lo siguiente:

<img src="/img/fig5_indiv3.png" width="400">

<img src="/img/fig6_apt2.png" width="400">

La mayoría de los individuos convergen a un punto muy cercano al óptimo global, siendo este el
punto donde x1 = x2 = 0. Así mismo, el promedio de aptitud global es prácticamente igual a la
aptitud del mejor individuo de la población. Sin embargo, algunos de los individuos no se encuentran
exactamente en el óptimo, lo cual no trae mayor problema debido a que al menos un individuo lo
está. Siendo el caso en el que se desee que todos los individuos estén en el óptimo encontrado, es
necesario correr el algoritmo por un número mayor de épocas. En distintas pruebas, en alrededor
de 200 épocas todos los individuos convergen al mismo punto. Existen casos en los que la aptitud
mejora muy poco después de ciertas épocas de estancamiento, por lo que la condición de paro considera 
un paso de 50 épocas sin mejora en la aptitud del mejor individuo, cuyo comportamiento se observa en 
las ilustraciones siguientes.

<img src="/img/fig7_indiv4.png" width="400">

<img src="/img/fig8_apt3.png" width="400">

<img src="/img/fig9_apt4.png" width="400">

## Discusión

El uso de la mutación no es estrictamente necesario, pero si se observa una mejora en la velocidad
de convergencia de la población en torno al óptimo global, requiriendo un menor número de
generaciones para ello.
Se realizaron varias implementaciones con un número mayor de genes por cromosoma,
correspondiente a una mayor definición para las variables de entrada x1 , x2 dentro del intervalo
especificado y se encontró que no mejora el rendimiento del algoritmo, por el contrario, toma más
tiempo en ejecutar cada generación sin mostrar alguna otra ventaja. Esto puede ser particular de la
función utilizada, ya que el óptimo local se encuentra en el punto [0,0] y es posible ubicarlo
exactamente mediante su representación binaria sin necesidad de una mayor resolución para la
conversión de binario a decimal.
Para esta aplicación es indistinto si sólo se cuenta con un individuo en o cerca del óptimo global o si
todos son iguales, ya que la solución es encontrada de cualquier forma, por lo que la condición de
paro respecto a la mejora de la aptitud del mejor individuo es la mejor para detener la ejecución del
algoritmo.

Los algoritmos genéticos son una herramienta de inteligencia artificial basados en comportamientos
biológicos, que en este caso son utilizados para hacer una búsqueda de posibles soluciones que
minimizan una función dada. Esto es sumamente útil cuando es difícil visualizar los datos o el espacio
de búsqueda es grande y cuenta con un gran número de óptimos locales, por lo que la búsqueda heurística 
simplifica esta búsqueda y no es necesario evaluar en su totalidad el espacio generado por la función ya 
que con el paso de las generaciones el individuo converge hacia el óptimo global,
de manera ideal, del espacio de búsqueda, resultado en un tiempo menor para obtener la solución
en su comparación con la búsqueda por fuerza bruta.
