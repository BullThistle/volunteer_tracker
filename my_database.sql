--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: Rafa
--

CREATE TABLE projects (
    title character varying,
    id integer
);


ALTER TABLE projects OWNER TO "Rafa";

--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: Rafa
--

CREATE TABLE volunteers (
    name character varying,
    project_id integer,
    id integer
);


ALTER TABLE volunteers OWNER TO "Rafa";

--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: Rafa
--

COPY projects (title, id) FROM stdin;
WOO	\N
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: Rafa
--

COPY volunteers (name, project_id, id) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

