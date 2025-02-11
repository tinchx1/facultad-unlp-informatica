#Se desea implementar un reproductor multimedia en bash para archivos de audio y video, que debe funcionar de la siguiente
#El script recibe como parámetros un flag que indica el tipo de los contenidos a reproducir (-m o -v, para música o video respectivamente), 
#y una lista de rutas a los archivos que se quieren reproducir.
#Primero se deberá validar que se indique el tipo de los archivos (por simplicidad serán o bien todos de audio, o bien todos de video, 
#pero no mezclados), y que se reciba al menos un archivo a reproducir (el número de archivos a reproducir es desconocido de antemano).
#Luego se comenzará la reproducción de los archivos en el orden en que se los recibió, validando antes de reproducir cada archivo si éste existe 
#en el file system. En caso de no existir, se debe guardar el error en el archivo /var/log/reproductor.error consignando la fecha del error y 
#la ruta al archivo que no existe. Si el archivo sí existe, se lo debe reproducir con el comando vlc, pasándole como parámetros la ruta al archivo 
#y el tipo de reproducción (-m ó -v). Por ejemplo: vlc mitema.mp3 -m ó vlc mivideo.mp4 -v

#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Se debe recibir al menos 2 parametros"
  exit 1
fi

if [ $1 != "-m" && $1 != "-v" ]; then
  echo "El parametro 1 debe ser -m o -v"
  exit 1
fi

tipo=$1
shift

for arch in "$@"; do
  if [ ! -f "$arch" ]; then
    echo "$(date): $arch" >> /var/log/reproductor.error
  else
    vlc "$arch" "$tipo"
  fi
done