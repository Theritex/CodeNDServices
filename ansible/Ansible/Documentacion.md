# Documentación Ansible

Ansible usa contenedor de imagenes conocidas como Execution Enviroments (EE) que actuan como nodos de control.
EE eliminan complejidad a la hora de escalar proyectos automatizados y hacer las cosas como operaciones de ejecucion mucho mas simples.

Se recomienda leer la [documentación](../mysql/Documentacion.md) de mysql para poder trabajar Ansible con bases de datos en MariaDB.

### Instalación Ansible

Instalación en Ubuntu:
```sh
sudo apt update
```
```sh
sudo apt install ansible-core
```

Instalación en Debian:
```sh
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

sudo apt update && sudo apt install ansible -y
```

### Requisitos Conexión

Es posible que a la hora de ejecutar un playbook:
```sh
ansible-playbook -i inventory.ini playbook.yml
```
De una salida de error de credenciales, esto significa que es necesario usar credenciales para acceder a otros equipos, para solucionar este problema, es necesario instalar `sshpass`:
```sh
sudo apt install sshpass
```
En el interior del fichero `inventory.ini` usaremos las credenciales para poder acceder a diferentes máquinas, de la siguiente forma:
```ini
# Interior inventory.ini
[clientes]
192.168.1.39 ansible_ssh_user=ubuntu ansible_ssh_pass=ubuntu
```
Para ejecutar el codigo usaremos el siguiente comando:
```sh
ansible-playbook -i inventory.ini playbook.yml --ask-become-pass
```
Esto permitirá el acceso por SSH a los equipos especificados dentro de `inventory.ini`.<br>
En caso de dar el siguiente error:
```diff
- fatal: (192.168.1.36] FAILED! => {"msg": "Using a SSH password instead of a key is no tpossible because host key checking is enabled sshpass does not support this. Please add this host's fingerprint to you known_hosts file to manage this host."}
```
Tendremos que editar el fichero `ansible.cfg`de la ruta `/etc/ansible/`, en caso de no existir dicha ruta, la tendremos que crear y en el interior del fichero de configuración escribiremos lo siguiente:
```ini
[defaults]
host_key_checking = False
```
Esto nos permite desactivar la verificación de claves ssh, podemos hacer esto temporalmente configurando las variables de entorno:
```ini
export ANSIBLE_HOST_KEY_CHECKING=False
```
En caso de dar el siguiente error:
```diff
Error Missing Password
```
Tendremos que escribir en el fichero `inventory.ini` el siguiente contenido:
```
[servidores]
192.168.1.36 ansible_user=nombre_usuario ansible_become_pass=tu_password_sudo
```