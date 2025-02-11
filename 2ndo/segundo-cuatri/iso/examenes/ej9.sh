#Escriba un script de Bash que imprima en pantalla la cantidad de archivos del directorio /var/log/$SERVICE que contienen un patrón 
#de texto que el usuario pasa como parámetro, $SERVICE es una variable de entorno, si la misma no posee ningún valor debe tomar 
#el valor por defecto "local_service". El script debe finalizar retomando el valor que indica que el proceso se ejecutó correctamente.

#!/bin/bash

cantidad=(grep -rl "$1" /var/log/$SERVICE | wc -l)


echo "La cantidad es de $cantidad"nn m

exit 0