--CREATE DATABASE CRUZEIRODOSUL

--CREATE TABLE TB_PAIS
--(
--	ID_PAIS INT IDENTITY PRIMARY KEY,
--	NM_PAIS VARCHAR(100),
--	NR_POPULACAO INT
--)

--CREATE TABLE TB_CIRCUITO
--(
--	ID_CIRCUITO INT IDENTITY PRIMARY KEY,
--	NM_CIRCUITO VARCHAR(100),
--	NR_EXTENSAO INT,
--	ID_PAIS INT CONSTRAINT FK_CIRCUITO_PAIS FOREIGN KEY (ID_PAIS) REFERENCES TB_PAIS(ID_PAIS)
--)

--CREATE TABLE TB_PROVA
--(
--	ID_PROVA INT IDENTITY PRIMARY KEY,
--	DT_PROVA DATE,
--	NM_SITUACAO VARCHAR(100),
--	ID_CIRCUITO INT CONSTRAINT FK_PROVA_CIRCUITO FOREIGN KEY (ID_CIRCUITO) REFERENCES TB_CIRCUITO(ID_CIRCUITO)
--)

--CREATE TABLE TB_PILOTO
--(
--	ID_PILOTO INT IDENTITY PRIMARY KEY,
--	NM_PILOTO VARCHAR(100),
--	DT_NASCIMENTO Date,
--	ID_PAIS INT CONSTRAINT FK_PILOTO_PAIS FOREIGN KEY (ID_PAIS) REFERENCES TB_PAIS(ID_PAIS),
--	ID_EQUIPE INT
--)

--CREATE TABLE TB_RESULTADO
--(
--	ID_PROVA INT CONSTRAINT FK_RESULTADO_PROVA FOREIGN KEY (ID_PROVA) REFERENCES TB_PROVA(ID_PROVA),
--	ID_PILOTO INT CONSTRAINT FK_RESULTADO_PILOTO FOREIGN KEY (ID_PILOTO) REFERENCES TB_PILOTO(ID_PILOTO),
--	NR_TEMPO_PROVA FLOAT,
--	NR_COLOC_FINAL INT,
--	NR_POSICAO_GRID INT,
--	NR_MELHOR_VOLTA INT
--)

--CREATE TABLE TB_EQUIPE
--(
--	ID_EQUIPE INT IDENTITY PRIMARY KEY,
--	NM_EQUIPE VARCHAR(100),
--	ID_PAIS INT CONSTRAINT FK_EQUIPE_PAIS FOREIGN KEY (ID_PAIS) REFERENCES TB_PAIS(ID_PAIS)
--)

--DROP TABLE TB_RESULTADO 
--DROP TABLE TB_PILOTO
--DROP TABLE TB_EQUIPE
--DROP TABLE TB_PAIS
--DROP TABLE TB_CIRCUITO
--DROP TABLE TB_PROVA

--INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('BRASIL', 500000000)
--INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('ARGENTINA', 100000000)
--INSERT INTO TB_CIRCUITO (NM_CIRCUITO, NR_EXTENSAO, ID_PAIS) VALUES ('INDIANAPOLIS', 547175314, 1)
--INSERT INTO TB_EQUIPE (NM_EQUIPE, ID_PAIS) VALUES ('MCLAREN', 1)
--INSERT INTO TB_PILOTO (NM_PILOTO, DT_NASCIMENTO, ID_PAIS, ID_EQUIPE) VALUES ('AYRTON SENNA', '1992-08-12', 1, 1)
--INSERT INTO TB_PROVA (DT_PROVA, NM_SITUACAO, ID_CIRCUITO) VALUES ('2022-08-08', 'RISCO DE CHUVA', 3)
--INSERT INTO TB_RESULTADO (ID_PROVA, ID_PILOTO, NR_TEMPO_PROVA, NR_COLOC_FINAL, NR_POSICAO_GRID, NR_MELHOR_VOLTA) VALUES ( 5, 1, 777, 37895, 1, 3)
--INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('EUA', 356200000)
--INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('MARROCOS', 22000000)
--INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('CANADA', 410000000)

INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('HOLANDA', 176876668)
INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('AUSTRIA', 2645135)
INSERT INTO TB_PAIS (NM_PAIS, NR_POPULACAO) VALUES ('ITALIA', 264577135)
INSERT INTO TB_CIRCUITO (NM_CIRCUITO, NR_EXTENSAO, ID_PAIS) VALUES ('MIAMI', 57, 3)
INSERT INTO TB_EQUIPE (NM_EQUIPE, ID_PAIS) VALUES ('FERRARI', 11)
INSERT INTO TB_PILOTO (NM_PILOTO, DT_NASCIMENTO, ID_PAIS, ID_EQUIPE) VALUES ('Max Verstappen', '1997-09-30', 9, 2)
INSERT INTO TB_PROVA (DT_PROVA, NM_SITUACAO, ID_CIRCUITO) VALUES ('2022-05-05', 'REALIZADA', 4)
INSERT INTO TB_RESULTADO (ID_PROVA, ID_PILOTO, NR_TEMPO_PROVA, NR_COLOC_FINAL, NR_POSICAO_GRID, NR_MELHOR_VOLTA) VALUES (6, 2, 8800, 1, 1, 391)


--QUESTAO 1
SELECT P.NM_PILOTO, E.NM_EQUIPE
FROM TB_PILOTO P
INNER JOIN TB_EQUIPE E ON P.ID_EQUIPE = E.ID_EQUIPE

--QUESTAO 2
SELECT COUNT(NM_PILOTO) 'QTD PILOTO', YEAR(DT_NASCIMENTO) 'ANO DO NASC.' FROM TB_PILOTO GROUP BY DT_NASCIMENTO ORDER BY DT_NASCIMENTO ASC

--QUESTAO 3
SELECT P.NM_PILOTO, 
	(SELECT NM_PAIS FROM TB_PAIS WHERE ID_PAIS = P.ID_PAIS) 'PAIS NASC',
	E.NM_EQUIPE,
	(SELECT NM_PAIS FROM TB_PAIS WHERE ID_PAIS = E.ID_PAIS) 'PAIS EQUIPE',
	R.NR_COLOC_FINAL 'COLOCACAO NA PROVA',
	C.NM_CIRCUITO,
	PR.DT_PROVA
FROM TB_PILOTO P
INNER JOIN TB_EQUIPE E ON P.ID_EQUIPE = E.ID_EQUIPE
INNER JOIN TB_RESULTADO R ON R.ID_PILOTO = P.ID_PILOTO
INNER JOIN TB_PROVA PR ON PR.ID_PROVA = R.ID_PROVA
INNER JOIN TB_CIRCUITO C ON C.ID_CIRCUITO = PR.ID_CIRCUITO