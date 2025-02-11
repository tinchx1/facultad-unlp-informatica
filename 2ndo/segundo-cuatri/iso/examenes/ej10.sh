#Realice un script de Bash que agregue a un arreglo los nombres de los archivos del directorio /var/log que tengan el texto "access" en su nombre. 
#Luego presente un menú al usuario con las siguientes funciones sobre ese arreglo
#cantidad: Imprime la cantidad de archivos del directorio /var/log que tengan el texto "access" en su nombre 
#listar: Imprime los nombres de todos los archivos del directorio /var/log que tengan el texto "access" en su nombre 
#eliminar: Solicita al usuario un indice del arreglo y un carácter que puede ser "l" (lógico) o "f"(fisico)". 
#Si el segundo parámetro es "l", solo borra la entrada en el arreglo, si es "f" borra la entrada en el arreglo y el archivo del FileSystem.
#fin: Termina el script con el código de error que indica que el proceso es exitoso
#cantidad, listar y eliminar deben ser implementadas en funciones individuales

#!/bin/bash

arreglo=($(find /var/log -potype f -name "*access*"))

function cantidad {
  echo "La cantidad es de ${#arreglo[@]}"
} 

function listar {
  for arch in "${arreglo[@]}"; do
    echo "$arch"
  done
} 

function eliminar {
  read indice
  read caracter

  if [["$indice" -lt "${#arreglo[@]}" ]]; then
    if [["$caracter" == "f"]]; then
      rm -f "${arreglo[indice]}"
    fi
    unset arreglo[indice]
    arreglo=("${arreglo[*]}")
  fi
}