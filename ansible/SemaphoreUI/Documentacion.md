# Documentación SemaphoreUI

Semaphore es una interfaz web de código abierto que permite la gestion de Ansible de manera sencilla e intuitiva, por lo que es bastante conveniente su uso.

Es posible instalar Semaphore de múltiples maneras, la que se usará en este ejemplo es la vista en [esta página](https://docs.semaphoreui.com/administration-guide/installation/#package-manager).

### Instalación:
Usamos el siguiente comando para obtener el `.deb` del repositorio en GitHub:
```sh
wget https://github.com/ansible-semaphore/semaphore/releases/\
download/v2.10.22/semaphore_2.10.22_linux_amd64.deb
```
Para instalar el paquete `.deb`, usamos el siguiente comando:
```sh
sudo dpkg -i semaphore_2.8.75_linux_amd64.deb
```
Podemos ejecutar el instalador con:
```sh
semaphore setup
```
Durante la instalación, el equipo solicitará los siguientes datos:
```sh
Contraseña MariaDB: ubuntu

sudo semaphore setup \
    --host 127.0.0.1 \
    --port 3000 \
    --user root \
    --pass 'yourpassword' \ #semaphore
    --name semaphore \
    --admin admin \
    --email admin@example.com \
    --admin-password 'password'
```
Creamos la ruta donde alojaremos el fichero `config.json`que nos ha dado el comando previo:
```sh
sudo mkdir /etc/semaphore` && sudo mv config.json /etc/semaphore
```
Creamos el servicio `semaphore.service`:
```sh
sudo nano /etc/systemd/system/semaphore.service
```
En el interior del servicio escribimos lo siguiente:
```sh
[Unit]
Description=Semaphore Service
After=network.target

[Service]
ExecStart=/usr/bin/semaphore server --config=/etc/semaphore/config.json
WorkingDirectory=/ruta/donde/esta/semaphore
User=root  # O reemplázalo por el usuario con el que ejecutas Semaphore
Restart=always

[Install]
WantedBy=multi-user.target
```

### Pasos Previos Antes de la Ejecución
Asegúrate que el servicio UFW no bloquee las direcciones de conexión:
```sh
sudo ufw allow 3000/tcp # Permite el puerto 3000 por tcp
```

### Accediendo a la interfaz de Semaphore Web
Para encender Semaphore, usaremos el siguiente comando:
```sh
semaphore server --config=./config.json
```

Por defecto, semaphore se ejecuta en el puerto `3000`, por lo ne necesitamos habilitar ese puerto mismo para poder acceder.
```sh
http://localhost:3000/ or http://Your-IP-Address:3000
```

### Páginas Externas
Si esta información no es suficiente, se recomienda visitar la siguiente página:
- [Semaphore Docs](https://docs.semaphoreui.com/administration-guide/installation/)
- [Semaphore Devopstricks](https://www.devopstricks.in/installing-semaphore-web-ui-for-ansible-on-ubuntu-22-04-lts/#:~:text=Installing%20Semaphore%20Web%20UI%20for%20Ansible%20on%20Ubuntu,5%20Step%205%3A%20Accessing%20Semaphore%20Web%20UI%20)