# Documentación SemaphoreUI

Semaphore es una interfaz web de código abierto que permite la gestion de Ansible de manera sencilla e intuitiva, por lo que es bastante conveniente su uso.

Semaphore requiere de docker para funcionar, se recomienda revisar la [documentación](../../Docker/Documentacion.md).

### Instalación:
Usamos el siguiente comando para obtener el `.deb` del repositorio en GitHub:
```sh
wget https://github.com/ansible-semaphore/semaphore/releases/\
download/v2.8.75/semaphore_2.8.75_linux_amd64.deb
```
Para instalar el paquete `.deb`, usamos el siguiente comando:
```sh
sudo dpkg -i semaphore_2.8.75_linux_amd64.deb
```
Podemos ejecutar el instalador con:
```sh
semaphore setup
```
Para usar semahore, podemos usar:
```sh
semaphore service --config=./config.json
```
Configuración inicial para el uso de docker compose, puede ser necesario clonar el repositorio y bajar el docker:
```sh
git clone https://github.com/ansible-semaphore/semaphore.git
```
Dentro del repositorio clonado (en mi caso), creamos un directorio y creamos un fichero dentro con el siguiente contenido:
```sh
cd semaphore
mkdir docker-semaphore
```
Ceamos un fichero con el que montaremos el docker::
```sh
sudo nano docker-compose.yml
```
Dentro del fichero `.yml` ingresaremos el siguiente código:
```yml
version: "3"
services:
 semaphore:
  image: semaphoreui/semaphore:latest
   container_name: semaphore
    ports:
     - "3000:3000"
    environment:
     - SEMAPHORE_DB=bolt
    volumes:
     - semaphore_data:/data
volumes:
 semaphore_data:
```
Iniciar semaphore con docker compose:
```sh
docker-compose up -d
```

### Accediendo a la interfaz de Semaphore Web
Por defecto, semaphore se ejecuta en el puerto `3000`, por lo ne necesitamos habilitar ese puerto mismo para poder acceder.
```sh
http://localhost:3000/ or http://Your-IP-Address:3000
```

### Páginas Externas
Si esta información no es suficiente, se recomienda visitar la siguiente página:
- [Semaphore Docs](https://docs.semaphoreui.com/administration-guide/installation/#package-manager)
- [Semaphore Devopstricks](https://www.devopstricks.in/installing-semaphore-web-ui-for-ansible-on-ubuntu-22-04-lts/#:~:text=Installing%20Semaphore%20Web%20UI%20for%20Ansible%20on%20Ubuntu,5%20Step%205%3A%20Accessing%20Semaphore%20Web%20UI%20)