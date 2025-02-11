function inicializar {
  arreglo=()
}
function agregar_elem {
  echo "Ingrese un parametro"
  if [ "$#" -ne 1 ]; then 
    return 1
  fi

  arreglo+=("$1")
}

function eliminar_elem {
  if [ $# -ne 1 ]; then
    echo "Ingrese un parametro"
    return 1
  fi

  if [ "$1" -ge "${#arreglo[@]}" ]; then
    echo "pos invalida"
    return 2
  fi

    unset arreglo[$1]

    arreglo=(${arreglo[*]})

    echo "Elemento $1 fue eliminado"

}