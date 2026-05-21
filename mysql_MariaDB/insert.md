Inserción de contenido
```sql
INSERT INTO prestamo (id_libro, id_usuario, id, fecha_inicio) VALUES (26, 99, 10, '2026-03-05');
INSERT INTO prestamo (id_libro, id_usuario, id, fecha_inicio, fecha_fin) VALUES (26, 99, 10, '2026-03-05', NULL);
--INSERT INTO prestamo VALUES (10, 26, 99, '2026-03-05', NULL);

/*Más de una fila a la vez*/
INSERT INTO prestamo (id_libro, id_usuario, id, fecha_inicio, fecha_fin) VALUES (26, 99, 10, '2026-03-05', NULL), (37, 25, 11, '2026-03-06', '2026-04-06');

/*Añadir a una tabla datos leídos de otra tabla*/
INSERT INTO prestamo_copia (id, id_libro, id_usuario, fecha_inicio) SELECT id, id_libro, id_usuario, fecha_inicio FROM prestamo;
```
Actualizar contenido
```sql
/*Poner fecha_inicio=’2026-06-03’ en fila con id 11*/
UPDATE prestamo SET fecha_inicio='2026-06-03' WHERE id=11;

/*Poner fecha_inicio=’2026-06-03’ y fecha_fin=’2027-05-30’ en fila con id 11*/
UPDATE prestamo SET fecha_inicio='2026-06-03', fecha_fin='2027-05-30' WHERE id=11;

/*Poner fecha_fin=NULL en todas las filas*/
UPDATE prestamo SET fecha_inicio=NULL;

/* Si no se pone cláusula WHERE, lo hace para todas las filas de la tabla*/
UPDATE prestamo SET fecha_inicio=NULL WHERE id=1;
```
Eliminar contenido
```sql
/*Borrar la fila con id 11*/
DELETE FROM prestamo WHERE id=11;

/*Según el predicado de la sentencia WHERE se pueden borrar muchas filas con una misma sentencia DELETE*/
/*Por ejemplo: borrar préstamos anteriores al 1 de enero de 2010*/
DELETE FROM prestamo WHERE fecha_inicio<'2010-01-01'

/* Si no se pone cláusula WHERE, lo hace para todas las filas de la tabla*/
/*Esta sentencia borraría todas las filas de la tabla prestamo*/
DELETE FROM prestamo;
```