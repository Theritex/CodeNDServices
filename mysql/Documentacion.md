# Documentación MySQL

### Ejecuta Actualiaciones del Sistema
Para ejecutar una instalación sin problemas, debemos actualizar el sistema.
```sh
sudo apt update
```

### Instalación Servidor MariaDB
Para instalar MariaDB en Ubuntu, es necesario ejecutar los siguiente comandos:
```sh
sudo apt install mariadb-server -y
```
Para comprobar el estado del servicio de MariaDB:
```sh
sudo systemctl status mariadb.service
```
- En caso de que mariadb.service no este en ejecución, usaremos el siguiente comando: `sudo systemctl start mariadb.service`
- Si queremos detener el servicio mariadb.service, usaremos el siguiente comando: `sudo systemctl stop mariadb.service`

Para establecer una clave de acceso en MariaDB, ejecutamos el siguiente comndo (`se recomienda usar una clave segura`):
```sh
sudo mysql_secure_installation
```
- Si usamos menos de 8 carácteres nos advertirá que es una clave insegura pero podremos proceder.
- Si lo dejamos vacio y presionamos enter, lo tomará como que no se establece una clave e igualmente podemos proceder.
- Se recomienda guardar la clave en un documento seguro o apuntada en un papel para no perder dicha clave.

### Inicio y Uso de MariaDB
Para iniciar MariaDB en la linea de comandos, usamos el siguiente comando:
```sh
mysql -u root -p
```

Para crear una base de datos es necesario ejecutar el siguiente comando:
```sh
CREATE DATABASE `bddname`; # Sustituimos 'bddname' por el nombre de nuestra base de datos
```
Para crear un usuario con contraseña, ejecutamos el siguiente comando:
```sh
CREATE USER 'usuario' IDENTIFIED BY 'clave'; # Creamos un usuario que tiene acceso a esta base, se cambia 'usuario' por el nombre deseado, asi mismo con 'clave', hacemos los mismo
```
Para otorgar permisos basicos de uso a dicho usuario, permitiendo la conexión con la base de datos, pero sin tener privilegios para hacer cambios:
```sh
GRANT USAGE ON *.* TO 'usuario'@localhost IDENTIFIED BY 'clave'; # Cambiamos los parametros por los que se necesiten
```
Si queremos otorgar todos los privilegios posibles sobre la base de datos creada, es necesario ejecutar este comando cambiando los parametros establecidos:
```sh
GRANT ALL PRIVILEGES ON `bddname`.* TO 'usuario'@localhost;
```
Para actualizar los privilegios y que surgan efecto, usamos el siguiente comando:
```sh
FLUSH PRIVILEGES;
```