#Realice un script que reciba como parámetros: un path a un directorio y una de las siguientes opciones "-d" o "-f" 
#Si el segundo parámetro es "-f" debe informar por la salida estándar la cantidad de archivos del directorio pasado como primer parámetro 
#y causar la terminación del script.
#Si el segundo parámetro es "-d" debe informar por la salida estándar de directorios del directorio pasado como primer parámetro.
#Si el primer parámetro es un directorio invalido o el segundo parámetro no es "-d" o "-f" el script debe terminar con error.

#!/bin/bash

if [[ ! -d "$1" ]]; then
  exit 1
fi
if [[ "$2" != "-f" && "$2" != "-d" ]]; then
  exit 1
fi


if [[ $2 == "-f" ]]; then
  cantidad=(find "$1" -type f | wc -l)
  exit 0
fi

if [[ $2 == "-fd" ]]; then
  cantidad=(find "$1" -type f | wc -l)
  exit 0
fi

