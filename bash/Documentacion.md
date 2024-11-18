# Documentación Bash

Bash (Bourne Again Shell) es un intérprete de línea de comandos y un lenguaje de scripting utilizado principalmente en sistemas operativos basados en Unix, como Linux y macOS. Bash fue desarrollado como una mejora sobre el shell Bourne original (sh) y se lanzó en 1989 como parte del Proyecto GNU. Al combinar las mejores características del shell Bourne con elementos de otros intérpretes, como el KornShell (ksh) y el C Shell (csh), Bash se ha convertido en uno de los shells más utilizados en el mundo de la informática.

### Características principales de Bash
1. Interfaz de línea de comandos (CLI)
Bash proporciona una interfaz de texto donde los usuarios pueden escribir comandos directamente para interactuar con el sistema operativo. A diferencia de las interfaces gráficas, la CLI es eficiente para ejecutar tareas repetitivas, administrar servidores y automatizar procesos. Los usuarios escriben comandos en la consola y el shell los interpreta y ejecuta, lo que permite ejecutar programas, manipular archivos y configurar el sistema.

2. Lenguaje de scripting
Además de ser una interfaz interactiva, Bash también es un potente lenguaje de scripting. Los scripts de Bash son archivos de texto plano que contienen una serie de comandos que se ejecutan en secuencia. Estos scripts permiten a los usuarios automatizar tareas repetitivas, como copias de seguridad, análisis de logs o despliegue de aplicaciones. Al escribir scripts, los usuarios pueden utilizar variables, estructuras de control de flujo (como condicionales y bucles) y funciones, lo que les permite crear programas más complejos.

3. Gestión de procesos
Bash permite a los usuarios gestionar procesos de manera eficiente. Los usuarios pueden ejecutar programas en segundo plano (background) o en primer plano (foreground) y controlar la prioridad de los procesos utilizando comandos como bg, fg, kill y nice. También es posible encadenar procesos a través de tuberías (pipes), lo que permite enviar la salida de un comando como entrada a otro. Esto facilita la construcción de flujos de trabajo complejos, como filtrar, ordenar y analizar datos.

4. Redirección de entrada/salida
Una de las funcionalidades más poderosas de Bash es la capacidad de redirigir la entrada y la salida de los comandos. Los usuarios pueden utilizar operadores como >, < y >> para redirigir la salida a archivos o dispositivos, así como combinar comandos con el operador | para crear pipelines. Esto resulta útil en tareas de administración de sistemas, como redirigir la salida de logs o concatenar la salida de varios programas.

5. Compatibilidad con scripts heredados
Bash es compatible con la mayoría de los scripts escritos para el shell Bourne original (sh), lo que facilita la transición y la reutilización de scripts más antiguos. Esta compatibilidad ha permitido que Bash sea ampliamente adoptado en sistemas Unix y Linux, donde se encuentra preinstalado en la mayoría de las distribuciones.

6. Personalización y funciones avanzadas
Bash permite a los usuarios personalizar su entorno mediante la configuración de archivos como .bashrc y .bash_profile, donde se pueden definir alias, variables de entorno, y funciones. También incluye características avanzadas como el historial de comandos, la expansión de alias, y la autocompletación de rutas de archivos o comandos, lo que mejora la eficiencia en la línea de comandos.

7. Compatibilidad multiplataforma
Aunque Bash se asocia principalmente con sistemas Unix, también está disponible para otros sistemas operativos, incluidos Windows a través del Subsistema de Windows para Linux (WSL). Esto permite a los desarrolladores trabajar en entornos homogéneos independientemente del sistema operativo subyacente.

Estructura básica de un script de Bash
Un script de Bash comienza con una línea de declaración de shebang (#!/bin/bash), que indica al sistema que el archivo debe ser interpretado por Bash. Después de la declaración inicial, los scripts pueden incluir comandos simples, variables, comentarios, condicionales (if, case), bucles (for, while), y funciones.

Un script básico podría ser el siguiente:
```sh
#!/bin/bash
# Este es un ejemplo de script de Bash

# Definir una variable
nombre="Mundo"

# Mostrar un mensaje
echo "Hola, $nombre"

# Uso de un condicional
if [[ $nombre == "Mundo" ]]; then
  echo "Estás en el ejemplo correcto"
fi

# Uso de un bucle
for i in {1..5}; do
  echo "Contando: $i"
done

```

### Uso en administración de sistemas
Bash es una herramienta fundamental para los administradores de sistemas debido a su capacidad para automatizar tareas complejas. Por ejemplo, se utiliza ampliamente en la administración de servidores para realizar operaciones masivas, como la actualización de paquetes, la gestión de usuarios, la configuración de redes y la supervisión de procesos del sistema.

Con Bash, los administradores pueden escribir scripts para realizar auditorías de sistemas, implementar soluciones de seguridad, hacer copias de seguridad de datos y optimizar el rendimiento del servidor. Esto reduce la necesidad de intervención manual y minimiza los errores.

Se recomienda revisar [Linux Commands](https://github.com/Theritex/LinuxCommands) para ver la lista de posibilidades.

1. Comandos básicos de archivos y directorios
- `ls`: Lista los archivos en un directorio.
- `cd` [directorio]: Cambia al directorio especificado.
- `pwd`: Muestra el directorio de trabajo actual.
- `mkdir` [nombre]: Crea un nuevo directorio.
- `rmdir` [nombre]: Elimina un directorio vacío.
- `cp` [origen] [destino]: Copia archivos o directorios.
- `mv` [origen] [destino]: Mueve o renombra archivos o directorios.
- `rm` [archivo]: Elimina archivos o directorios.
- `touch` [archivo]: Crea un archivo vacío o actualiza su fecha.
2. Comandos de visualización y manipulación de archivos
- `cat` [archivo]: Muestra el contenido de un archivo.
- `less` [archivo]: Muestra el contenido de un archivo, permitiendo desplazarse.
- `head` [archivo]: Muestra las primeras líneas de un archivo.
- `tail` [archivo]: Muestra las últimas líneas de un archivo.
- `echo` [texto]: Imprime texto en la terminal.
- `grep` [patrón] [archivo]: Busca un patrón dentro de un archivo.
- `sort` [archivo]: Ordena el contenido de un archivo.
- `wc` [archivo]: Cuenta líneas, palabras y caracteres de un archivo.
3. Permisos y gestión de usuarios
- `chmod` [permisos] [archivo]: Cambia los permisos de un archivo.
- `chown` [usuario]:[grupo] [archivo]: Cambia el propietario de un archivo.
- `whoami`: Muestra el usuario actual.
- `id`: Muestra el ID de usuario y grupo del usuario actual.
- `passwd` [usuario]: Cambia la contraseña del usuario.
4. Comandos de manipulación de texto
- `sed` 's/buscar/reemplazar/' [archivo]: Sustituye texto en un archivo.
- `awk` '{print $1}' [archivo]: Extrae y muestra una columna específica de un archivo.
- `cut` -d[delimitador] -f[campo] [archivo]: Corta partes específicas de un archivo de texto.
5. Comandos de redirección y tuberías
- `>:` Redirige la salida a un archivo, sobrescribiéndolo.
- `>>:` Redirige la salida a un archivo, añadiéndola al final.
- `<:` Redirige la entrada desde un archivo.
- `|:` Pasa la salida de un comando como entrada de otro.
6. Gestión de procesos
- `ps`: Muestra los procesos en ejecución.
- `top`: Muestra los procesos en ejecución en tiempo real.
- `kill` [PID]: Finaliza un proceso específico.
- `bg`: Envía un proceso a segundo plano.
- `fg`: Trae un proceso del segundo plano al primero.
7. Condicionales y bucles
- `if` [condición]; then [comandos]; fi: Estructura de condicionales.
- `for` [variable] in [lista]; do [comandos]; done: Bucle que itera sobre una lista.
- `while` [condición]; do [comandos]; done: Bucle que ejecuta mientras la condición sea verdadera.
8. Variables
- `nombre="valor"`: Definir una variable.
- `$nombre`: Acceder al valor de una variable.
- `export` [variable]: Hacer que una variable esté disponible en todos los procesos hijos.
9. Comandos de control del sistema
- shutdown [opciones]: Apaga o reinicia el sistema.
- `reboot`: Reinicia el sistema.
- `df`: Muestra el espacio en disco.
- `du`: Muestra el uso de disco por directorio.
- `free`: Muestra la memoria disponible y usada.
10. Comandos de búsqueda
- `find` [directorio] -name [nombre]: Busca archivos en un directorio.
- `locate` [archivo]: Busca archivos en todo el sistema usando una base de datos.
- `which` [comando]: Muestra la ruta completa de un comando.

### Simplificación de código

Podermos simplificar codigo a la par que evitamos problemas por sintaxis, esto es posible siempre que tengamos en cuenta la estructura y funcionamiento de cada caracter.

**Condicionales IF, ELIF o ELSE**
- Ejemplo Basico
```sh
if  [[ $var == true ]]; then
  echo "La variable es true"
else
  echo "La variable es false"
fi
```
- Ejemplo Simplificado:
```sh
[[ $var == "true" ]]; && echo "La variable es true" ||  echo "La variable es false"
```
De esta forma, no solo simplificamos el código haciendo que de la misma forma sea legible, sino que simplificamos lineas, las cuales harán que con menos lineas, podamos hacer funcionar el mismo codigo.

**Comprobaciones TRUE / FALSE**
- Ejemplo Basico
```sh
if [[ $var == true ]]; then
   echo "var es $var" # true
else
  echo "var es $var" # false
fi
```
- Ejemplo Simplificado
```sh
$var && echo "var es true" ||echo "var es false"
```
De esta forma comprobamos si $var es true o false simplificando el código para ocupar menos sin perder el funcionamiento.