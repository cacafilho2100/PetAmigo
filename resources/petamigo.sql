-- /usr/share/tomcat8/webapps/data/petAmigo/

SELECT * FROM Animal;
SELECT * FROM StatusAnimal;
SELECT * FROM MyFile;

INSERT INTO 
	`StatusAnimal` (`id`, `status`, `statusAnimal`) 
VALUES 
	(5, 1, 'ADOCAO'),
	(6, 1, 'DOACAO DE SANGUE'),
	(7, 1, 'PERDIDO'),
	(8, 1, 'PARA CRUZAR');
