# Instalación Ansible-Semaphore
> Documentado por Andrés Ruslan Abadías Otal | [Nisamov](https://github.com/Nisamov)
### Creación Usuario Semaphore
```sh
sudo adduser --system --group --home /home/semaphore semaphore
tail /etc/passwd
```
### Instalación/Configuración MariaDB
Instalamos MariaDB y la configuramos para el usuario creado.
```sh
sudo apt install mariadb-server
systemctl status mariadb
sudo mariadb # Revisamos su funcionamiento
sudo mysql_secure_installation
mysql installation:
    -- Switch to unix_socket authentication [Y/n]: n
    -- Change the root passwod [Y/n]: y
    New password: {clave de acceso} # Ejemplo: ubuntu
    Re-enter new password: {clave de acceso} #Ejemplo: ubuntu
    -- Remove anonymous users? [Y/n]: [Enter = yes]
    -- Disallow root login remotely? [Y/n]: [Enter = yes]
    -- Remove test database and access to it? [Y/n]: [Enter = yes]
    -- Reload privilege tables now? [Y/n]: [Enter = yes]
sudo mariadb
 > CREATE DATABASE semaphore_db;
 > SHOW DATABASES;
 > GRANT ALL PRIVILEGES ON semaphore_db.* TO semaphore_user@localhost IDENTIFIED BY '{crear clave de acceso}'; # La clave ingresada podra ser usada posteriormente para acceder desde este nuevo usuario :: Ejemplo: semaphore
 > FLUSH PRIVILEGES;
```
### Instalación/Configuración Semaphore
Instalamos Semaphore y creamos las rutas correspondientes.
```sh
wget https://github.com/ansible-semaphore/semaphore/releases/download/{version}/semaphore_{version}_linux_amd64.deb # Se recomienda descargar la version mas reciente - revisar en internet
ls -l # Revision de exitencia del fichero .deb
sudo apt install ./semaphore_{version}_linux_amd64.deb
sudo apt autoremove
semaphore setup
    --What datbase to use: 1
    --db Hostname (default 127.0.0.1:3306): [Enter = yes]
    --db User (default root): semaphore_user
    --db Password: {clave de acceso} # Ejemplo: semaphore
    --db Name (default semaphore): semaphore_db
    --Playbook path (defualt /tmp/semaphore): [Enter = yes]
    --Public URL (optional, example: https://example.com/semaphore): [Enter = yes]
    --Enable email alerts? (yes/no) (default no): [Enter = yes]
    --Enable telegram alerts? (yes/no) (default no): [Enter = yes]
    --Enable slack alerts? (yes/no) (default no): [Enter = yes]
    --Enable Rocket.Chat alerts? (yes/no) (default no): [Enter = yes]
    --Enable Microsoft Team Channel Alerts? (yes/no) (default no): [Enter = yes]
    --Enable LDAP authentication? (yes/no) (default no): [Enter = yes]
    --Config output directory (defualt /home/jay): [Enter = yes]
    > Username: username # Este es el username con el que nos conectaremos a semaphore posteriormente
    > Email: example.email@mymail.com
    > Your name: MyName #Este es el nombre simple
    > Password: {clave de acceso al usuario} # Aqui definimos la clave con la que accederemos al usuario
ls -l # Verificamos que se ha creado un fichero `config.json`
sudo chown semaphore:semaphore config.json # Cambiamos la propietariedad del fichero config.json a semaphore y su grupo
ls -l # miramos que los cambios hayan surtido efecto
sudo mkdir /etc/semaphore
sudo chown semaphore:semaphore /etc/semaphore # Establecemos los dueños de la nueva ruta
sudo mv config.json /etc/semaphore
ls -l /etc/semaphore # Aseguramos la existencia del fichero config.json en la ruta indicada
```
### Instalación Ansible
```sh
sudo apt install ansible
semaphore server --config /etc/semaphore/config.json # Iniciar servicio Ansible-Semaphore por el fichero .json
```
### Configuración en Web
Abrimos el navegador desde un equipo remoto o localhost para acceder a la página de semaphore, posteriormente ponemos la IP en caso de ser un equipo externo:puerto o localhost:puerto.
```sh
http://localhost:3000/ or http://Your-IP-Address:3000 # Accedemos al navegador y accedemos a la interfaz de Semaphore
```

### Páginas Externas
Si esta información no es suficiente, se recomienda visitar las siguientes páginas:
- [Semaphore Docs](https://docs.semaphoreui.com/administration-guide/installation/)
- [Semaphore Devopstricks](https://www.devopstricks.in/installing-semaphore-web-ui-for-ansible-on-ubuntu-22-04-lts/#:~:text=Installing%20Semaphore%20Web%20UI%20for%20Ansible%20on%20Ubuntu,5%20Step%205%3A%20Accessing%20Semaphore%20Web%20UI%20)