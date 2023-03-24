#!/bin/bash

#Ejecuta un mandato que te permita hacer la siguiente función: listar los contenidos de un directorio, filtrar sólo los directorios, y para cada directorio mostrar el mensaje:
#“El directorio ” nombre “ con permisos ” lista permisos “ y con ” número de ficheros y directorios en su interior “ ficheros y directorios en su interior pertenece a : ” propietario
#Prueba a ejecutarlo en la carpeta “/etc”.
#ls -l "/etc/" | awk '/^d/ {var=system("ls /etc/"$9" | wc -l");print "El directorio "$9" con permisos "$1" y con múmero de ficheros y directorios " var " pertenece a " $3 }'

# Solucion 1
# ls -l "/etc/" | awk '/^d/ {var=system("ls /etc/"$9" | wc -l");print var}'

#!/bin/bash

# El shebang arriba indica que el script será ejecutado con el intérprete bash.

# Se usa el comando ls -l para listar los contenidos del directorio /etc en formato largo.
# La salida de este comando se redirecciona a awk.

ls -l "/etc/" | awk '

# Awk es un lenguaje de programación para procesamiento de texto que se utiliza aquí para filtrar sólo las líneas que comienzan con "d", lo que indica que son directorios.

/^d/ {
  
  # Se usa system para ejecutar el comando "ls" dentro del directorio actual y contar el número de archivos y directorios dentro del directorio actual.
  # La salida de "ls" se redirecciona a "wc -l", que cuenta el número de líneas (es decir, el número de archivos y directorios).
  # El resultado se almacena en la variable "var".
  
  var=system("ls /etc/"$9" | wc -l");
  
  # Finalmente, se imprime un mensaje que muestra el nombre del directorio, los permisos, el número de archivos y directorios, y el propietario.
  # El número de archivos y directorios se toma de la variable "var" y se muestra junto con el resto de la información.
  
  print "El directorio "$9" con permisos "$1" y con número de ficheros y directorios en su interior "$var" ficheros y directorios en su interior pertenece a : "$3
}'

# El script finaliza aquí.
