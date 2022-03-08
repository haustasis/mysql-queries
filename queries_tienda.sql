USE tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio*1.09 AS 'precio en USD' FROM producto;
SELECT nombre, precio AS 'EUROS', precio*1.09 AS 'DOLARS' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre,precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 0, 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre,precio FROM producto order by precio ASC LIMIT 0,1;
SELECT nombre,precio FROM PRODUCTO order by precio DESC LIMIT 0,1;
SELECT * FROM producto WHERE codigo_fabricante = 2;
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.nombre, producto.codigo,fabricante.codigo,fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.nombre OR producto.nombre = fabricante.codigo;
SELECT producto.nombre, producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 0,1;
SELECT producto.nombre, producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 0,1;
SELECT producto.nombre,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT producto.nombre,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT producto.nombre,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre HAVING fabricante.nombre = 'Asus' OR fabricante.nombre =  'Seagate' OR FABRICANTE.NOMBRE = 'Hewlett-Packard';
SELECT producto.nombre,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus','Seagate','Hewlett-Packard');
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo  WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE precio > 180 ORDER BY precio DESC,producto.nombre ASC;
SELECT producto.nombre,fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre, producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NOT NULL OR producto.nombre IS NULL;
SELECT fabricante.nombre, producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;
SELECT producto.nombre,fabricante.nombre FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 0,1;
SELECT producto.nombre,producto.precio,fabricante.nombre FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 0,1;
