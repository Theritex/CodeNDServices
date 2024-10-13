Una etiqueta es una meta informacion, un metadato que le damos a un contenedor
Se lo damos por medio de [clave] -- [valor]

```
docker run -l servicio=web -l entorno=desarrollo -l aplicacion=apache --name prueba_web
docker run -l servicio=web -l entorno=desarrollo -l aplicacion=apache --name prueba_db ubuntu
docker run -l servicio=web -l entorno=desarrollo -l aplicacion=apache --name web ubuntu
docker run -l servicio=web -l entorno=desarrollo -l aplicacion=apache --name db ubuntu