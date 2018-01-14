-- SCHEMA: concurso

-- DROP SCHEMA concurso ;

CREATE SCHEMA concurso
    AUTHORIZATION postgres;
--
-- Tabela concurso.auditoria
--
CREATE TABLE concurso.auditoria
(
    cod_candidato serial NOT NULL,
    datahora timestamp without time zone NOT NULL,
    valor_antigo integer NOT NULL,
    valor_novo integer NOT NULL,
    PRIMARY KEY (cod_candidato, datahora)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.auditoria
    OWNER to postgres;

--
-- Dados da tabela concurso.auditoria
--
INSERT INTO concurso.auditoria(
	cod_candidato, datahora, valor_antigo, valor_novo)
	VALUES (2,'2010-10-16 17:52:18',5,4),
 (2,'2010-10-16 17:52:56',4,5);

--
-- Tabela concurso.candidato
--
CREATE TABLE concurso.candidato
(
    cod_candidato serial NOT NULL,
    nome character varying(30) NOT NULL,
    cpf numeric(11) DEFAULT NULL,
    telefone character varying(13) NOT NULL,
    endereco character varying(50) NOT NULL,
    tempo_servico real DEFAULT 0,
    PRIMARY KEY (cod_candidato)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.candidato
    OWNER to postgres;

--
-- Dados da tabela concurso.candidato
--
INSERT INTO concurso.candidato(
	cod_candidato, nome, cpf, telefone, endereco, tempo_servico)
	VALUES (1,'Jose da Silva','98787887887','92321222','Rua José dos Santos, centro, Bambuí',10),
 (2,'Carlos Lacerda','98723487887','91331222','Rua João Ribeiro, centro, Bambuí',5),
 (3,'Juca Chaves','34387834587','91452322','Rua Cel. Bento José, 42, cerrado, Bambuí',0),
 (4,'Francelino Pereira de Souza','3498743455','91223333','Rua das Flores, 44, centro, Iguatama',3),
 (5,'Oscar Junior Moreira','76543356733','91338765','Rua Leão Silva Pinto, 57, Guarujá, Medeiros',3),
 (6,'Vantuir Galdino','44323422211','91223222','Rua Vincent Brown, 44, centro, Formiga',7),
 (7,'Maria Conceição Carvalho','22234322944','91223232','Rua Viramundo, 32, centro, Tapiraí',6),
 (8,'Joana Galvão Santos','33423498788','81232223','Rua dos ventos uivantes, 33, Pompéu, Divinópolis',15),
 (9,'Betânia Alencar Rocha','11143223444','81234455','Rua A, 23, apto 102, centro, Belo Horizonte',10),
 (10,'Juliana Siqueira Campos','76543344454','91234343','Rua Francisco Bento, 44, centro, Tapiraí',16),
 (11,'Wesley Snipes de Souza','22234323334','81223434','Avenida dos Andradas, 44, cerrado, Bambuí',4),
 (12,'Carlos dos Santos Souza','76543444544','82334323','Rua Aparecida Souza, Novo Oriente, Bambuí',6),
 (13,'Marcelo Santos Paiva Neto','44433345455','81234343','Rua Cabral Neto Filho, 44, Pampulha, Formiga',2),
 (14,'Karla Kelly dos Santos','33234432322','91334333','Rua José Siqueira, 44, centro, Bambui',1),
 (15,'Flávio Aparecido Rocha Santos','11187644433','93223343','Rua Santos Silva, 23, Tapiraí',0),
 (16,'Patrick Gorceix','11123232232','81231122','Rua Calvin Klein, 33, Mangueira, Formiga',15),
 (17,'Sandra Félix','22234312323','81232222','Rua Carijós, 33, Gutierrez, Belo Horizonte',2),
 (18,'Cândida Mendes Braga','12344454434','91332211','Rua José Mendes, 44, centro, Medeiros',3),
 (19,'Vagner Moura Silva','33343432343','81232232','Rua Cabral Filho, 74, apto 101, centro, Formiga',10),
 (20,'Fabio Resende Santos','12345634333','91232222','Rua Mourinho Neto, 33, centro, Formiga',6),
 (21,'jose','3499999999','34444444','rua a, 44',2),
 (23,'joao','3499999998','34444444','rua a, 44',2),
 (24,'Pedro','3498999995','91332508','rua a',4);

--
-- Tabela concurso.tipo_inscricao
--
CREATE TABLE concurso.tipo_inscricao
(
    cod_tipo serial NOT NULL,
    descricao character varying(30) NOT NULL,
    preco money,
    PRIMARY KEY (cod_tipo)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.tipo_inscricao
    OWNER to postgres;

--
-- Dados da tabela concurso.tipo_inscricao
--
INSERT INTO concurso.tipo_inscricao(
	cod_tipo, descricao, preco)
	VALUES (1,'Professor 8 horas',25),
 (2,'Professor 16 horas',35),
 (3,'Professor 20 horas',40),
 (4,'Professor Dedicação Exclusiva',65);

--
-- Tabela concurso.nivel_formacao
--
CREATE TABLE concurso.nivel_formacao
(
    cod_nivel serial NOT NULL,
    descricao character varying(30) DEFAULT NULL,
    pontos numeric(11),
    PRIMARY KEY (cod_nivel)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.nivel_formacao
    OWNER to postgres;

--
-- Dados da tabela concurso.nivel_formacao
--
INSERT INTO concurso.nivel_formacao(
	cod_nivel, descricao, pontos)
	VALUES (1,'Graduacao',10),
 (2,'Pós-Graduação',13),
 (3,'Mestrado',25),
 (4,'Doutorado',45);

--
-- Tabela concurso.municipio
--
CREATE TABLE concurso.municipio
(
    cod_municipio serial NOT NULL,
    descricao character varying(20) NOT NULL,
    PRIMARY KEY (cod_municipio)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.municipio
    OWNER to postgres;

--
-- Dados da tabela concurso.municipio
--
INSERT INTO concurso.municipio(
	cod_municipio, descricao)
	VALUES (1,'Bambuí'),
 (2,'Iguatama'),
 (3,'Formiga');

--
-- Tabela concurso.disciplina
--

CREATE TABLE concurso.disciplina
(
    cod_disciplina serial NOT NULL,
    descricao character varying(20) DEFAULT NULL,
    PRIMARY KEY (cod_disciplina)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.disciplina
    OWNER to postgres;
--
-- Dados da tabela concurso.disciplina
--
INSERT INTO concurso.disciplina(
	cod_disciplina, descricao)
	VALUES (1,'Matematica'),
 (2,'Português'),
 (3,'Física'),
 (4,'Química');

--
-- Tabela concurso.formacao
--
CREATE TABLE concurso.formacao
(
    cod_formacao serial NOT NULL,
    descricao character varying(30) DEFAULT NULL,
    cod_nivel integer NOT NULL,
    PRIMARY KEY (cod_formacao),
    CONSTRAINT formacao_ibfk_1 FOREIGN KEY (cod_nivel)
        REFERENCES concurso.nivel_formacao (cod_nivel) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.formacao
    OWNER to postgres;

--
-- Dados da tabela concurso.formacao
--
INSERT INTO concurso.formacao(
	cod_formacao, descricao, cod_nivel)
	VALUES (1,'Matematica',1),
 (2,'Matematica',2),
 (3,'Matematica',3),
 (4,'Matematica',4),
 (5,'Letras',1),
 (6,'Letras',2),
 (7,'Letras',3),
 (8,'Letras',4),
 (9,'Ciência da Computação',1),
 (10,'Ciência da Computação',2),
 (11,'Ciência da Computação',3),
 (12,'Ciência da Computação',4),
 (13,'Física',1),
 (14,'Física',2),
 (15,'Física',3),
 (16,'Física',4),
 (17,'Química',1),
 (18,'Química',2),
 (19,'Química',3),
 (20,'Química',4);

--
-- Tabela concurso.disciplina_formacao
--
CREATE TABLE concurso.disciplina_formacao
(
    cod_disciplina integer NOT NULL,
    cod_formacao integer NOT NULL,
    PRIMARY KEY (cod_disciplina, cod_formacao),
    CONSTRAINT disciplina_formacao_ibfk_1 FOREIGN KEY (cod_disciplina)
        REFERENCES concurso.disciplina (cod_disciplina) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT disciplina_formacao_ibfk_2 FOREIGN KEY (cod_formacao)
        REFERENCES concurso.formacao (cod_formacao) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.disciplina_formacao
    OWNER to postgres;

--
-- Dados da tabela concurso.disciplina_formacao
--
INSERT INTO concurso.disciplina_formacao(
	cod_disciplina, cod_formacao)
	VALUES (1,1),
 (3,1),
 (1,2),
 (3,2),
 (1,3),
 (3,3),
 (1,4),
 (3,4),
 (2,5),
 (2,6),
 (2,7),
 (2,8),
 (1,9),
 (3,9),
 (1,10),
 (3,10),
 (1,11),
 (3,11),
 (1,12),
 (3,12),
 (1,13),
 (3,13),
 (1,14),
 (3,14),
 (1,15),
 (3,15),
 (1,16),
 (3,16),
 (4,17),
 (4,18),
 (4,19),
 (4,20);

--
-- Tabela concurso.inscricao
--
CREATE TABLE concurso.inscricao
(
    cod_inscricao serial NOT NULL,
    data_inscricao timestamp without time zone NOT NULL,
    tipo_inscricao integer NOT NULL,
    cod_candidato integer NOT NULL,
    cod_municipio integer NOT NULL,
    cod_formacao integer NOT NULL,
    cod_disciplina integer NOT NULL,
    PRIMARY KEY (cod_inscricao),
    CONSTRAINT inscricao_ibfk_1 FOREIGN KEY (tipo_inscricao)
        REFERENCES concurso.tipo_inscricao (cod_tipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inscricao_ibfk_2 FOREIGN KEY (cod_candidato)
        REFERENCES concurso.candidato (cod_candidato) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inscricao_ibfk_3 FOREIGN KEY (cod_municipio)
        REFERENCES concurso.municipio (cod_municipio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inscricao_ibfk_4 FOREIGN KEY (cod_formacao)
        REFERENCES concurso.formacao (cod_formacao) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT inscricao_ibfk_5 FOREIGN KEY (cod_disciplina)
        REFERENCES concurso.disciplina (cod_disciplina) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE concurso.inscricao
    OWNER to postgres;

--
-- Dados da tabela concurso.inscricao
--

INSERT INTO concurso.inscricao(
	cod_inscricao, data_inscricao, tipo_inscricao, cod_candidato, cod_municipio, cod_formacao, cod_disciplina)
	VALUES (1,'2008-10-01',1,1,1,3,1),
 (2,'2008-10-01',2,1,1,3,1),
 (3,'2008-10-01',1,2,1,3,1),
 (4,'2008-10-01',3,2,1,13,3),
 (5,'2008-10-01',4,3,1,6,2),
 (6,'2008-10-02',2,4,1,2,3),
 (7,'2008-10-02',1,4,1,17,4),
 (8,'2008-10-02',1,4,1,2,1),
 (9,'2008-10-03',4,5,1,8,2),
 (10,'2008-10-03',2,6,1,11,1),
 (11,'2008-10-03',2,6,2,11,1),
 (12,'2008-10-03',1,7,1,7,2),
 (13,'2008-10-03',1,7,1,13,3),
 (14,'2008-10-03',1,7,2,7,2),
 (15,'2008-10-04',1,8,2,1,1),
 (16,'2008-10-04',1,8,3,1,1),
 (17,'2008-10-04',2,9,3,9,1),
 (18,'2008-10-04',1,9,3,9,1),
 (19,'2008-10-05',2,10,2,9,1),
 (20,'2008-10-05',3,10,2,17,4),
 (21,'2008-10-06',1,11,3,1,1),
 (22,'2008-10-06',3,11,2,5,2),
 (23,'2008-10-06',3,12,2,17,4),
 (24,'2008-10-06',3,12,3,17,4),
 (25,'2008-10-07',4,13,1,20,4),
 (26,'2008-10-07',1,14,3,10,1),
 (27,'2008-10-07',1,14,3,17,4),
 (28,'2008-10-07',2,15,3,6,2),
 (29,'2008-10-08',1,15,3,10,3),
 (30,'2008-10-09',2,16,2,6,2),
 (31,'2008-10-09',2,16,3,6,2),
 (32,'2008-10-10',1,17,1,9,3),
 (33,'2008-10-10',1,17,2,9,3),
 (34,'2008-10-10',1,17,3,9,1),
 (35,'2008-10-10',3,18,2,4,1),
 (36,'2008-10-10',1,18,2,4,1),
 (37,'2008-10-10',1,19,3,17,4),
 (38,'2008-10-10',1,19,2,17,4),
 (39,'2008-10-10',2,20,2,20,4),
 (40,'2008-10-10',3,20,2,13,3),
 (41,'2010-10-01',1,23,1,1,1),
 (42,'2010-08-10',1,24,1,1,1),
 (43,'2010-08-10',1,24,1,1,2);
