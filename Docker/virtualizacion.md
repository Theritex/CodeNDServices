La virtualizacion utiliza software para imitar las caracterisitcas hardware y crear un sistema informatico virtual

La virutalizacion se utiliza para:
- Aislamiento e independencia
- Laboratiorio de pruebas
- Virtualizacion de arquitecturas
- Creación de cluster
- Herramienta de aprendizaje

Tipos:
- Emulacion
    No cuenta con mucho rendimiento
- Virutalizacion por hardware tipo 1
    Software que permite crear maquinas virtuales
    El software controla el hardware de la maquina fisica
    Rendimiento Elevado
    VMWare, HyperV...
- Virtualizacion completa de tipo 2
    Permite crear maquinas virtuales
    El software cuenta con un proceso de emulacion
    Menor rendimiento
    VirtualBox, Pararel...
- Virtualicacion ligera (Virtualizacion de contenedores)
    Crear distintas sesiones de usuarios (entornos de usuarios independientes)
    Usan los recursos de la maquina fisica
    Usa kernel de S.O Linux

Un contenedor es un conjunto de procesos aislados que se ejecutan en un servidor y que acceden a un sistema de ficheros propio.
Tienen una configuracion de red propia y acceden a los recursos del host (memoria y CPU)

Utilizan para su funcionamiento el nucleo del host donde se ejecutan.

Tipos de contenedores (por uso que se les puede dar):
- Contenedores de sistemas
- Contenedores de aplicacion

Contendeodres y aplicaciones:
(Que aplicaciones podemos poner en contenedores):
- Aplicaciones Monoliticas
  - Esquema multicapa
    Cada servicio que nuestra aplicacion necesita, iria en un contenedor
- Microservicios
  - Cada microservicio en un contenedor

Ventajas de los contenedores de aplicacion:
- Portabilidad
- Aislamiento
- Eficiencia en el uso de recursos
- Despliegue rapido