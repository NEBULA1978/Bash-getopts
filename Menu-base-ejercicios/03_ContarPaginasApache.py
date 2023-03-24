

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


# Abrir el archivo de registro de acceso
with open('/var/log/apache/access.log') as f:
    # Crear un diccionario vacío para contabilizar los accesos a cada página
    paginas_accedidas = {}

    # Leer cada línea del archivo
    for linea in f:
        # Si la línea contiene la palabra "GET"
        if "GET" in linea:
            # Buscar el nombre de la página, que está entre los caracteres "/" y " "
            inicio_pagina = linea.find("/") + 1
            fin_pagina = linea.find(" ", inicio_pagina)
            nombre_pagina = linea[inicio_pagina:fin_pagina]
            # Si el nombre de la página termina en "?" (lo que indica que se pasan parámetros),
            # se recorta la cadena hasta ese caracter
            if "?" in nombre_pagina:
                nombre_pagina = nombre_pagina[:nombre_pagina.find("?")]
            # Si el nombre de la página termina en espacio, se recorta la cadena hasta ese caracter
            elif " " in nombre_pagina:
                nombre_pagina = nombre_pagina[:nombre_pagina.find(" ")]
            # Incrementar el contador de accesos a la página correspondiente
            paginas_accedidas[nombre_pagina] = paginas_accedidas.get(nombre_pagina, 0) + 1

    # Ordenar las páginas por número de accesos, de mayor a menor
    paginas_ordenadas = sorted(paginas_accedidas.items(), key=lambda x: x[1], reverse=True)

    # Imprimir los nombres de las 5 páginas más accedidas
    for pagina, accesos in paginas_ordenadas[:5]:
        print(pagina)

