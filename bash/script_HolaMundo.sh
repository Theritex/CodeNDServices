#!/bin/bash
# Este es un ejemplo de script de Bash

# Definir una variable
nombre="Mundo"

# Mostrar un mensaje
echo "Hola, $nombre"

# Uso de un condicional
if [ $nombre == "Mundo" ]; then
  echo "Estás en el ejemplo correcto"
fi

# Uso de un bucle
for i in {1..5}; do
  echo "Contando: $i"
done