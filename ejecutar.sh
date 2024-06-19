#!/bin/bash

# Verificar si se proporcionó un nombre de archivo
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_archivo_sin_extension>"
    exit 1
fi

# Nombre del archivo sin extensión
FILENAME=$1

# Ensamblar el archivo .s a .o
as -o "${FILENAME}.o" "${FILENAME}.s"
if [ $? -ne 0 ]; then
    echo "Error al ensamblar el archivo ${FILENAME}.s"
    exit 1
fi

# Enlazar el archivo .o para crear el ejecutable
ld -o "${FILENAME}" "${FILENAME}.o"
if [ $? -ne 0 ]; then
    echo "Error al enlazar el archivo ${FILENAME}.o"
    exit 1
fi

# Ejecutar el archivo ejecutable y mostrar el código de salida
./$1 ; echo $?
