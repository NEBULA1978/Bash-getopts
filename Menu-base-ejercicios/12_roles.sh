#!/bin/bash

roles=$(cat "roles.csv" | cut -d: -f2| sed 's/,/\n/g'| sort | uniq)


for i in $roles
do
  echo $i
  echo "-> " $(cat "roles.csv" | grep $i | cut -d: -f1)
done



# # Esta línea especifica que se debe usar el intérprete de Bash para ejecutar el script.

# roles=$(cat "roles.csv" | cut -d: -f2| sed 's/,/\n/g'| sort | uniq)

# # Esta línea lee el archivo "roles.csv", usa "cut" para obtener la segunda columna del archivo y luego usa "sed" para reemplazar las comas por saltos de línea. Luego, usa "sort" para ordenar los roles y "uniq" para eliminar las duplicidades. El resultado se almacena en una variable llamada "roles".

# for i in $roles
# do
#   echo $i
#   echo "-> " $(cat "roles.csv" | grep $i | cut -d: -f1)
# done

# # Este bucle "for" recorre cada uno de los roles y muestra el nombre del rol seguido de los nombres de usuario que tienen ese rol. Para hacer esto, usa "grep" para buscar todas las líneas que contienen el rol en cuestión, luego usa "cut" para obtener el nombre de usuario de la primera columna de esas líneas.
