#/bin/bash

#/bin/bash

# Sucesión de Fibonacci en Bash

# Establecemos el valor por defecto de "max" en 10
max=10 

# Si se proporciona un argumento en la línea de comandos, lo usamos como valor máximo
if [ $# -eq 1 ]; then
  max=$1
fi

# Inicializamos las dos primeras variables de la serie
anterior=0
siguiente=1

# Imprimimos los dos primeros valores de la serie
echo $anterior
echo $siguiente

# Comenzamos el bucle para calcular y mostrar el resto de la serie
for (( i=0; i<max-2; i++ )); do
  aux=$siguiente
  siguiente=$(($anterior+$siguiente))
  anterior=$aux
  echo $siguiente
done

# Este es un programa en Bash que genera una sucesión de Fibonacci, que es una secuencia de números donde cada número es la suma de los dos números anteriores en la secuencia.

# El programa comienza estableciendo el valor máximo de la serie en 10 por defecto. Luego, si se proporciona un argumento en la línea de comandos, se usa como el nuevo valor máximo.

# A continuación, el programa inicializa las dos primeras variables de la serie (0 y 1) y los imprime en la consola.

# Luego, comienza un bucle que se ejecuta max-2 veces (ya que ya hemos impreso los dos primeros números de la serie). En cada iteración, el programa calcula el siguiente número en la secuencia sumando los dos números anteriores, guarda el valor actual de "siguiente" en "aux", actualiza "siguiente" a la suma y actualiza "anterior" a "aux". Luego, el programa imprime el valor actual de "siguiente" en la consola.

# Cuando el bucle termina, el programa ha impreso los primeros max números en la secuencia de Fibonacci en la consola.

# #Sucesión de fibonacci
# max=10 #Por defecto muestra los 10 primeros elementos de la serie
# if [ $# -eq 1 ];then
#   max=$1
# fi
# anterior=0
# siguiente=1
# echo $anterior
# echo $siguiente
# for (( i=0; i<max-2; i++ ))
# do
#   aux=$siguiente
#   siguiente=$(($anterior+$siguiente))
#   anterior=$aux
#   echo $siguiente
# done
