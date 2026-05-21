Crear base datos
```sql
`CREATE DATABASE nombre;
```
Mostrar bases de datos
```sql
SHOW DATABASES;
```
Mostrar propiedades de la tabla
```sql
DESCRIBE table;
```
Mostrar tablas de una base de datos
```sql
SHOW TABLES IN nombre;
```
Usar una tabla
```sql
USE nombre;
```
Mostrar contenido de una tabla
```sql
SHOW * FROM tabla;
```
Mostrar contenido de una tabla ordenado
```sql
SELECT id FROM nombre ORDER BY id ASC;
SELECT id FROM nombre ORDER BY id DESC;
```
Mostrar contenido que cumpla ciertas condiciones
```sql
/*Muestra el contenido de forma descendente e indica cuales cumplen la condicion [0(no) o 1(si)]*/
SELECT id, id id>3 FROM id;
/*Muestra el contenido de forma descendente e indica si un ID no es NULL*/
SELECT id, id, id FROM id WHERE id IS NOT NULL;
/*Muestra el contenido de forma descendente y muestra la coincidencia encontrada*/
SELECT id, id, id FROM id WHERE id="Ejemplo";
/*Muestra el contenido de forma descendente y muestra la coincidencia encontrada, permite usar comodines*/
SELECT id, id, id FROM id WHERE id LIKE 'Ejem%';
/*Muestra el contenido de forma descendente y muestra los que no coincida con los indicado, permite usar comodines
% - Similar a * en Linux, secuencia de carácteres
_ - Un caracter aleatorio (no numero)*/
SELECT id, id, id FROM id WHERE id NOT LIKE 'Ejem%';
/*Muestra la coincidencia encontrada cuando se cumplen lo dos parametros*/
SELECT id, id, id FROM id WHERE id LIKE 'Ejem%' AND id>9;
/*Muestra la coincidencia encontrada cuando se encuentra entre los prametros indicados (888 y 999)*/
SELECT id, id, id FROM id WHERE id BETWEEN 888 AND 999;
```
Mostrar promedio de contenido
```sql
SELECT id, AVG(id) FROM id GROUP BY id ORDER BY AVG(id) DESC;
/*Para cada autor, muestra el precio promedio de sus libros, ordenando el output por precio del más caro al más barato*/
/*select autor, avg(precio) from libro group by autor order by avg(precio) desc;*/
```

```sql
UPDATE juego SET rating=0 WHERE rating IS NULL ON UPDATE NO ACTION;
```