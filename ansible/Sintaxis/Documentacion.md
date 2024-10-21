# Sintaxis Ansible

<!--Documentado por Andrés Ruslan Abadías Otal (Nisamov)-->
> Documentado por Andrés Ruslan Abadías Otal | [Nisamov](https://github.com/Nisamov)

<details>
    <summary>Contenido y Estructura de los Inventarios</summary>

### Contenido y Estructura de los Inventarios:

En el inventario, las direcciones los servidores pueden ser tanto por DNS como por Dirección IP, por ello es posible indicarlas de ambas formas.
El nombre del grupo donde están esas direcciones agrupadas se encuentra entre "[]", lo que posteriormente podemos utilizar para llamar a esa agrupación de direcciones y asignarle un playbook.

Los hosts pueden estar en diferentes grupos, segun el rol del host, su ubicación fisica, ya sea en producción o no y demás bariables, lo que permite aplicar dichas playbooks a conjuntos especificos del host en funcón de sus propóstos, características o ubicación fisica.
```ini
[webservers]
web1.example.com
web2.example.com
192.0.2.42

[db-servers]
db1.example.com
db2.example.com

[development]
192.0.2.42
```
</details>

<details>
    <summary>Definición de grupos Anidados</summary>

### Definición de grupos Anidados:

Los inventarios de Ansible pueden incluir grupos de grupos de hosts, con lo que podemos crear grupos que aniden grupos en su interior, uniendo asi dos grupos declarados previamente, en un solo grupo, pero facilitando la posterior llamada individual a estos mismos grupos.

Para lograr esto, usamos el sufijo `":children"`, se aplica siguiendo el siguiente ejemplo:
```ini
[administracion_red]
192.168.1.12
administracion.admred.com
192.168.1.22

[oficinas_p1]
192.168.0.44
192.168.0.45
192.168.0.46

[full-enterprise:children]
administracion_red
oficinas_p1
```
</details>

<details>
    <summary>Definición de Hosts con Rangos</summary>

### Definición de Hosts con Rangos:

Ansible cuenta con un sistema de especificación de rangos para los hosts de forma que permite especificar rangos numericos o alfabéticos gracias a la siguiente sintaxis: `[START:END]`.

Esto permitirá elegir u rango sin tener que escribir cada una de las direcciones, facilitando y automatizando la tarea en grandes cantidades.

Este sistem pede ser visto de la siguiente manera:
```ini
[red_local]
192.168[1:9].[0.255] # En este caso coincide con todas las direcciones IPv4 de la 192.168.1.0 a la 192.168.9.255

[lista_servidores]
server[01:25].example.com # En este caso, coincidirá con los hosts del server01.example.com al server25.example.com

[direcciones_dns]
[a:c].dns.example.com #En este caso, coincidirá con todos los hosts denominados (a,b y c).dns.example.com

[direcciones_ipv6]
2001:db8::[a:c] #En este caso coincidirá con todas las direcciones IPv6 de la 2001:db8::("a" a la "c")
```

```diff
- [CUIDADO] - Posibles problemas a la hora de llamar direcciones.

En el ejemplo "lista_servidores", las direccines no coincidirán con "server2.example.com", pero si lo harán con "server02.example.com"
```
Esto indicado anteriormente es importante a la hora de saber que direcciones necesitamos manejar.
</details>

<details>
    <summary>Administración de Ficheros de Configuración</summary>

### Administración de Ficheros de Configuración:

Para gestionar la configuración de Ansible, podemos crear un fichero `.cfg`, este permitirá aplicar configuraciones a varias herramientas de Ansible.

El fichero de configurción contiene parámetros definidos como `clave-valor` con los siguientes parámetros:

Aqui cuentas con un ejemplo típico de un fichero de configuración básico (`ejemplo.cfg`):
```ini
[defaults]
inventory = ./inventario # Ubicacion del inventario
remote_user = usuario    # Usuario remoto
ask_pass = false         # Solicitar clave de acceso

[escalado_de_privilegios]
become = true            # Permitir escalado de privilegios
become_method = sudo     # Metodo de escalado
become_user = root       # Usuario de escalado
become_ask_pass = false  # Solicitar clave de acceso al escalar
```
Los ficheros de configuración permiten el uso de comentarios dentro de ellos, esto puede lograrse mediante dos diferentes maneras:
- El uso de "#" (Almohadilla), de manera similar a Bash.
- El uso de ";" (Punto y Coma), este método al igual que la almohadilla, permite comentar toda la linea

Un ejemplo de uso práctico puede ser el siguiente:
```cfg
[defaults]
# Ruta de inventario
inventory = /home/usuarioejemplo/inventario # Ruta establecida: /home/usuarioejemplo/inventario
remote_user = usuario1 # Usuarios disponibles "usuario1", "usuario5" y "neousuario"
ask_pass = true

[escalado_de_privilegios]
become = false
become_method = sudo
become_user = root
become_ask_pass = true

; [ejemplo]
; inventory = sin/declarar
```
</details>

<details>
    <summary>Estructura y Formato de un Playbook</summary>

### Estructura y Formato de un Playbook:

Un playbook es un fichero escrito en formato `YAML` que se guarda generalmente con la extensión `.yml`.

El playbook usa un sistema de espaciados para indicar la estructura de los datos almacenados, `YAML` no establece ningun requisito sobre cuántos espacios se usan para la sangría pero se aplican las siguientes reglas para su correcto funcionamiento:
- Los elementos de los datos deben estar en el mismo nivel de la estructura con la misma sangría.
- Los elementos secundarios deben tener más sangría que los elementos previos.

En el playbook se comienza con una linea formada por tresguiones consecutivos (`---`) marcando el inicio del documento, del mismo modo, se usan tres puntos consecutivos (`...`) para marcar el final del documento, no obstante, es una práctica comúnmente omitida.

Un ejemplo de un playbook puede ser el siguiente:
```yml
- name: Escribir nombre de playbook
  hosts: Nombre_Grupo_Servidores_Asignados
  become: yes
  tasks:
    - name: Nombre de Tarea
      apt: # Usas apt para instalar
        name: git # instalar el paquete git
        state: present # aseguramos que lo has descargado correctamente

    - name: Obtener el directorio del usuario actual
      ansible.builtin.set_fact:
        user_home: "{{ ansible_env.HOME }}"

    - name: Clonar el repositorio SSP
      git:
        repo: https://github.com/Nisamov/ssp
        dest: "{{ user_home }}/ssp"
        update: yes

    - name: Ejecutar comandos dentro del repositorio clonado
      command: ./install.sh
      args:
        chdir: "{{ user_home }}/ssp"
```
En el ejemplo de playbook anterior se ejecuta el siguiente codigo:
- 1: Creación de task (Nombre de Tarea).
    Instala git y se asegra de su correcta instalación.
- 2: Obtención de usuario actual.
    Guarda el nombre del usuario y ru tua "/home" actual en la variable "user_home".
- 3: Clonación de repositorio SSP.
    Clona el repositorio SSP y lo guara dentro del "/home" almacenado previamente.
- 4: Ejecución de instalador.
    Ejecuta el instalador de SSP.

> [NOTA]: [SSP](https://github.com/Nisamov/ssp) (Secure Service Protocol) es un servicio creado por Andrés Ruslan Abadías Otal, el cual detiene todos los servicios del sistema que no se encuentren dentro de la "whitelist", es un servicio que pude ser peligroso, se recomienda su uso con cuidado.

### Iniciación en Playbooks:

Los playbooks son una lista de ordenes organizados de tal forma de ejecuten listas de forma ordenada.

Para cmenar con los playbooks es necesario crear unfichero `.yml` donde aplicar claves, siendo estas las siguientes asignaciones:
```yml
---
name: nombre del playbook
hosts: nombre_inventory
...
```
- `name`: Name nos permite asignar un nombre, puede o no relacionarse con el playbook, pues sirve como etiqueta o identificador.
- `hosts`: Hosts nos permite asignar las siguientes tareas a un grupo de direcciones creadas en el fichero `inventory.ini`.

Para crear un item dentro de una lista, usamos guiones de la siguiente forma
```yml
- ejemplo
- item2
- item3
```
Esto nos permite saber la estructura a seguir a la hora de crear una tarea (`task`) de la siguiente manera:
```yml
--- # Inicio del fichero
name: Ejemplo tasks # Nombre ejemplo
hosts: direccion_ejemplo # Hosts que usarán las tareas
task: # Tareas
    - ejemplo
    - item2
    - item3
... # Fin del fichero
```
</details>

<details>
    <summary>Módulos en los Playbooks</summary>

### Módulos en los Playbooks:

> `ansible.builtin.user`: Es un módulo que usa los elementos (name, uid y state) para saber información sobre un usuario.
```yml
tasks:
# En esta tarea garantizamos que el usuario1 cuente con el UID 4000
    - name: Informacion usuario
      ansible.builtin.user:
        - name: usuario1
        - uid: 4000
        - state: present
```
> `ansible.builtin.user`: Es un módulo que usa los elementos (name y state) para gestionar grupos.
```yml
tasks:
# En esta tarea creamos un grupo con el nombre "nuevo_grupo"
- name: Crear grupo
  ansible.builtin.group:
    name: nuevo_grupo
    state: present
```
> `ansible.builtin.service`: Es un módulo que usa los elementos (name y state) para gesionar servicios en sistemas Unix-like.
```yml
tasks:
# En esta tarea garantizamos que el servicio ssp.service estén en ejecución
    - name: Servicio SSP
      ansible.builtin.service:
        name: ssp
        enabled: true
```
> `ansible.builtin.systemd`: Es un módulo que usa los elementos (name y state) para gestionar servicios que usan `systemd`.

Podemos usa los siguientes parámetros para manejar los servicios con mayor precisión:
- `started`: Inicia el servicio.
- `stopped`: Detiene el servicio.
- `restarted`: Reinicia el servicio.
- `reloaded`: Recarga la configuración sin reiniciar.
- `absent`: Desactiva y elimina el servicio.
```yml
tasks:
# En esta tarea reiniciamos el servicio nginx
- name: Restart a systemd service
  ansible.builtin.systemd:
    name: nginx
    state: restarted
```
> `ansible.builtin.apt`: Es un módulo que usa los elementos (name y state) para gestionar paquetes usando APT.
```yml
tasks:
# En esta tarea instalamos nginx
- name: Instalar paquete Nginx en Ubuntu/Debian
  ansible.builtin.apt:
    name: nginx
    state: present
```
> `ansible.builtin.yum`: Es un módulo para CentOS/RedHat que usa los elementos (name y state) para gestionar paquetes usando YUM.
```yml
tasks:
# En esta tarea instalamos nginx uando YUM
- name: Instalar paquete en RedHat/CentOS
  ansible.builtin.yum:
    name: httpd
    state: present
```
> `ansible.builtin.copy`: Es un módulo que usa los elementos (src y dest), permitiendo copiar archivos a nuevas direcciones.
```yml
tasks:
# En esta tarea copiamos un fichero a una ruta diferente
- name: Copiar un archivo local
  ansible.builtin.copy:
    src: /ruta/local/archivo.txt
    dest: /ruta/remota/archivo.txt
```
> `ansible.builtin.file`: Es un módulo que usa los elementos (pat, state y mode) para la gestión de archivos o directorios.
```yml
tasks:
# En esta tarea creamos un directorio con los permisos 0755
- name: Crear un directorio
  ansible.builtin.file:
    path: /ruta/directorio
    state: directory # Indica que se cree un directorio
    mode: '0755'
# En esta tarea creamos un fichero vacio con los permisos 0644
- name: Crear un fichero
  ansible.builtin.file:
    path: /ruta/fichero.txt
    state: touch #Indica que se cree un fichero vacio
    mode: '0644'
# En esta tarea eliminamos un fichero
- name: Eliminar un fichero
  ansible.builtin.file:
    path: /ruta/fichero.txt
    state: absent #Indica la eliminación de archivo o directorio
# En esta tarea eliminamos un directorio y todo su contenido
- name: Eliminar un directorio
  ansible.builtin.file:
    path: /ruta/directorio
    state: absent
```
> `ansible.builtin.template`: Es un módulo que usa los elementos (src y dest) para gestionar plantillas jinja2.
```yml
tasks:
# En esta tarea, copiamos la plantilla reemplazamos las variables
- name: Copiar plantilla y reemplazar variables
  ansible.builtin.template:
    src: plantilla.j2
    dest: /ruta/destino/archivo.conf
```
> `ansible.builtin.iptables`: Es un módulo que usa los elementos (chain source y jump) para gestionar las reglas de las iptables.

[CONSEJO] Para obtener más informacion sobre las IPTables, puedes ir a la documentación compartida por Andrés Ruslan Abadías Otal, haciendo clic [aquí](https://github.com/Theritex/LinuxCommands/tree/main/iptables).
```yml
tasks:
# En esta tarea, creamos una regla de firewall, donde aceptamos el tráfico con la ip 192.168.1.0
- name: Añadir una regla de firewall
  ansible.builtin.iptables:
    chain: INPUT
    source: 192.168.1.0/24
    jump: ACCEPT
# En esta tarea, creamos una regla de firewall, donde denegamos el tráfico con la ip 192.168.1.100
- name: Añadir una regla de firewall
  ansible.builtin.iptables:
    chain: INPUT
    source: 192.168.1.100/24
    jump: DROP
# En esta tarea, eliminamos una regla del firewall
- name: Eliminar una regla de firewall
  ansible.builtin.iptables:
    chain: INPUT
    source: 192.168.1.0/24
    jump: ACCEPT
    state: absent # Indicamos con absent que la regla ha de eliminarse
```
> `ansible.netcommon.network_config`: Es un módulo que usa los elementos (lnes y provider) para gestionar la configuración de red.
```yml
tasks:
#En esta tarea cambamos la configuracion de red
- name: Aplicar configuración de red
  ansible.netcommon.network_config:
    lines:
      - interface eth0
      - ip address 192.168.1.10/24
    provider: ansible.netcommon.cli
```
> `community.mysql.mysql_db`: Es un módulo que usa los elementos (name y state) para gestionar bases de datos MySQL.
```yml
tasks:
# En esta tarea creamos una base de datos MySQL
- name: Crear una base de datos MySQL
  community.mysql.mysql_db:
    name: base_datos
    state: present
```
> `community.postgresql.postgresql_db`: Es un módulo que usa los elementos (name y state) para gestionar bases de datos PostgreSQL.
```yml
tasks:
# En esta tarea creamos una base de datos PostgreSQL
- name: Crear una base de datos PostgreSQL
  community.postgresql.postgresql_db:
    name: base_datos
    state: present
```
> `ansible.builtin.mount`: Es un móulo que usa los elementos (path, src, fstype y state) para gestionar puntos de montaje.
```yml
tasks:
# En esta tarea montamos un sistema de archivos dentro de /mnt/disco
- name: Montar un sistema de archivos
  ansible.builtin.mount:
    path: /mnt/disco
    src: /dev/sdb1
    fstype: ext4
    state: mounted
```
> `ansible.builtin.shell`: Es un módulo que permite ejecutar comandos en el sistema usando la shell.

[CONSEJO] Para obtener más información sobre los posibles comandos que pueden usarse en el sistema (Casos Linux), haz clic [aquí](https://github.com/Theritex/LinuxCommands).
```yml
task:
# En esta tarea guardamos informacion dentro de un fichero
- name: Ejecutar un comando
  ansible.builtin.shell: "echo 'Hola Mundo' > /tmp/hola.txt"
```
> `ansible.builtin.command`: Es un módulo que usa los elementos (cmd), permitiendo ejecutar comandos en el sistema sin usar la shell.
```yml
tasks:
# En esta tarea ejectamos el comando "whoami"
- name: Ejecutar un comando básico
  ansible.builtin.command:
    cmd: whoami
```
</details>