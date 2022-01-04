--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_github character varying(30),
    project_title character varying(30),
    grade integer
);

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO -;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying(30),
    description text,
    max_grade integer
);


ALTER TABLE public.projects OWNER TO -;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO -;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    github character varying(30)
);


ALTER TABLE public.students OWNER TO -;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO -;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grades (id, student_github, project_title, grade) FROM stdin;
1	jhacks	News Aggregator	10
4	sdevelops	News Aggregator	50
2	jhacks	Snake Game	2
3	sdevelops	Snake Game	100
5	tcodes	Snake Game	100
6	tcodes	Snake Game	100
7	alearns	Snake Game	0
8	rpractices	Snake Game	100
9	banalyzes	Snake Game	0
10	ctypes	Snake Game	97
11	wcodes	Snake Game	96
12	lgifs	Snake Game	50
13	casks	Snake Game	64
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (id, title, description, max_grade) FROM stdin;
5	Recipe Storage	An app to let users keep track of family recipes	150
1	Snake Game	An interactive puzzle game	50
2	News Aggregator	Custom news filter with auto-tagging system	10
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, first_name, last_name, github) FROM stdin;
1	Jane	Hacker	jhacks
2	Sarah	Developer	sdevelops
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grades_id_seq', 5, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 5, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 2, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
------Part 4-----

--Problem 1
--What is the significance of transactions in SQL? When would you want to use a transaction? What is the syntax for executing a transaction?

--Result
--Transactions is very important and it is a group of commands that change the data stored in database. 
--Atomic - all or nothing: It makes sure that either all the commands succeed or none.
--Guarantee of record: It also guarantees all the updates made by transaction database is logged in the permanent storage before the transaction is reported completely
--Visibility of updates: the updates gets visible only after the transactions is completed.

--The transaction is used to avoid inconsistent queries.

--The process used to execute the transaction 
--1) Begin a transaction.
--2) Process database commands
--3) Checks for errors
    --if errors occurred, rollback the transaction,
    --else, commit the transaction
--The syntax used to execute the transaction
--SELECT * FROM 
--BEGIN;
--SAVEPOINT FirstUpdate;
    --if incorrect update
--Rollback to FirstUpdate;
--Commit


--Problem 2
--What is the difference between implicit and explicit type conversion in SQL? Give an example of how you can execute explicit type conversion using SQL syntax.

--Result
--In implicit conversion the datatype is converted automatically whereas in explicit conversion the conversion function is used to convert to another data type.
--Readability is ambiguous in implicit conversion whereas its clear and easy in explicit conversion
-- Due to the ambiguity in implicit conversion the performance can have negative impact whereas the perormance is better in explicit.
-- Portability is low in implicit conversion and high on explicit conversion.
--Hence, explicit conversion is preferred over implicit conversion.






