#Realice un script que liste en la salida estándar los nombres de usuarios del sistema que tengan directorio personal configurado 
#y que éste exista en el filesystem. Si no encuentra ninguno, deberá terminar con un exit status de error.
#Ayuda: El campo 6 del archivo del sistema con información sobre los usuarios contiene la ruta del directorio personal 
#configurado para cada usuario.

#!/bin/bash
usuarios=()
for linea in $(cat /etc/passwd); do
  IFS=':' read -r nombre _ _ _ _ dir <<< "$linea"
  if [[ -d "$dir" ]]; then
    usuarios+=("$nombre")
  fi
done

if [ -z "$usuarios[*]" ]; then
  exit 1
else 
  echo "${usuarios[@]}"
fi
