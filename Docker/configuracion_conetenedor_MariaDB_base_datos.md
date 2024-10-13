docker run -d --name mariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:10.5

docker exec -it mimariadb env
[ver que realmente se ha creado una variable de entorno con el contenido previo "my secret pw"]

docker exec -it mimariadb bash
mysql -u root -p
[acceder a la base de datos, entramos desde el contenedor]

---------------------------------crear mismo contenedor pero acceder desde fuera, desde host

docker rm -f mimariadb ----> elimina el contenedor creado anteriormente

.........................

docker run -d -p 3306:2206 --name mimariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:10.5
sudo apt install mariadb-client ----> necesario instalar para el siguiente paso
mtsql -u root -p -h 127.0.0.1 ----> ejecutando desde host, no desde el contenedor