--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.12
-- Dumped by pg_dump version 9.3.12
-- Started on 2016-04-29 17:05:00 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 17090)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 17092)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    issue timestamp without time zone NOT NULL,
    return_date timestamp without time zone,
    return_date_fact timestamp without time zone
);


--
-- TOC entry 199 (class 1259 OID 17095)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17098)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 200
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 201 (class 1259 OID 17100)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 202 (class 1259 OID 17102)
-- Name: book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book (
    id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    catalog_id integer,
    title character varying(200) NOT NULL,
    pages integer NOT NULL,
    year timestamp without time zone NOT NULL,
    publishing_office character varying(200) NOT NULL,
    isbn character varying(50)
);


--
-- TOC entry 203 (class 1259 OID 17106)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17109)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 17112)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300)
);


--
-- TOC entry 206 (class 1259 OID 17118)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 206
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 207 (class 1259 OID 17120)
-- Name: comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE comment (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    like_count integer,
    dislike_count integer
);


--
-- TOC entry 208 (class 1259 OID 17124)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 209 (class 1259 OID 17126)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17129)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 210
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 211 (class 1259 OID 17131)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL,
    state_book integer NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 17134)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 212
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 213 (class 1259 OID 17136)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 17139)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 214
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 215 (class 1259 OID 17141)
-- Name: order; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    type_order integer NOT NULL,
    created timestamp without time zone NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone
);


--
-- TOC entry 216 (class 1259 OID 17144)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 17147)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 217
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 218 (class 1259 OID 17149)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 219 (class 1259 OID 17151)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 219
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 220 (class 1259 OID 17153)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 17156)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 222 (class 1259 OID 17158)
-- Name: user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    user_state integer NOT NULL,
    role integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 17162)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2004 (class 2604 OID 17164)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 17165)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 17166)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 17167)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 17168)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 17169)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 17170)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 17171)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 17172)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 17173)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2180 (class 0 OID 17092)
-- Dependencies: 198
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2181 (class 0 OID 17095)
-- Dependencies: 199
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 200
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 1, false);


--
-- TOC entry 2184 (class 0 OID 17102)
-- Dependencies: 202
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (18, 26, 'Hello World', 321, '2016-04-25 22:19:47.488', 'Oreally', '1461611987488');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (21, 29, 'Hello World', 321, '2016-04-25 22:29:38.866', 'Oreally', '1461612578866');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (22, 30, 'Hello World', 321, '2016-04-25 22:30:35.651', 'Oreally', '1461612635651');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (23, 31, 'Hello World', 321, '2016-04-25 22:31:09.108', 'Oreally', '1461612669108');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (24, 32, 'Hello World', 321, '2016-04-25 22:32:00.625', 'Oreally', '1461612720625');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (25, 33, 'Hello World', 321, '2016-04-25 22:39:00.099', 'Oreally', '1461613140099');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (26, 34, 'Hello World', 321, '2016-04-25 22:42:06.612', 'Oreally', '1461613326612');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (14, NULL, 'Hello World', 321, '2016-04-25 22:02:07.177', 'Oreally', '12312312');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (17, NULL, 'Hello World', 321, '2016-04-25 22:19:47.409', 'Oreally', '1461611987409');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (19, NULL, 'Hello World', 321, '2016-04-25 22:25:33.328', 'Oreally', '1461612333328');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (29, 63, 'Mumu', 234, '2016-04-29 16:33:26.703', 'Manning', '1461936806117');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (30, 68, 'Mumu', 234, '2016-04-29 16:44:09.437', 'Manning', '1461937449157');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (31, 70, 'Mumu', 234, '2016-04-29 16:46:20.071', 'Manning', '1461937579646');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (32, 72, 'Mumu', 234, '2016-04-29 16:48:36.097', 'Manning', '1461937715673');


--
-- TOC entry 2185 (class 0 OID 17106)
-- Dependencies: 203
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2186 (class 0 OID 17109)
-- Dependencies: 204
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 201
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 32, true);


--
-- TOC entry 2187 (class 0 OID 17112)
-- Dependencies: 205
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (4, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (5, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2, 'programming', 'g');
INSERT INTO catalog (id, path, path_parent) VALUES (6, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (7, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (8, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (9, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (10, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (11, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (12, 'new catalog path', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (13, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (14, 'new catalog path', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (15, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (16, 'new catalog path', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (17, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (18, 'new catalog path', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (20, 'programming', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (21, 'new catalog path', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (22, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (23, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (24, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (25, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (26, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (27, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (28, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (29, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (30, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (31, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (32, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (33, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (34, 'book service test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (39, 'belorussian litrature', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (42, 'belorussian litrature 2', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (51, 'belorussian litrature 3', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (54, 'belorussian litrature 4', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (57, 'belorussian litrature 6', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (61, 'belorussian litrature 7', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (63, 'belorussian litrature 8', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (64, 'belorussian litrature 9', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (68, 'belorussian litrature 1461937449157', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (69, 'belorussian litrature 1461937449625', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (70, 'belorussian litrature 1461937579646', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (72, 'belorussian litrature 1461937715673', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (79, 'belorussian litrature 1461938235245', 'belorussian litrature 1461938235236');
INSERT INTO catalog (id, path, path_parent) VALUES (83, 'belorussian litrature 1461938477040', 'belorussian litrature 1461938477019');
INSERT INTO catalog (id, path, path_parent) VALUES (87, 'belorussian litrature 1461938549206', 'belorussian litrature 1461938549199');


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 206
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 88, true);


--
-- TOC entry 2189 (class 0 OID 17120)
-- Dependencies: 207
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 54, true);


--
-- TOC entry 2191 (class 0 OID 17126)
-- Dependencies: 209
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 210
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 748, true);


--
-- TOC entry 2193 (class 0 OID 17131)
-- Dependencies: 211
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 212
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2195 (class 0 OID 17136)
-- Dependencies: 213
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 214
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2197 (class 0 OID 17141)
-- Dependencies: 215
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2198 (class 0 OID 17144)
-- Dependencies: 216
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 217
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 219
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2202 (class 0 OID 17153)
-- Dependencies: 220
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 776, true);


--
-- TOC entry 2204 (class 0 OID 17158)
-- Dependencies: 222
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2018 (class 2606 OID 17175)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2020 (class 2606 OID 17177)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2022 (class 2606 OID 17179)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 17181)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2030 (class 2606 OID 17183)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2024 (class 2606 OID 17185)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2026 (class 2606 OID 17187)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 17189)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2034 (class 2606 OID 17191)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 17193)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 17195)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2040 (class 2606 OID 17197)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 17199)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 17201)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2046 (class 2606 OID 17203)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 17205)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2048 (class 2606 OID 17207)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 17209)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2054 (class 2606 OID 17211)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2056 (class 2606 OID 17213)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2058 (class 2606 OID 17215)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 17216)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2061 (class 2606 OID 17221)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2062 (class 2606 OID 17226)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2060 (class 2606 OID 17231)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2063 (class 2606 OID 17236)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2064 (class 2606 OID 17241)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2065 (class 2606 OID 17246)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2069 (class 2606 OID 17251)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2070 (class 2606 OID 17256)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2066 (class 2606 OID 17261)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2067 (class 2606 OID 17266)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2068 (class 2606 OID 17271)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2071 (class 2606 OID 17276)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2072 (class 2606 OID 17281)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-04-29 17:05:00 MSK

--
-- PostgreSQL database dump complete
--

