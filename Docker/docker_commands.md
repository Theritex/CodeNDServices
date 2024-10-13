docker run -d --name hora-container ubuntu bash -c 'while true; do echo $(date + "%T"); sleep 1; done'
[llamada a docker] [ejecucion de docker] [-d (desatendido)] [asignamos un nombre] [maquina (ubuntu)] [uso de bash (por defecto al indicar ubuntu viene bash)]

docker run -d --name hora-container ubuntu bash -c 'while true; do echo $(date + "%T"); >> hora.txt; sleep 1; done'
[Guardar la hora en un fichero txt]

docker ps
[sin informacion]

docker top <contenedor>
[ver los servicios de docker]

docker inspect <contenedor>
[Obtener informacion detallada del contenedor con el que se trabaja, salida json]

docker inspect --format='{{.Id}}' <contenedor>
[Mostrar unicamente el identificador del contenedor]
(Es posible modfiicar estos parametros para mostrar contenido diferente) / filtra informacion del json

docker log -f <contenedor>
[Ver el log en vivo del contenedor]

docker pause <contendor> // docker stop <contenedor>
[Pausar contenedor]

docker unpause <contenedor> // docker start <contenedor>
[Reanudar contenedor]

docker restart <contenedor>
[Parada y reinicio de servicio]

docker exec <contenedor> <comando>
[Ejecucion de comandos bash dentro de contenedor] ( ejemplo: docker exec contenedor1 ls)

docker cp <fichero> <contenedor>:/fichero.txt .
[Copiar ficheros desde el contenedor x al directorio]

docker images
[ver imagenes de contenedores creados (almacenados en local)]