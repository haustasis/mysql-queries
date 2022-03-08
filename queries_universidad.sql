USE universidad;
-- queries universitad 1 - 9
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo LIKE 'alumno' ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.telefono IS NULL;
SELECT * FROM persona p WHERE p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif REGEXP 'k$';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = p.id JOIN asignatura a ON a.id = asma.id_asignatura JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE p.tipo LIKE 'alumno' AND nif LIKE '26902806M';
SELECT DISTINCT d.nombre FROM profesor pr JOIN asignatura a ON a.id_profesor = pr.id_profesor JOIN grado g ON g.id = a.id_grado JOIN departamento d ON d.id = pr.id_departamento;
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = p.id JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE ce.anyo_inicio LIKE 2018 AND ce.anyo_fin LIKE 2019;
-- queries universitat 1 - 6
SELECT d.nombre AS 'nom departament', p.apellido1 AS 'cognom1', p.apellido2 AS 'cognom2', p.nombre AS 'nom' FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.apellido1 AS 'cognom1', p.apellido2 AS 'cognom2', p.nombre AS 'nom' FROM persona p RIGHT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE d.nombre IS NULL;
SELECT dp.nombre FROM profesor pr RIGHT JOIN departamento dp ON pr.id_departamento = dp.id WHERE pr.id_departamento IS NULL;
SELECT * FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.nombre IS NULL;
SELECT a.nombre FROM persona p RIGHT JOIN asignatura a ON p.id = a.id_profesor WHERE a.id_profesor IS NULL ORDER BY a.nombre;
SELECT DISTINCT dp.nombre FROM departamento dp JOIN profesor pr ON dp.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;
-- queries universitat 1 - 11
SELECT COUNT(id) AS 'total alumnes' FROM persona p WHERE p.tipo LIKE 'alumno';
SELECT COUNT(id) AS 'alumnes del 1999' FROM persona p WHERE p.tipo LIKE 'alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT dp.nombre AS 'departament', count(dp.nombre) AS 'nº de professors' FROM departamento dp JOIN profesor pr ON dp.id = pr.id_departamento GROUP BY dp.nombre ORDER BY count(dp.nombre) DESC;
SELECT dp.nombre AS 'departament', count(pr.id_profesor) AS 'nº de professors' FROM departamento dp LEFT JOIN profesor pr ON dp.id = pr.id_departamento GROUP BY dp.nombre ORDER BY count(pr.id_profesor) DESC;
SELECT gr.nombre AS 'grau', COUNT(a.id) AS 'nº assignatures' FROM grado gr LEFT JOIN asignatura a ON gr.id = a.id_grado GROUP BY gr.id ORDER BY COUNT(a.id) DESC;
SELECT gr.nombre AS 'grau', COUNT(a.id) AS nº_assignatures FROM grado gr JOIN asignatura a ON gr.id = a.id_grado GROUP BY gr.id HAVING nº_assignatures > 40;
SELECT gr.nombre, a.tipo, COUNT(a.id) FROM grado gr JOIN asignatura a ON gr.id = a.id_grado GROUP BY a.tipo, gr.nombre;
SELECT ce.anyo_inicio AS 'any', COUNT(DISTINCT asma.id_alumno) AS 'nº alumnes' FROM alumno_se_matricula_asignatura asma JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar GROUP BY id_curso_escolar;
SELECT pr.id_profesor AS 'id', p.nombre AS 'nom', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', COUNT(a.id) AS nº_assignatures FROM profesor pr JOIN persona p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY pr.id_profesor ORDER BY nº_assignatures DESC;
SELECT * FROM persona p WHERE p.fecha_nacimiento LIKE (SELECT p.fecha_nacimiento from persona p WHERE p.tipo LIKE 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1);
SELECT p.id, p.nif, p.nombre, p.apellido1, p.apellido2 FROM profesor pr JOIN persona p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.id IS NULL;