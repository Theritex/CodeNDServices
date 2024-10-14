# Documentación Ansible Navigator
[Repositorio Oficial](https://github.com/ansible/ansible-navigator) - Ansible-Navigator | "A text-based user interface (TUI) for Ansible."

### Instalación Ansible Naigator
Para poder proceder con la instalación sin percances, necesitamos un equipo con paquetes actualizados:
```sh
sudo apt update
```

Es necesario contar con python para poder iniciar con la isntalación:
```sh
sudo apt install python
```
Instalamos pip:
```py
sudo apt install python-pip
```
Instalamos las herramientas `setuptools`:
```py
pip3 install --upgrade pip setuptools
```
Usamos pip para instalar ansible navigator:
```py
pip3 install 'ansible-navigator[ansible-core]'
```

### Posible Advertencia
Es posible que te aparezca una advertencia como la siguiente:
```diff
- WARNING: The script ansible-runner is installed in '/home/ubuntu/.local/bin' which is not on PATH.
Consider adding this directory to PATH or, if you prefer to supress this warning, use --no-warn-script-location
```

### Uso de Ansible Navigator

Para ver la ayuda que tiene el programa usaremos el siguiente comando:
```sh
ansible-navigator --help
```