--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: cereal
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO cereal;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: cereal
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO cereal;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cereal
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: cereal
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.volunteers OWNER TO cereal;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: cereal
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO cereal;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cereal
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: volunteers_project_id_seq; Type: SEQUENCE; Schema: public; Owner: cereal
--

CREATE SEQUENCE public.volunteers_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_project_id_seq OWNER TO cereal;

--
-- Name: volunteers_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cereal
--

ALTER SEQUENCE public.volunteers_project_id_seq OWNED BY public.volunteers.project_id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Name: volunteers project_id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN project_id SET DEFAULT nextval('public.volunteers_project_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: cereal
--

COPY public.projects (id, title) FROM stdin;
282	VOLUNTEER WITH ELEPHANTS IN THAILAND
283	CONTRIBUTE TO SHARK AND TURTLE CONSERVATION IN THE SEYCHELLES
284	TEACH ENGLISH TO BUDDHIST MONKS IN LAOS
285	PARTICIPATE ON A WILDLIFE RESEARCH EXPEDITION IN SOUTH AFRICA
286	WORK ON A WOMEN’S EMPOWERMENT PROJECT IN INDIA
287	CONTRIBUTE TO JAGUAR CONSERVATION IN COSTA RICA
288	JOIN A MARINE CONSERVATION EXPEDITION IN MEXICO
289	WORK ON A COMMUNITY DEVELOPMENT PROJECT IN NEPAL
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: cereal
--

COPY public.volunteers (id, project_id, name) FROM stdin;
186	282	Lee
187	282	Ngan
189	283	Robert
188	285	Carol
190	283	Roger
191	284	Chris
192	284	Ann
193	287	Christine
194	287	Julie
195	288	June
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.projects_id_seq', 289, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 195, true);


--
-- Name: volunteers_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_project_id_seq', 1, false);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

