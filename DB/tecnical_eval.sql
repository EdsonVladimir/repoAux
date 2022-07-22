--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Debian 13.7-1.pgdg110+1)
-- Dumped by pg_dump version 13.7 (Debian 13.7-1.pgdg110+1)

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

--
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO postgres;

--
-- Name: operations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA operations;


ALTER SCHEMA operations OWNER TO postgres;

--
-- Name: utilitarian; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA utilitarian;


ALTER SCHEMA utilitarian OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: rol; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.rol (
    id_rol integer NOT NULL,
    name character varying(200),
    description character varying(1000),
    status integer DEFAULT 1
);


ALTER TABLE core.rol OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.rol_id_rol_seq OWNER TO postgres;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.rol_id_rol_seq OWNED BY core.rol.id_rol;


--
-- Name: user; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."user" (
    id_user integer NOT NULL,
    full_name character varying(2000),
    email character varying(2000),
    pass text,
    id_country integer,
    status integer DEFAULT 1,
    date_reg timestamp without time zone DEFAULT now(),
    date_modified timestamp without time zone DEFAULT now(),
    id_rol integer,
    date_birth date,
    gender character varying(15),
    address text,
    phone_number character varying(50),
    id_language integer,
    id_education integer
);


ALTER TABLE core."user" OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.user_id_user_seq OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.user_id_user_seq OWNED BY core."user".id_user;


--
-- Name: courses; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.courses (
    id_course integer NOT NULL,
    name character varying(5000),
    description text,
    img text,
    id_user_teacher integer,
    duration_time character varying(50),
    price double precision,
    date_init date,
    date_end date,
    call_number character varying(200)
);


ALTER TABLE operations.courses OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE; Schema: operations; Owner: postgres
--

CREATE SEQUENCE operations.courses_id_course_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operations.courses_id_course_seq OWNER TO postgres;

--
-- Name: courses_id_course_seq; Type: SEQUENCE OWNED BY; Schema: operations; Owner: postgres
--

ALTER SEQUENCE operations.courses_id_course_seq OWNED BY operations.courses.id_course;


--
-- Name: enrolled_courses; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.enrolled_courses (
    id_enrolled_courses integer NOT NULL,
    id_course integer,
    status integer DEFAULT 1,
    id_user integer,
    date_reg timestamp without time zone DEFAULT now(),
    id_payment_plan integer
);


ALTER TABLE operations.enrolled_courses OWNER TO postgres;

--
-- Name: enrolled_courses_id_enrolled_courses_seq; Type: SEQUENCE; Schema: operations; Owner: postgres
--

CREATE SEQUENCE operations.enrolled_courses_id_enrolled_courses_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operations.enrolled_courses_id_enrolled_courses_seq OWNER TO postgres;

--
-- Name: enrolled_courses_id_enrolled_courses_seq; Type: SEQUENCE OWNED BY; Schema: operations; Owner: postgres
--

ALTER SEQUENCE operations.enrolled_courses_id_enrolled_courses_seq OWNED BY operations.enrolled_courses.id_enrolled_courses;


--
-- Name: payment_plan; Type: TABLE; Schema: operations; Owner: postgres
--

CREATE TABLE operations.payment_plan (
    id_payment_plan integer NOT NULL,
    number_installments integer,
    interest double precision,
    status integer DEFAULT 1
);


ALTER TABLE operations.payment_plan OWNER TO postgres;

--
-- Name: payment_plan_id_payment_plan_seq; Type: SEQUENCE; Schema: operations; Owner: postgres
--

CREATE SEQUENCE operations.payment_plan_id_payment_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operations.payment_plan_id_payment_plan_seq OWNER TO postgres;

--
-- Name: payment_plan_id_payment_plan_seq; Type: SEQUENCE OWNED BY; Schema: operations; Owner: postgres
--

ALTER SEQUENCE operations.payment_plan_id_payment_plan_seq OWNED BY operations.payment_plan.id_payment_plan;


--
-- Name: country; Type: TABLE; Schema: utilitarian; Owner: postgres
--

CREATE TABLE utilitarian.country (
    id_country integer NOT NULL,
    name character varying(500),
    status integer DEFAULT 1,
    date_reg timestamp without time zone DEFAULT now()
);


ALTER TABLE utilitarian.country OWNER TO postgres;

--
-- Name: country_id_country_seq; Type: SEQUENCE; Schema: utilitarian; Owner: postgres
--

CREATE SEQUENCE utilitarian.country_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilitarian.country_id_country_seq OWNER TO postgres;

--
-- Name: country_id_country_seq; Type: SEQUENCE OWNED BY; Schema: utilitarian; Owner: postgres
--

ALTER SEQUENCE utilitarian.country_id_country_seq OWNED BY utilitarian.country.id_country;


--
-- Name: edutation_level; Type: TABLE; Schema: utilitarian; Owner: postgres
--

CREATE TABLE utilitarian.edutation_level (
    id_education_level integer NOT NULL,
    name character varying(500),
    description character varying(5000),
    status integer DEFAULT 1
);


ALTER TABLE utilitarian.edutation_level OWNER TO postgres;

--
-- Name: edutation_level_id_education_level_seq; Type: SEQUENCE; Schema: utilitarian; Owner: postgres
--

CREATE SEQUENCE utilitarian.edutation_level_id_education_level_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilitarian.edutation_level_id_education_level_seq OWNER TO postgres;

--
-- Name: edutation_level_id_education_level_seq; Type: SEQUENCE OWNED BY; Schema: utilitarian; Owner: postgres
--

ALTER SEQUENCE utilitarian.edutation_level_id_education_level_seq OWNED BY utilitarian.edutation_level.id_education_level;


--
-- Name: language; Type: TABLE; Schema: utilitarian; Owner: postgres
--

CREATE TABLE utilitarian.language (
    id_languaje integer NOT NULL,
    name character varying(500),
    status integer DEFAULT 1,
    date_reg timestamp without time zone DEFAULT now()
);


ALTER TABLE utilitarian.language OWNER TO postgres;

--
-- Name: language_id_languaje_seq; Type: SEQUENCE; Schema: utilitarian; Owner: postgres
--

CREATE SEQUENCE utilitarian.language_id_languaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilitarian.language_id_languaje_seq OWNER TO postgres;

--
-- Name: language_id_languaje_seq; Type: SEQUENCE OWNED BY; Schema: utilitarian; Owner: postgres
--

ALTER SEQUENCE utilitarian.language_id_languaje_seq OWNED BY utilitarian.language.id_languaje;


--
-- Name: rol id_rol; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.rol ALTER COLUMN id_rol SET DEFAULT nextval('core.rol_id_rol_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user" ALTER COLUMN id_user SET DEFAULT nextval('core.user_id_user_seq'::regclass);


--
-- Name: courses id_course; Type: DEFAULT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.courses ALTER COLUMN id_course SET DEFAULT nextval('operations.courses_id_course_seq'::regclass);


--
-- Name: enrolled_courses id_enrolled_courses; Type: DEFAULT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.enrolled_courses ALTER COLUMN id_enrolled_courses SET DEFAULT nextval('operations.enrolled_courses_id_enrolled_courses_seq'::regclass);


--
-- Name: payment_plan id_payment_plan; Type: DEFAULT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.payment_plan ALTER COLUMN id_payment_plan SET DEFAULT nextval('operations.payment_plan_id_payment_plan_seq'::regclass);


--
-- Name: country id_country; Type: DEFAULT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.country ALTER COLUMN id_country SET DEFAULT nextval('utilitarian.country_id_country_seq'::regclass);


--
-- Name: edutation_level id_education_level; Type: DEFAULT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.edutation_level ALTER COLUMN id_education_level SET DEFAULT nextval('utilitarian.edutation_level_id_education_level_seq'::regclass);


--
-- Name: language id_languaje; Type: DEFAULT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.language ALTER COLUMN id_languaje SET DEFAULT nextval('utilitarian.language_id_languaje_seq'::regclass);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.rol (id_rol, name, description, status) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."user" (id_user, full_name, email, pass, id_country, status, date_reg, date_modified, id_rol, date_birth, gender, address, phone_number, id_language, id_education) FROM stdin;
1	Edson	edson.sosa@gmail.com	\N	\N	1	2022-07-21 06:58:23.698062	2022-07-21 06:58:23.698062	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.courses (id_course, name, description, img, id_user_teacher, duration_time, price, date_init, date_end, call_number) FROM stdin;
\.


--
-- Data for Name: enrolled_courses; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.enrolled_courses (id_enrolled_courses, id_course, status, id_user, date_reg, id_payment_plan) FROM stdin;
\.


--
-- Data for Name: payment_plan; Type: TABLE DATA; Schema: operations; Owner: postgres
--

COPY operations.payment_plan (id_payment_plan, number_installments, interest, status) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: utilitarian; Owner: postgres
--

COPY utilitarian.country (id_country, name, status, date_reg) FROM stdin;
\.


--
-- Data for Name: edutation_level; Type: TABLE DATA; Schema: utilitarian; Owner: postgres
--

COPY utilitarian.edutation_level (id_education_level, name, description, status) FROM stdin;
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: utilitarian; Owner: postgres
--

COPY utilitarian.language (id_languaje, name, status, date_reg) FROM stdin;
\.


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.rol_id_rol_seq', 1, false);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.user_id_user_seq', 1, true);


--
-- Name: courses_id_course_seq; Type: SEQUENCE SET; Schema: operations; Owner: postgres
--

SELECT pg_catalog.setval('operations.courses_id_course_seq', 1, false);


--
-- Name: enrolled_courses_id_enrolled_courses_seq; Type: SEQUENCE SET; Schema: operations; Owner: postgres
--

SELECT pg_catalog.setval('operations.enrolled_courses_id_enrolled_courses_seq', 1, false);


--
-- Name: payment_plan_id_payment_plan_seq; Type: SEQUENCE SET; Schema: operations; Owner: postgres
--

SELECT pg_catalog.setval('operations.payment_plan_id_payment_plan_seq', 1, false);


--
-- Name: country_id_country_seq; Type: SEQUENCE SET; Schema: utilitarian; Owner: postgres
--

SELECT pg_catalog.setval('utilitarian.country_id_country_seq', 1, false);


--
-- Name: edutation_level_id_education_level_seq; Type: SEQUENCE SET; Schema: utilitarian; Owner: postgres
--

SELECT pg_catalog.setval('utilitarian.edutation_level_id_education_level_seq', 1, false);


--
-- Name: language_id_languaje_seq; Type: SEQUENCE SET; Schema: utilitarian; Owner: postgres
--

SELECT pg_catalog.setval('utilitarian.language_id_languaje_seq', 1, false);


--
-- Name: rol rol_pk; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.rol
    ADD CONSTRAINT rol_pk PRIMARY KEY (id_rol);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id_user);


--
-- Name: courses courses_pk; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.courses
    ADD CONSTRAINT courses_pk PRIMARY KEY (id_course);


--
-- Name: enrolled_courses enrolled_courses_pk; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.enrolled_courses
    ADD CONSTRAINT enrolled_courses_pk PRIMARY KEY (id_enrolled_courses);


--
-- Name: payment_plan payment_plan_pk; Type: CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.payment_plan
    ADD CONSTRAINT payment_plan_pk PRIMARY KEY (id_payment_plan);


--
-- Name: country country_pk; Type: CONSTRAINT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.country
    ADD CONSTRAINT country_pk PRIMARY KEY (id_country);


--
-- Name: edutation_level edutation_level_pk; Type: CONSTRAINT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.edutation_level
    ADD CONSTRAINT edutation_level_pk PRIMARY KEY (id_education_level);


--
-- Name: language language_pk; Type: CONSTRAINT; Schema: utilitarian; Owner: postgres
--

ALTER TABLE ONLY utilitarian.language
    ADD CONSTRAINT language_pk PRIMARY KEY (id_languaje);


--
-- Name: rol_id_rol_uindex; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX rol_id_rol_uindex ON core.rol USING btree (id_rol);


--
-- Name: user_id_user_uindex; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX user_id_user_uindex ON core."user" USING btree (id_user);


--
-- Name: courses_id_course_uindex; Type: INDEX; Schema: operations; Owner: postgres
--

CREATE UNIQUE INDEX courses_id_course_uindex ON operations.courses USING btree (id_course);


--
-- Name: enrolled_courses_id_enrolled_courses_uindex; Type: INDEX; Schema: operations; Owner: postgres
--

CREATE UNIQUE INDEX enrolled_courses_id_enrolled_courses_uindex ON operations.enrolled_courses USING btree (id_enrolled_courses);


--
-- Name: payment_plan_id_payment_plan_uindex; Type: INDEX; Schema: operations; Owner: postgres
--

CREATE UNIQUE INDEX payment_plan_id_payment_plan_uindex ON operations.payment_plan USING btree (id_payment_plan);


--
-- Name: country_id_country_uindex; Type: INDEX; Schema: utilitarian; Owner: postgres
--

CREATE UNIQUE INDEX country_id_country_uindex ON utilitarian.country USING btree (id_country);


--
-- Name: edutation_level_id_education_level_uindex; Type: INDEX; Schema: utilitarian; Owner: postgres
--

CREATE UNIQUE INDEX edutation_level_id_education_level_uindex ON utilitarian.edutation_level USING btree (id_education_level);


--
-- Name: language_id_languaje_uindex; Type: INDEX; Schema: utilitarian; Owner: postgres
--

CREATE UNIQUE INDEX language_id_languaje_uindex ON utilitarian.language USING btree (id_languaje);


--
-- Name: user id_rol; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT id_rol FOREIGN KEY (id_rol) REFERENCES core.rol(id_rol);


--
-- Name: user user_country_id_country_fk; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT user_country_id_country_fk FOREIGN KEY (id_country) REFERENCES utilitarian.country(id_country);


--
-- Name: user user_edutation_level_id_education_level_fk; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT user_edutation_level_id_education_level_fk FOREIGN KEY (id_education) REFERENCES utilitarian.edutation_level(id_education_level);


--
-- Name: user user_language_id_languaje_fk; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT user_language_id_languaje_fk FOREIGN KEY (id_language) REFERENCES utilitarian.language(id_languaje);


--
-- Name: enrolled_courses enrolled_courses_courses_id_course_fk; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.enrolled_courses
    ADD CONSTRAINT enrolled_courses_courses_id_course_fk FOREIGN KEY (id_course) REFERENCES operations.courses(id_course);


--
-- Name: enrolled_courses enrolled_courses_payment_plan_id_payment_plan_fk; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.enrolled_courses
    ADD CONSTRAINT enrolled_courses_payment_plan_id_payment_plan_fk FOREIGN KEY (id_payment_plan) REFERENCES operations.payment_plan(id_payment_plan);


--
-- Name: enrolled_courses enrolled_courses_user_id_user_fk; Type: FK CONSTRAINT; Schema: operations; Owner: postgres
--

ALTER TABLE ONLY operations.enrolled_courses
    ADD CONSTRAINT enrolled_courses_user_id_user_fk FOREIGN KEY (id_user) REFERENCES core."user"(id_user);


--
-- PostgreSQL database dump complete
--

