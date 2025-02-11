#Realice un script que agregue todos los nombres de usuario del sistema a un arreglo e implemente las siguientes funciones:
#- existe <parametro1>: Devuelve 0 si el usuario existe en el arreglo, 1 en caso contrario
#- eliminar_usuario <parametro1>: Si el usuario pasado como parámetro existe en el arreglo lo elimina del mismo. 
#Caso contrario devuelve código de error 2
#- usuarios_con_patron <parametro1>: Recorre el arreglo e imprime en pantalla los nombres de los usuarios en cuyos caracteres 
#aparece el patrón pasado como parámetro
#- cantidad: Imprime la cantidad total de usuarios en el arreglo
#- usuarios: Imprime todos los nombres de los usuarios que están en el arreglo

users=($(cat /etc/passwd | cut -d':' -f1))

function existe {
  if [[ $# -ne 1 ]]; then
    return 1
  fi
  for user in "${users[@]}"; do
    if [[ "$user" == "$1" ]]; then
      return 0;
    fi
  done
  return 1
}

function eliminar_usuario {
    if [[ $# -ne 1 ]]; then
      return 2
    fi
    for ((i=0;i<${#users[@]};i++)); do
      if [[ "${users[i]}" == "$1" ]]; then
        unset users[i]
        users=("${users[@]}")
        return 0
      fi
    done
    return 2
}

function existe {

  for user in "${users[@]}"; do
    if [[ "$user" == *"$1"* ]]; then
      echo "$user";
    fi
  done
}

