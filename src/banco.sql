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
-- Name: banco; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA banco;

ALTER SCHEMA banco OWNER TO postgres;

SET search_path = banco, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agencia; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE agencia (
    cod_agencia serial NOT NULL,
    nome_agencia character varying(15) NOT NULL,
    cidade_agencia character varying(30) DEFAULT NULL::character varying,
    fundos numeric(15,2)
);


ALTER TABLE agencia OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE cliente (
    cod_cliente serial NOT NULL,
    nome_cliente character varying(20) NOT NULL,
    rua_cliente character varying(30) DEFAULT NULL::character varying,
    cidade_cliente character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE cliente OWNER TO postgres;

--
-- Name: conta; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE conta (
    numero_conta integer NOT NULL,
    cod_agencia integer NOT NULL,
    saldo numeric(15,2) DEFAULT NULL
);


ALTER TABLE conta OWNER TO postgres;

--
-- Name: depositante; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE depositante (
    cod_cliente integer NOT NULL,
    numero_conta integer NOT NULL,
    cod_agencia integer NOT NULL
);


ALTER TABLE depositante OWNER TO postgres;

--
-- Name: devedor; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE devedor (
    cod_cliente integer NOT NULL,
    numero_emprestimo integer NOT NULL,
    cod_agencia integer NOT NULL
);


ALTER TABLE devedor OWNER TO postgres;

--
-- Name: emprestimo; Type: TABLE; Schema: banco; Owner: postgres
--

CREATE TABLE emprestimo (
    numero_emprestimo integer NOT NULL,
    cod_agencia integer NOT NULL,
    total numeric(15,2) DEFAULT NULL
);


ALTER TABLE emprestimo OWNER TO postgres;


--
-- TOC entry 2234 (class 0 OID 18550)
-- Dependencies: 188
-- Data for Name: agencia; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (1, 'Downtown', 'Brooklyn', '24390454.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (2, 'Redwood', 'Palo Alto', '4948790.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (3, 'Perryridge', 'Horseneck', '4006162.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (4, 'Mianus', 'Horseneck', '1140578.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (5, 'Round Hill', 'Horseneck', '18852528.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (6, 'Pownal', 'Bennington', '777672.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (7, 'North Town', 'Rye', '8719289.00');
INSERT INTO agencia (cod_agencia, nome_agencia, cidade_agencia, fundos) VALUES (8, 'Brighton', 'Brooklyn', '19241355.00');


--
-- TOC entry 2235 (class 0 OID 18554)
-- Dependencies: 189
-- Data for Name: cliente; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (1, 'Jones', 'Rua A', 'New York');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (2, 'Smith', 'North', 'Rye');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (3, 'Hayes', 'Main', 'Harrison');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (4, 'Curry', 'North', 'Rye');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (5, 'Lindsay', 'Park', 'Pittsfield');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (6, 'Turner', 'Putnam', 'Stanford');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (7, 'Williams', 'Nassau', 'Princeton');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (8, 'Adams', 'Spring', 'Pittsfield');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (9, 'Johnson', 'Alma', 'Palo Alto');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (10, 'Glenn', 'Sand Hill', 'Woodside');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (11, 'Brooks', 'Senator', 'Brooklyn');
INSERT INTO cliente (cod_cliente, nome_cliente, rua_cliente, cidade_cliente) VALUES (12, 'Green', 'Walnut', 'Stanford');


--
-- TOC entry 2236 (class 0 OID 18559)
-- Dependencies: 190
-- Data for Name: conta; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (101, 1, '0.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (101, 2, '0.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (102, 3, '400.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (201, 4, '450.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (215, 1, '770.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (217, 7, '900.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (222, 5, '700.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (222, 6, '850.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (305, 8, '1500.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (320, 5, '415.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (330, 4, '1700.00');
INSERT INTO conta (numero_conta, cod_agencia, saldo) VALUES (400, 6, '780.00');


--
-- TOC entry 2237 (class 0 OID 18563)
-- Dependencies: 191
-- Data for Name: depositante; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (1, 101, 1);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (1, 101, 2);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (3, 102, 3);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (4, 201, 4);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (2, 215, 1);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (8, 217, 7);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (5, 222, 5);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (6, 222, 6);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (7, 222, 6);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (9, 305, 8);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (10, 320, 5);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (10, 330, 4);
INSERT INTO depositante (cod_cliente, numero_conta, cod_agencia) VALUES (10, 400, 6);


--
-- TOC entry 2239 (class 0 OID 18569)
-- Dependencies: 193
-- Data for Name: emprestimo; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (11, 4, '900.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (12, 5, '700.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (14, 1, '1500.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (15, 2, '1500.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (17, 1, '1000.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (17, 6, '800.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (17, 7, '400.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (18, 3, '400.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (19, 2, '2000.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (23, 2, '2000.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (23, 3, '700.00');
INSERT INTO emprestimo (numero_emprestimo, cod_agencia, total) VALUES (93, 3, '500.00');


--
-- TOC entry 2238 (class 0 OID 18566)
-- Dependencies: 192
-- Data for Name: devedor; Type: TABLE DATA; Schema: banco; Owner: postgres
--

INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (2, 11, 4);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (3, 12, 5);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (3, 14, 1);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (2, 15, 2);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (1, 17, 1);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (5, 17, 6);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (7, 17, 7);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (6, 18, 3);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (9, 19, 2);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (1, 23, 2);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (7, 23, 3);
INSERT INTO devedor (cod_cliente, numero_emprestimo, cod_agencia) VALUES (4, 93, 3);




ALTER TABLE ONLY agencia
    ADD CONSTRAINT agencia_pkey PRIMARY KEY (cod_agencia);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- Name: conta conta_pkey; Type: CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (numero_conta, cod_agencia);


--
-- Name: depositante depositante_pkey; Type: CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY depositante
    ADD CONSTRAINT depositante_pkey PRIMARY KEY (cod_cliente, numero_conta, cod_agencia);


--
-- Name: devedor devedor_pkey; Type: CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY devedor
    ADD CONSTRAINT devedor_pkey PRIMARY KEY (cod_cliente, numero_emprestimo, cod_agencia);


--
-- Name: emprestimo emprestimo_pkey; Type: CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_pkey PRIMARY KEY (numero_emprestimo, cod_agencia);


--
-- Name: conta conta_ibfk_1; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT conta_ibfk_1 FOREIGN KEY (cod_agencia) REFERENCES agencia(cod_agencia) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: depositante depositante_ibfk_1; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY depositante
    ADD CONSTRAINT depositante_ibfk_1 FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- Name: depositante depositante_ibfk_2; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY depositante
    ADD CONSTRAINT depositante_ibfk_2 FOREIGN KEY (numero_conta, cod_agencia) REFERENCES conta(numero_conta, cod_agencia);


--
-- Name: devedor devedor_ibfk_1; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY devedor
    ADD CONSTRAINT devedor_ibfk_1 FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);


--
-- Name: devedor devedor_ibfk_2; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY devedor
    ADD CONSTRAINT devedor_ibfk_2 FOREIGN KEY (numero_emprestimo, cod_agencia) REFERENCES emprestimo(numero_emprestimo, cod_agencia);


--
-- Name: emprestimo emprestimo_ibfk_1; Type: FK CONSTRAINT; Schema: banco; Owner: postgres
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_ibfk_1 FOREIGN KEY (cod_agencia) REFERENCES agencia(cod_agencia);

--
-- PostgreSQL database dump complete
--
