if [ $# -lt 1 ]; then
  echo "se debe recibir al menos un parametro"
  exit 1
fi

iteracion=0
inexistentes=0

for ruta in "$@"; do
  ((iteracion++))
  if [ $((iteracion % 2)) -ne 0 ]; then
    if [ -e "$ruta" ]; then
      if [ -d "$ruta" ]; then
        echo "\"$ruta\" es directorio"
      elif [ -f "$ruta" ]; then
        echo "\"$ruta\" es archivo"
      fi
    else
      ((inexistentes++))
      echo "\"$ruta\" no existe"
    fi
  fi
done

echo "Total de rutas inexistentes: $inexistentes"
