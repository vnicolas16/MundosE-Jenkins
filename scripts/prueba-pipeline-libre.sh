#!/bin/bash

REPO="node-app-devops"

# Clona el repositorio
git clone "https://github.com/roxsross/$REPO" 

# Verifica si la carpeta clonada existe
if [ -d "$REPO" ]; then
    # Cuenta los archivos en el repositorio
    file_count=$(find "$REPO" -type f | wc -l)
    echo "Número de archivos en el repositorio $REPO: $file_count"
    
    # Elimina el repositorio clonado
    rm -rf "$REPO"
else
    echo "Error: No se pudo clonar el repositorio $REPO"
fi