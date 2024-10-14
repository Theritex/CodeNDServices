# Documentación SemaphoreUI

Semaphore es una interfaz web de código abierto que permite la gestion de Ansible de manera sencilla e intuitiva, por lo que es bastante conveniente su uso.

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

### Accediendo a la interfaz de Semaphore Web
Por defecto, semaphore se ejecuta en el puerto `3000`, por lo ne necesitamos habilitar ese puerto mismo para poder acceder.
```sh
http://localhost:3000/ or http://Your-IP-Address:3000
```

### Páginas Externas
Si esta información no es suficiente, se recomienda visitar la siguiente página:
- [Semaphore Docs](https://docs.semaphoreui.com/administration-guide/installation/#package-manager)
- [Semaphore Devopstricks](https://www.devopstricks.in/installing-semaphore-web-ui-for-ansible-on-ubuntu-22-04-lts/#:~:text=Installing%20Semaphore%20Web%20UI%20for%20Ansible%20on%20Ubuntu,5%20Step%205%3A%20Accessing%20Semaphore%20Web%20UI%20)