# Documentación Ansible

Ansible usa contenedor de imagenes conocidas como Execution Enviroments (EE) que actuan como nodos de control.
EE eliminan complejidad a la hora de escalar proyectos automatizados y hacer las cosas como operaciones de ejecucion mucho mas simples.

Se recomienda leer la [documentación](../mysql/Documentacion.md) de mysql para poder trabajar Ansible con bases de datos en MariaDB.

### Instalación

Establecer un ambiente de trabajo:

Instalacion de `podman`o `docker`.
Instalaicón de  `python`

Si se usa el administrador de paquetes DNF, ejecuta el siguiente codigo:
```
sudo dnf install -y podman pyhton3
```

Instalar el navegador `ansible-navigator`:
```
pip3 install ansible-navigator
```
Esta instalacion te permite ejecutar comandos EE en la linea de comandos, incluye el paquete  `ansible-builder` para construir EEs.

Si deseas crear EEs sin hacer pruebas, instala sollamente `ansible-builder`.
```
pip3 install ansible-builder
```

Asegurate de haber instalado correctamente lo requerido:
```
ansible-navigator --version
ansible-builder --version
```

### Ejecución y Uso:

Una imagen EE contiene los siguientes paquetes como estandares:
- ansible-core
- ansible-runner
- python
- ansible content dependences


Archivo de inventario (.ini): Define los hosts a los que deseas aplicar la configuración. Esto es suficiente si utilizas un archivo de inventario estático.
```ini
[dhcp_servers] # Usamos el nombr entre "[]" para llamarlo desde el fichero .yaml
192.168.1.10 ansible_user=usuario ansible_password=contraseña

[myhosts] # Puedes usar mas de una ip, permitiendo la ejecucion en multiples servidores
192.0.2.50
192.0.2.51
192.0.2.52

[local] # Si prefieres ejecutarlo de manera local
localhost ansible_connection=local

# Es posible acceder con usuarios
[servers]
192.0.2.50 ansible_user=username
192.0.2.50 ansible_user=ubuntu  # Se conectará usando el usuario 'ubuntu'
192.0.2.51 ansible_user=admin   # Se conectará usando el usuario 'admin'

; Otro tipo de comentarios
```

Playbook (.yaml): Aquí es donde defines las tareas para instalar y configurar.
```yaml
- name: conexion
  hosts: local # conexion a localhost
  tasks:
    - name: ping al host
      ansible.builtin.ping:
      
    - name: Mostrar mensaje
      ansible.builtin.debug:
        msg: Conexion establecida
    # Podemos ejecutar comandos
    - name: Listar archivos en /home
      command: ls /home
    # Podemos instalar tambien aplicaciones
    - name: Instalar nginx
      apt: # usamos apt para ello
        name: nginx
        state: present
```

Templates (Opcional): Si vas a generar archivos de configuración (como el dhcpd.conf), podrías utilizar un archivo de plantilla Jinja2 (.j2) dentro de una carpeta templates/:
```j2
subnet {{ subnet }} netmask {{ netmask }} {
  range {{ range_start }} {{ range_end }};
  option routers {{ gateway }};
  option domain-name-servers {{ dns }};
}
```

Variables (Opcional): Si estás utilizando plantillas o diferentes configuraciones, podrías querer usar un archivo de variables, por ejemplo, dentro de un directorio vars/. Este podría definir subredes, rangos de IP, etc.:

```yaml
subnet: 192.168.1.0
netmask: 255.255.255.0
range_start: 192.168.1.100
range_end: 192.168.1.200
gateway: 192.168.1.1
dns: 8.8.8.8
```