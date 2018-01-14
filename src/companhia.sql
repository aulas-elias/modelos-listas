--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


--
-- Name: SCHEMA companhia; Type: COMMENT; Schema: -; Owner: postgres
--
CREATE SCHEMA companhia;

ALTER SCHEMA companhia OWNER TO postgres;

COMMENT ON SCHEMA companhia IS 'Catálogo de trabalho BD2';


SET search_path = companhia, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: departamento; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE departamento (
    dnome character varying(20) NOT NULL,
    dnumero integer NOT NULL,
    gerssn integer NOT NULL,
    gerdataini timestamp(4) without time zone NOT NULL
);


ALTER TABLE departamento OWNER TO postgres;

--
-- Name: dependente; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE dependente (
    essn integer NOT NULL,
    num_dependente integer NOT NULL,
    nome_dependente character varying(30) NOT NULL,
    sexo character(1) NOT NULL,
    datanasc date NOT NULL,
    parentesco character varying(15) NOT NULL
);


ALTER TABLE dependente OWNER TO postgres;

--
-- Name: dept_localizacoes; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE dept_localizacoes (
    dnumero integer NOT NULL,
    dlocalizacao integer NOT NULL,
    localizacao character varying(20) NOT NULL
);


ALTER TABLE dept_localizacoes OWNER TO postgres;

--
-- Name: funcionario; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE funcionario (
    nome character varying(20) NOT NULL,
    ssn integer NOT NULL,
    datanasc date NOT NULL,
    endereco character varying(50) NOT NULL,
    sexo character(1) NOT NULL,
    salario numeric(9,2) NOT NULL,
    superssn integer,
    dno integer,
    CONSTRAINT verifica_sexo CHECK ((sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- Name: projeto; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE projeto (
    pjnome character varying(20) NOT NULL,
    pnumero integer NOT NULL,
    plocalizacao integer NOT NULL,
    dnum integer NOT NULL
);


ALTER TABLE projeto OWNER TO postgres;

--
-- Name: trabalha_em; Type: TABLE; Schema: companhia; Owner: postgres
--

CREATE TABLE trabalha_em (
    essn integer NOT NULL,
    pno integer NOT NULL,
    horas real NOT NULL
);


ALTER TABLE trabalha_em OWNER TO postgres;

--
-- Data for Name: departamento; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO departamento (dnome, dnumero, gerssn, gerdataini) VALUES ('Sede administrativa', 1, 888665555, '1981-06-19 00:00:00');
INSERT INTO departamento (dnome, dnumero, gerssn, gerdataini) VALUES ('Administração', 4, 987654321, '1995-01-01 00:00:00');
INSERT INTO departamento (dnome, dnumero, gerssn, gerdataini) VALUES ('Pesquisa', 5, 333445555, '1988-05-22 00:00:00');


--
-- Data for Name: dependente; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789, 1, 'Michael', 'M', '1988-01-04', 'filho');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789, 2, 'Alice', 'F', '1988-12-30', 'filha');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789, 3, 'Elizabeth', 'F', '1967-05-05', 'cônjuge');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555, 1, 'Alice', 'F', '1986-04-05', 'filha');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555, 2, 'Theodore', 'M', '1983-10-25', 'filho');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555, 3, 'Joy', 'F', '1958-05-03', 'cônjuge');
INSERT INTO dependente (essn, num_dependente, nome_dependente, sexo, datanasc, parentesco) VALUES (987654321, 1, 'Abner', 'M', '1942-02-28', 'cônjuge');

--
-- Data for Name: dept_localizacoes; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO dept_localizacoes (dnumero, dlocalizacao, localizacao) VALUES (1, 1, 'Houston');
INSERT INTO dept_localizacoes (dnumero, dlocalizacao, localizacao) VALUES (4, 1, 'Stafford');
INSERT INTO dept_localizacoes (dnumero, dlocalizacao, localizacao) VALUES (5, 1, 'Bellaire');
INSERT INTO dept_localizacoes (dnumero, dlocalizacao, localizacao) VALUES (5, 2, 'Sugarland');
INSERT INTO dept_localizacoes (dnumero, dlocalizacao, localizacao) VALUES (5, 3, 'Houston');

--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('John Smith', 123456789, '1965-01-09', 'Rua Fondren 731, Houston, Texas', 'M', 25000.00, 333445555, 5);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Franklin Wong', 333445555, '1955-12-08', 'Rua Voss 638, Houston, Texas', 'M', 40000.00, 888665555, 5);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Joyce English', 453453453, '1972-07-31', 'Rua Rice 5631, Houston, Texas', 'F', 25000.00, 333445555, 5);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Ramesh Narayan', 666884444, '1962-09-15', 'Rua Fire Oak 975, Humble, Texas', 'M', 38000.00, 333445555, 5);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('James Borg', 888665555, '1937-11-10', 'Rua Stone 450, Houston, Texas', 'M', 55000.00, NULL, 1);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Jennifer Wallace', 987654321, '1941-06-20', 'Rua Berry 291, Bellaire, Texas', 'F', 43000.00, 888665555, 4);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Ahmad Jabbar', 987987987, '1969-03-29', 'Rua Dallas 980, Houston, Texas', 'M', 25000.00, 987654321, 4);
INSERT INTO funcionario (nome, ssn, datanasc, endereco, sexo, salario, superssn, dno) VALUES ('Alicia Zelaya', 999887777, '1968-01-19', 'Rua Castle 3321, Spring, Texas', 'F', 25000.00, 987654321, 4);

--
-- Data for Name: projeto; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Produto X', 1, 1, 5);
INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Produto Y', 2, 2, 5);
INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Produto Z', 3, 3, 5);
INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Automatização', 10, 1, 4);
INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Reorganização', 20, 1, 1);
INSERT INTO projeto (pjnome, pnumero, plocalizacao, dnum) VALUES ('Novos Benefícios', 30, 1, 4);


--
-- Data for Name: trabalha_em; Type: TABLE DATA; Schema: companhia; Owner: postgres
--

INSERT INTO trabalha_em (essn, pno, horas) VALUES (123456789, 1, 32.5);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (123456789, 2, 7.5);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 2, 10);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 3, 10);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 10, 10);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (333445555, 20, 10);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (453453453, 1, 20);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (453453453, 2, 20);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (666884444, 3, 40);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (888665555, 20, 0);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (987654321, 20, 15);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (987654321, 30, 20);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (987987987, 10, 35);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (987987987, 30, 5);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (999887777, 10, 10);
INSERT INTO trabalha_em (essn, pno, horas) VALUES (999887777, 30, 30);

--
-- Name: dependente dependente_pkey; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (essn, num_dependente);


--
-- Name: dept_localizacoes dept_localizacoes_pkey; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY dept_localizacoes
    ADD CONSTRAINT dept_localizacoes_pkey PRIMARY KEY (dnumero, dlocalizacao);


--
-- Name: departamento dnumero; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT dnumero PRIMARY KEY (dnumero);


--
-- Name: projeto projeto_ibfk_1; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY projeto
    ADD CONSTRAINT projeto_ibfk_1 PRIMARY KEY (pnumero);


--
-- Name: funcionario ssn; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT ssn PRIMARY KEY (ssn);


--
-- Name: trabalha_em trabalha_em_pkey; Type: CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (essn, pno);


--
-- Name: departamento departamento_ibfk_1; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_ibfk_1 FOREIGN KEY (gerssn) REFERENCES funcionario(ssn);


--
-- Name: dependente dependente_ibfk_1; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY dependente
    ADD CONSTRAINT dependente_ibfk_1 FOREIGN KEY (essn) REFERENCES funcionario(ssn);


--
-- Name: dept_localizacoes dept_localizacoes_ibfk_1; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY dept_localizacoes
    ADD CONSTRAINT dept_localizacoes_ibfk_1 FOREIGN KEY (dnumero) REFERENCES departamento(dnumero);


--
-- Name: funcionario funcionario_ibfk_1; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_ibfk_1 FOREIGN KEY (dno) REFERENCES departamento(dnumero);


--
-- Name: funcionario funcionario_ibfk_2; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_ibfk_2 FOREIGN KEY (superssn) REFERENCES funcionario(ssn);


--
-- Name: trabalha_em trabalha_em_ibfk_1; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY trabalha_em
    ADD CONSTRAINT trabalha_em_ibfk_1 FOREIGN KEY (essn) REFERENCES funcionario(ssn);


--
-- Name: trabalha_em trabalha_em_ibfk_2; Type: FK CONSTRAINT; Schema: companhia; Owner: postgres
--

ALTER TABLE ONLY trabalha_em
    ADD CONSTRAINT trabalha_em_ibfk_2 FOREIGN KEY (pno) REFERENCES projeto(pnumero);


--
-- PostgreSQL database dump complete
--
