Apuntes Bases de Datos - Nisamov

# Preparación del Sistema
## Actualización del sistema operativo

Antes de instalar servicios es necesario actualizar los repositorios:
```sh
sudo apt update
```
# Instalación de MariaDB
## Instalación del servidor y cliente
```sh
sudo apt install mariadb-server mariadb-client -y
```
## Gestión del servicio
Ver estado del servicio:
```sh
sudo systemctl status mariadb.service
```
Iniciar servicio:
```sh
sudo systemctl start mariadb.service
```
Detener servicio:
```sh
sudo systemctl stop mariadb.service
```
## Configuración de seguridad inicial
```sh
sudo mysql_secure_installation
```
Consideraciones:
- Se admite establecer contraseñas de menos de 8 caracteres, aunque se considera inseguro.
- Si la contraseña se deja vacía, el sistema lo acepta.
- La contraseña debe almacenarse en un entorno seguro.
# Acceso y Operaciones Básicas
## Acceder al cliente MariaDB
```sql
mysql -u root -p
```
# Gestión de Bases de Datos
## Crear una base de datos
```sql
CREATE DATABASE nombre_bd;
```
## Seleccionar una base de datos
```sql
USE nombre_bd;
```
## Eliminar una base de datos
```sql
DROP DATABASE nombre_bd;
```
## Listar bases de datos
```sql
SHOW DATABASES;
```
# Gestión de Usuarios y Permisos
## Crear usuario
```sql
CREATE USER 'usuario' IDENTIFIED BY 'clave';
```
## Conceder permisos básicos
```sql
GRANT USAGE ON *.* TO 'usuario'@'localhost' IDENTIFIED BY 'clave';
```
## Conceder todos los privilegios sobre una base de datos
```sql
GRANT ALL PRIVILEGES ON nombre_bd.* TO 'usuario'@'localhost';
```
## Actualizar permisos
```sql
FLUSH PRIVILEGES;
```
## Listar usuarios
```sql
SELECT User, Host FROM mysql.user;
```
Listar un usuario específico:
```sql
SELECT User, Host FROM mysql.user WHERE User = 'usuario';
```
## Ver privilegios de un usuario
```sql
SELECT GRANTEE, TABLE_SCHEMA, TABLE_NAME, PRIVILEGE_TYPE
FROM information_schema.table_privileges
WHERE GRANTEE = "'nombre_usuario'@'%'";
```
## Eliminar un usuario
```sql
DROP USER 'nombre_usuario'@'host';
```
# Gestión de Tablas
## Crear tablas
```sql
CREATE TABLE producto (
    nombre VARCHAR(128) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL,
    id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE pe_incluye_prod (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto)
);
```
## Mostrar tablas
```sql
SHOW TABLES IN nombre_bd;
```
## Información de columnas
```sql
DESCRIBE producto;
```
## Añadir una columna
```sql
ALTER TABLE producto ADD COLUMN cod_barras CHAR(13) NULL;
```
## Eliminar columna
```sql
ALTER TABLE producto DROP COLUMN cantidad;
```
## Renombrar columna
```sql
ALTER TABLE producto RENAME COLUMN stock TO cantidad;
```
## Modificar tipo de dato
```sql
ALTER TABLE producto MODIFY COLUMN cantidad DECIMAL(12,2) NOT NULL;
```
## Modificar tipo y nombre simultáneamente
```sql
ALTER TABLE producto CHANGE COLUMN cantidad stock DOUBLE NOT NULL;
```
## Renombrar tabla
```sql
ALTER TABLE producto RENAME TO productos;
```
## Mover tabla entre bases de datos
```sql
ALTER TABLE enciclopedia.productos
RENAME TO tienda.producto;
```
## Eliminar tabla
```sql
DROP TABLE producto;
```
# Claves y Restricciones
## Clave primaria
Eliminar clave primaria:
```sql
ALTER TABLE producto DROP PRIMARY KEY;
```
Añadir clave primaria:
```sql
ALTER TABLE producto ADD PRIMARY KEY (nombre, precio);
```
Clave primaria múltiple:
```sql
PRIMARY KEY (campo1, campo2);
```
## Clave única (UNIQUE)
```sql
ALTER TABLE producto ADD CONSTRAINT u_nombre UNIQUE (nombre);
```
## Clave foránea
```sql
ALTER TABLE producto
ADD CONSTRAINT fk_pp_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id);
```
## Eliminar una clave foránea
```sql
ALTER TABLE producto DROP FOREIGN KEY nombre_constraint;
```
Para conocer el nombre del constraint:
```sql
SHOW CREATE TABLE producto;
```
# Tipos de Datos en MariaDB
## Tipos numéricos
- Enteros (con opción UNSIGNED)
- BIGINT (64 bits)
- INT / INTEGER (32 bits)
- SMALLINT (16 bits)
- TINYINT (8 bits)
- Decimales
- Punto fijo:
- DECIMAL(m, n)

Ejemplo:
- DECIMAL(12,3) → máximo 12 dígitos, 3 decimales.

Punto flotante:
- FLOAT (32 bits)
- DOUBLE (64 bits)
## Tipos de fecha y hora
- DATE → YYYY-MM-DD
- TIME → HH:MM:SS.fffff
- DATETIME → YYYY-MM-DD HH:MM:SS.fffff
## Tipos de texto
- CHAR(n): longitud fija
- VARCHAR(n): longitud variable (hasta n)
- TEXT: hasta 65 535 caracteres
## Tipos binarios
- BLOB: hasta 65 535 bytes
# Comandos de Consulta sobre Metadatos
## Describir tabla
```sql
DESCRIBE nombre_bd.tabla;
```
## Mostrar definición completa de tabla
```sql
SHOW CREATE TABLE nombre_tabla;
```