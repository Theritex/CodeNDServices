# Documentación Ansible

Ansible usa contenedor de imagenes conocidas como Execution Enviroments (EE) que actuan como nodos de control.
EE eliminan complejidad a la hora de escalar proyectos automatizados y hacer las cosas como operaciones de ejecucion mucho mas simples.

Se recomienda leer la [documentación](../mysql/Documentacion.md) de mysql para poder trabajar Ansible con bases de datos en MariaDB.

# Instalación Ansible

Instalación en Ubuntu:
```sh
sudo apt update && sudo apt install ansible -y
```
Instalación en Debian:
```sh
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

sudo apt update && sudo apt install ansible -y
```