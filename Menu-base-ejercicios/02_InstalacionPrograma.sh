#!/bin/bash
#Los creadores del programa maravil necesitan un script de
#instalación, llamado instalar.sh. Debe realizar estas tareas:
#1) presentar como pantalla de bienvenida el archivo bienvenida.txt, que
#ocupa menos de una pantalla; el usuario deberá digitar Enter para
#continuar.
#2) presentar una pantalla con la licencia, el archivo licencia.txt, también
#menor de una pantalla; el usuario deberá digitar la tecla S para aceptar la
#licencia, si no la acepta el programa avisa y termina con código de error
#1.
#3) inicializar una variable DIRINSTAL con el nombre del directorio de
#instalación por defecto, /usr/local/maravil.
#4) preguntar al usuario el directorio de instalación, mostrando el nombre
#sugerido (variable DIRINSTAL); el usuario podrá digitar un nombre de
#directorio o Enter para aceptar el directorio sugerido. En cualquier caso,
#el nombre del directorio de instalación deberá quedar en la variable
#DIRINSTAL.
#5) verificar si existe ya el directorio de instalación; es así, continúa la
#instalación, y si no, deberá pedir autorización al usuario, crearlo y
#verificar la creación exitosa. Si el usuario no autoriza la creación del
#directorio, el programa termina con error 2; si no se pudo crear el
#directorio el programa termina con error 3. En todos los casos se informa
#lo realizado.
#6) copiar los archivos maravil.py, LEAME y manual.txt hacia el directorio
#de instalación.  Si la copia no da error, se informa la terminación exitosa
#de la instalación; en otro caso, se informa el error y se borra el
#directorio de instalación y todo su contenido.  

# SOLUCION 1 

# cat "bienvenida.txt"
# echo "Pulsa enter para continuar..."
# read -s -n 1 tecla
# if [ "$tecla" = "" ]; then
#   echo  "Intro"
# else
#   echo "No has pulsado intro, adios"
#   exit 0
# fi

# SOLUCION 2

#!/bin/bash

# Step 1: Display welcome message
# Se muestra el mensaje de bienvenida al usuario
cat bienvenida.txt
# Se solicita al usuario que presione Enter para continuar
read -p "Press Enter to continue..."

# Step 2: Display license and ask for acceptance
# Se muestra el mensaje de la licencia al usuario
cat licencia.txt
# Se solicita al usuario que acepte la licencia
read -p "Do you accept the license? (S/n): " acceptance
# Si el usuario no acepta la licencia, se muestra un mensaje de error y se termina la instalación
if [[ "$acceptance" != "S" ]]; then
    echo "Installation aborted. License not accepted."
    exit 1
fi

# Step 3: Set default installation directory
# Se inicializa la variable DIRINSTAL con el directorio de instalación por defecto
DIRINSTAL="/usr/local/maravil"

# Step 4: Ask user for installation directory
# Se le pregunta al usuario si desea ingresar un directorio de instalación personalizado
read -p "Enter installation directory [$DIRINSTAL]: " user_dir
# Si el usuario ingresa un directorio personalizado, se actualiza la variable DIRINSTAL
if [[ -n "$user_dir" ]]; then
    DIRINSTAL="$user_dir"
fi

# Step 5: Verify and create installation directory
# Se verifica si el directorio de instalación ya existe
if [[ -d "$DIRINSTAL" ]]; then
    echo "Installation directory already exists."
# Si el directorio de instalación no existe, se le pregunta al usuario si desea crearlo
else
    read -p "Do you want to create the installation directory? (y/N): " create_dir
    # Si el usuario acepta, se crea el directorio de instalación
    if [[ "$create_dir" == "y" ]]; then
        mkdir -p "$DIRINSTAL"
        # Si no se pudo crear el directorio, se muestra un mensaje de error y se termina la instalación
        if [[ $? -ne 0 ]]; then
            echo "Error creating installation directory. Aborting."
            exit 3
        # Si se crea correctamente, se muestra un mensaje de éxito
        else
            echo "Installation directory created successfully."
        fi
    # Si el usuario no desea crear el directorio, se muestra un mensaje de error y se termina la instalación
    else
        echo "Installation aborted. Installation directory not created."
        exit 2
    fi
fi

# Step 6: Copy installation files to directory
# Se copian los archivos de instalación al directorio especificado
cp maravil.py LEAME manual.txt "$DIRINSTAL"
# Si hubo un error al copiar los archivos, se muestra un mensaje de error y se elimina el directorio de instalación creado
if [[ $? -ne 0 ]]; then
    echo "Error copying installation files. Aborting."
    rm -rf "$DIRINSTAL"
    exit 4
# Si se copiaron los archivos correctamente, se muestra un mensaje de éxito
else
    echo "Installation successful."
fi
