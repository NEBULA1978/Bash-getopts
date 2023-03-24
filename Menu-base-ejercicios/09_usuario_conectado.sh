#!/bin/bash

# function ayuda() {
#   cat <<DESCRIPCION_AYUDA
# SYNOPSIS
#     $0 Nombre_usuario
# DESCRIPCION
#   Devuelve:
# 	SI si NOMBRE_USUARIO coincide con algún usuario conectado o
# 	NO si NOMBRE_USUARIO no coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si el número de parámetros es distinto de 1
# DESCRIPCION_AYUDA
# }
# if [ $# -ne 1 ]; then
#   ayuda
# fi

# CONECTADO=$(who | grep $1)
# if [ -z "$CONECTADO" ]; then
#   echo "No"
# else
#   echo "SI"
# fi

# ////////////////////////////////////////
# ////////////////////////////////////////

# Define the ayuda() function
function ayuda() {
  # Use a here document to define the help message
  cat <<-END_HELP
	SYNOPSIS
	    $0 Nombre_usuario
	
	DESCRIPCIÓN
	  Devuelve "SI" si Nombre_usuario coincide con algún usuario conectado o
	  "No" si Nombre_usuario no coincide con ningún usuario conectado.
	
	CÓDIGOS DE RETORNO
	  0 Si el usuario está conectado
	  1 Si el usuario no está conectado
	  2 Si el número de parámetros es distinto de 1
	
	END_HELP
}

# Check for the correct number of parameters
if [ $# -ne 1 ]; then
  ayuda
  exit 2
fi

# Use the 'who' command to get a list of logged-in users
# Use grep with the -i option for case-insensitive search
if who | grep -q -i "$1"; then
  # If the user is found, print "SI" and return code 0
  echo "SI"
  exit 0
else
  # If the user is not found, print "No" and return code 1
  echo "No"
  exit 1
fi

# In this updated version of the script:

#     The grep command is modified to use the -i option for a case-insensitive search. This makes the script more robust and user-friendly.
#     Error handling is added to provide feedback to the user if an error occurs. The script now exits with a specific return code for each possible scenario (user found, user not found, incorrect number of parameters).
#     The ayuda() function is formatted more clearly to make the help message easier to read and understand.  ¿en castellano

# ////////////////////////

# En esta versión actualizada del script:

#     Se ha modificado el comando grep para usar la opción -i para una búsqueda insensible a mayúsculas y minúsculas. Esto hace que el script sea más robusto y fácil de usar.
#     Se ha agregado manejo de errores para proporcionar retroalimentación al usuario si ocurre un error. Ahora el script sale con un código de retorno específico para cada posible escenario (usuario encontrado, usuario no encontrado, número incorrecto de parámetros).
#     La función ayuda() se ha formateado de manera más clara para hacer que el mensaje de ayuda sea más fácil de leer y entender.
