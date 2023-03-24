#!/bin/bash

#Crear un script con nombre crear.sh que admita dos parámetros, el primero indicará el nombre de un fichero,
# y el segundo su tamaño. El script creará en el directorio actual un fichero con el nombre dado y el tamaño
#dado en Kilobytes. En caso de que no se le pase el segundo parámetro, creará un fichero con 1.024 Kilobytes
#y el nombre dado. En caso de que no se le pase ningún parámetro, creará un fichero con nombre fichero_vacio
#y un tamaño de 1.024 Kilobytes.
#Modificar del ejercicio
# Para que antes de crear el fichero compruebe que no exista. En caso de que
#exista avisará del hecho por pantalla y creará el fichero pero añadiéndole un 1 al final del nombre (aguado1, por ejemplo).
# Si también existe un fichero con ese nombre, lo creará con un 2 al final del nombre, así seguiremos hasta intentar el 9.
# Si también existe un fichero con 9 al final del nombre, avisará del hecho y no creará nada.


# Ejemplo 1

# tamanio=1024
# fichero="fichero_vacio"

# case $# in
# 0) ;;
# 1) fichero=$1 ;;
# 2)
#   fichero=$1
#   tamanio=$2
#   ;;
# *)
#   echo "Parametros incorrectos"
#   exit 1
#   ;;
# esac

# if [ -f $fichero ]; then
#   for ((i = 1; i < 10; i++)); do
#     if [ ! -f "$fichero$i" ]; then
#       echo "$fichero$i"
#       dd if="/dev/zero" of="$fichero$i" bs=1024 count=$tamanio
#       break
#     else
#       if [ $i -eq 9 ]; then
#         echo "No es posible crear el fichero, ni las 9 copias"
#       fi
#     fi
#   done
# else
#   dd if="/dev/zero" of=$fichero bs=1024 count=$tamanio
# fi

# //////////////////////////////////////////
# //////////////////////////////////////////

# Ejemplo 2

#!/bin/bash

# Comprobamos si se han pasado argumentos
if [ $# -eq 0 ]; then
  # No se han pasado argumentos, usamos valores por defecto
  nombre="fichero_vacio"
  tamano="1024"
elif [ $# -eq 1 ]; then
  # Se ha pasado un argumento, usamos ese como nombre y usamos un tamano por defecto
  nombre=$1
  tamano="1024"
else
  # Se han pasado dos argumentos, usamos ambos
  nombre=$1
  tamano=$2
fi

# Comprobamos si el fichero ya existe
if [ -e $nombre ]; then
  # El fichero ya existe
  for i in {1..9}
  do
    # Intentamos añadir un número al final del nombre
    nuevo_nombre="${nombre%.*}${i}.${nombre##*.}"
    if [ -e $nuevo_nombre ]; then
      # El fichero con ese nombre también existe, probamos con el siguiente número
      continue
    else
      # Hemos encontrado un nombre disponible, lo usamos
      nombre=$nuevo_nombre
      break
    fi
  done
  
  # Si seguimos sin encontrar un nombre disponible, avisamos y salimos
  if [ -e $nombre ]; then
    echo "Error: No se pudo crear el fichero, todos los nombres están en uso."
    exit 1
  fi
fi

# # Creamos el fichero con el nombre y tamaño especificados
# dd if=/dev/zero of=$nombre bs=1024 count=$tamano

# # Avisamos de que se ha creado el fichero
# echo "Se ha creado el fichero $nombre con un tamaño de ${tamano}KB."

# Explicación del código:

#     Primero comprobamos si se han pasado argumentos al script, y si no se han pasado, usamos valores por defecto.

#     A continuación, comprobamos si el fichero con el nombre dado ya existe. Si existe, intentamos añadir un número al final del nombre hasta encontrar un nombre disponible. Si no encontramos ningún nombre disponible después de añadir un número del 1 al 9, avisamos y salimos del script.

#     Finalmente, creamos el fichero con el nombre y tamaño especificados usando el comando dd, y avisamos de que se ha creado el fichero.
