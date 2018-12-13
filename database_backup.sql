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
    title character varying,
    id integer NOT NULL
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
    name character varying,
    project_id integer NOT NULL,
    id integer NOT NULL
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
-- Name: volunteers_projects; Type: TABLE; Schema: public; Owner: cereal
--

CREATE TABLE public.volunteers_projects (
    volunteer_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.volunteers_projects OWNER TO cereal;

--
-- Name: volunteers_projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: cereal
--

CREATE SEQUENCE public.volunteers_projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_projects_project_id_seq OWNER TO cereal;

--
-- Name: volunteers_projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cereal
--

ALTER SEQUENCE public.volunteers_projects_project_id_seq OWNED BY public.volunteers_projects.project_id;


--
-- Name: volunteers_projects_volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: cereal
--

CREATE SEQUENCE public.volunteers_projects_volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_projects_volunteer_id_seq OWNER TO cereal;

--
-- Name: volunteers_projects_volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cereal
--

ALTER SEQUENCE public.volunteers_projects_volunteer_id_seq OWNED BY public.volunteers_projects.volunteer_id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers project_id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN project_id SET DEFAULT nextval('public.volunteers_project_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Name: volunteers_projects volunteer_id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers_projects ALTER COLUMN volunteer_id SET DEFAULT nextval('public.volunteers_projects_volunteer_id_seq'::regclass);


--
-- Name: volunteers_projects project_id; Type: DEFAULT; Schema: public; Owner: cereal
--

ALTER TABLE ONLY public.volunteers_projects ALTER COLUMN project_id SET DEFAULT nextval('public.volunteers_projects_project_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: cereal
--

COPY public.projects (title, id) FROM stdin;
Colorless	13
Colorless	14
Colorless	15
Colorless	16
Colorless	17
Colorless	18
Colorless	19
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: cereal
--

COPY public.volunteers (name, project_id, id) FROM stdin;
Lee	0	9
Lee	0	10
Lee	0	11
Lee	0	12
Lee	0	13
Lee	0	14
Lee	0	15
Lee	0	16
Lee	0	17
Lee	0	18
Lee	0	19
Lee	0	20
\.


--
-- Data for Name: volunteers_projects; Type: TABLE DATA; Schema: public; Owner: cereal
--

COPY public.volunteers_projects (volunteer_id, project_id) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.projects_id_seq', 19, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 20, true);


--
-- Name: volunteers_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_project_id_seq', 1, false);


--
-- Name: volunteers_projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_projects_project_id_seq', 1, false);


--
-- Name: volunteers_projects_volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cereal
--

SELECT pg_catalog.setval('public.volunteers_projects_volunteer_id_seq', 1, false);


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

