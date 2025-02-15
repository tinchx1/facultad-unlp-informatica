#Realice un script que verifique cada 3 minutos si existe el archivo /var/log/any-service/error.log. 
#Si el archivo existe y dentro de el hay al menos una linea con el texto "FATAL ERROR:" debemos: comprimir y empaquetar el contenido del directorio
#/var/log/usr-service, guardarlo en un directorio que es pasado como parámetro al script y además causar la terminación del script apropiadamente. 
#Cuando el script termina debemos informar por la salida estandard la cantidad de lineas del archivo que contenian el texto "FATAL ERROR".

arch="/var/log/any-service/error.log"
while true; do
  if [[ -f "$arch" ]]; then
    count=(grep -c "FATAL ERROR:" "$arch" | wc -l)
    if [[ "$count" -gt 0 ]]; then
      tar czf "$1/usr-service.tar.gz" "/var/log/usr-service"
      echo "$count cantidad de lineas"
      exit 0
    fi
  fi
  sleep 180
done