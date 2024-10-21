# Sintaxis Ansible

<!--Documentado por Andrés Ruslan Abadías Otal (Nisamov)-->
> Documentado por Andrés Ruslan Abadías Otal | [Nisamov](https://github.com/Nisamov)

El contenido de los ficheros de ansible es el siguiente:

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

En el playbook se comienza con una linea formada por tresguiones consecutivos (`---`) marcando el inicio del documento, del mismo modo, se usan tres puntos consecutivos (`...`) para marcar el final del documento.

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
name: nombre del playbook
hosts: nombre_inventory
```
- `name`: Name nos permite asignar un nombre, puede o no relacionarse con el playbook, pues sirve como dientificador
- `hosts`: Hosts nos permite asignar las siguientes tareas a un grupo de direcciones creadas en el fichero `inventory.ini`.

Para crear un item dentro de una lista, usamos guiones de la siguiente forma
```yml
- ejemplo
- item2
- item3
```
Esto nos permite saber la estructura a seguir a la hora de crear una tarea (`task`).