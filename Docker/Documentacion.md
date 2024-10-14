# Documentación Docker

Docker es una plataforma de código abierto que facilita el desarrollo, implementación y ejecución de aplicaciones mediante el uso de contenedores. Los contenedores son entornos ligeros y portátiles que permiten empaquetar una aplicación junto con todas sus dependencias, como bibliotecas, configuraciones y archivos necesarios para ejecutarse de manera consistente en diferentes entornos.

### Características principales de Docker:
#### Contenedores:

Un contenedor es una unidad de software que contiene todo lo necesario para que una aplicación funcione: código, runtime, bibliotecas, y configuraciones del sistema.
A diferencia de las máquinas virtuales (VMs), los contenedores comparten el mismo kernel del sistema operativo anfitrión, lo que los hace mucho más ligeros y eficientes. Esto reduce el uso de recursos y acelera su ejecución y escalabilidad.
Imágenes de Docker:

Una imagen de Docker es una plantilla inmutable que define cómo se debe construir un contenedor. Contiene el sistema de archivos, el entorno y las dependencias necesarias para ejecutar una aplicación.
Las imágenes pueden ser creadas manualmente o utilizando un archivo de configuración llamado Dockerfile, que detalla los pasos para construir la imagen.
Las imágenes se almacenan en repositorios como Docker Hub, que es una plataforma pública donde los usuarios pueden compartir y descargar imágenes.
Portabilidad:

Docker permite ejecutar una aplicación en cualquier sistema que tenga Docker instalado, sin importar las diferencias en las configuraciones o dependencias del sistema. Esto resuelve el problema de "funciona en mi máquina" que suele surgir cuando las aplicaciones se despliegan en diferentes entornos (desarrollo, pruebas, producción).
Aislamiento:

Cada contenedor se ejecuta en un espacio de usuario aislado, lo que significa que tiene su propio sistema de archivos, red y procesos. Sin embargo, comparte el kernel del sistema operativo con otros contenedores, lo que lo hace más ligero que una máquina virtual, pero igual de eficiente para mantener entornos separados.
Dockerfile:

Un Dockerfile es un archivo de texto que contiene una serie de instrucciones que Docker utiliza para construir una imagen. En él se definen las acciones, como qué base de sistema operativo utilizar, qué dependencias instalar, cómo configurar el entorno, y qué comandos ejecutar cuando se inicie el contenedor.

#### Gestión eficiente de recursos:

Docker utiliza recursos de manera más eficiente que las máquinas virtuales. Como los contenedores comparten el mismo núcleo del sistema operativo, los contenedores ocupan menos espacio y se ejecutan más rápido.
Despliegue de aplicaciones:

Docker facilita la automatización del despliegue de aplicaciones, ya que se pueden construir imágenes consistentes que pueden ser ejecutadas en diferentes entornos (desarrollo, pruebas, producción) sin necesidad de ajustar configuraciones o instalar dependencias específicas en cada entorno.
Orquestación con Docker Compose y Docker Swarm:

Docker Compose permite definir y ejecutar aplicaciones que constan de múltiples contenedores. Se utiliza un archivo docker-compose.yml para definir los servicios, redes y volúmenes necesarios.
Docker Swarm es la herramienta nativa de Docker para orquestar múltiples contenedores en clústeres, permitiendo una escalabilidad fácil y eficiente.
Diferencia entre Docker y las máquinas virtuales:
Máquinas virtuales: Ejecutan un sistema operativo completo, junto con aplicaciones y servicios, dentro de un hipervisor que aísla las máquinas entre sí. Son más pesadas en términos de consumo de recursos.

Docker: Ejecuta contenedores que comparten el mismo kernel del sistema operativo del host, lo que permite crear entornos aislados de manera más ligera y eficiente.

### Instalación
Actualizar paquetes del sistema:
```sh
sudo apt update && sudo apt upgrade -y
```
Instalar dependencias necesarias:
```sh
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
Agregar clave GPG para verificar paquetes:
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Añadir repositorio ofical de docker:
```sh
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Actualizar paquetes para que se reconozca el repositorio de docker:
```sh
sudo apt update
```
Instalar docer:
```sh
sudo apt install docker-ce docker-ce-cli containerd.io
```
Verificación de la instalación:
```sh
sudo systemctl status docker
```
Añadir tu usuario al grupo docker (opcional):
```sh
sudo usermod -aG docker $USER
```
Probar docker:
```sh
docker run hello-world
```