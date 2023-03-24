#!/bin/bash
#*Ejercicio 8.* Se desea saber qué páginas de un servidor web son más
#accedidas. El archivo /var/log/apache/access.log contiene líneas del
#siguiente formato:
#127.0.0.1 - - [25/Jul/2002:20:21:51 -0300] "GET
#/fabmelo/version7/modif_clave.php?nombre=pa232&clave=madrid HTTP/1.1" 200
#1609
#127.0.0.1 - - [25/Jul/2002:20:21:58 -0300] "POST /fabmelo/version7/menu.php
#HTTP/1.1" 200 1012
#127.0.0.1 - - [25/Jul/2002:20:22:00 -0300] "GET
#/fabmelo/version7/presupuestos2.php?nombre=pa232&clave=belice HTTP/1.1" 200
#642
#Los accesos contienen la palabra GET, los nombres de las páginas terminan
#en espacio o en "?". Listar los nombres de páginas de las 5 más accedidas. 


# grep "GET " /var/log/apache/access.log | awk -F " " '{print $7}' | awk -F "?" '{print $1}' | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2}'

# Este comando hace lo siguiente:

#     grep "GET " /var/log/apache/access.log: Busca todas las líneas del archivo de registro que contienen la palabra "GET".
#     awk -F " " '{print $7}': Imprime la séptima columna de cada línea, que es la URL completa accedida.
#     awk -F "?" '{print $1}': Imprime sólo la parte de la URL antes del signo "?", para eliminar los parámetros.
#     awk '{print $1}': Imprime sólo la parte de la URL antes del primer espacio, para eliminar cualquier carácter adicional.
#     sort | uniq -c: Cuenta el número de veces que aparece cada URL y las ordena alfabéticamente.
#     sort -nr: Ordena la lista de URL por número de accesos, de mayor a menor.
#     head -n 5: Muestra sólo las primeras 5 URL de la lista.
#     awk '{print $2}': Imprime sólo el segundo campo (el nombre de la página) de cada línea.

# Este comando debería producir una lista de los nombres de las 5 páginas más accedidas en el archivo de registro de acceso.


# ///////////////////////////////////////////////
# ///////////////////////////////////////////////


# Filtrar líneas que contienen "GET" y extraer el nombre de la página
# utilizando un patrón de expresión regular
awk '/GET/{match($7,/[^?]+/);print substr($7,RSTART,RLENGTH)}' /var/log/apache/access.log | 
# Eliminar las extensiones de archivo para que las páginas con la misma ruta pero con
# extensiones diferentes se consideren como una sola página
sed 's/\.[^\.]*$//' | 
# Contar las ocurrencias de cada página y ordenar los resultados
sort | uniq -c | sort -rn | 
# Mostrar sólo los 5 primeros resultados
head -n 5 | 
# Extraer sólo el nombre de la página
awk '{print $2}'

# El comando utiliza awk para filtrar las líneas que contienen la palabra "GET" y extraer el nombre de la página utilizando una expresión regular. Luego, utiliza sed para eliminar las extensiones de archivo, de modo que las páginas con la misma ruta pero con extensiones diferentes se consideren como una sola página. A continuación, utiliza sort, uniq y sort de nuevo para contar las ocurrencias de cada página y ordenar los resultados. Finalmente, utiliza head y awk para mostrar sólo los 5 primeros resultados y extraer sólo el nombre de la página.