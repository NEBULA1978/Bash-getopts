#!/bin/bash

# roles=$(cat "roles.csv" | awk -F':' '{print $2}' | awk -F',' 'BEGIN {OFS=" "} {for (i=1;i<=NF;i++) print $i}' | sort | uniq)
# echo $roles
# for i in $roles
# do
#   echo $i
#   echo "->" $(cat "roles.csv" | grep $i | awk '-F:' '{print $1}')
# done




# El primer comando indica que el intérprete de comandos que se utilizará en el script es /bin/bash.

roles=$(cat "roles.csv" | awk -F':' '{print $2}' | awk -F',' 'BEGIN {OFS=" "} {for (i=1;i<=NF;i++) print $i}' | sort | uniq)

# Este comando lee el archivo "roles.csv" utilizando cat y pasa su contenido a awk.
# Luego, awk utiliza el separador ':' para imprimir el segundo campo de cada línea (que contiene los roles), y después se utiliza awk de nuevo para separar los valores de los roles por comas.
# Luego, se utiliza un bucle for para imprimir cada valor de rol separado por espacio en una sola línea.
# Finalmente, se utiliza el comando sort para ordenar los roles y uniq para eliminar duplicados y almacenar la lista en la variable 'roles'.

echo $roles

# Este comando imprime la lista de roles encontrados.

for i in $roles
do
  echo $i
  echo "->" $(cat "roles.csv" | grep $i | awk '-F:' '{print $1}')
done

# Este comando inicia un bucle for que itera sobre cada uno de los roles encontrados en la lista 'roles'.
# Luego, se imprime el nombre del rol actual.
# Después, se utiliza el comando grep para buscar todas las líneas en el archivo "roles.csv" que contengan el rol actual.
# Luego, se utiliza awk para imprimir el primer campo de cada una de esas líneas (el cual se separa por ':').
# Por último, se imprime la lista de nombres de usuario que tienen el rol actual.

# Fin del script.
