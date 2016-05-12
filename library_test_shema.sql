--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-12 17:24:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25979)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 25981)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25984)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25987)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 211 (class 1259 OID 25989)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 25991)
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
-- TOC entry 213 (class 1259 OID 25995)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25998)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26001)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 216 (class 1259 OID 26004)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 217 (class 1259 OID 26006)
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
-- TOC entry 218 (class 1259 OID 26010)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 219 (class 1259 OID 26012)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 26015)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 221 (class 1259 OID 26017)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26020)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 223 (class 1259 OID 26022)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL,
    type integer NOT NULL,
    phone character varying NOT NULL,
    address character varying(250) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 26195)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 26025)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 225 (class 1259 OID 26027)
-- Name: order; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone
);


--
-- TOC entry 226 (class 1259 OID 26030)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 26033)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 228 (class 1259 OID 26035)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 229 (class 1259 OID 26037)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 230 (class 1259 OID 26039)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 26042)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 232 (class 1259 OID 26044)
-- Name: user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    user_state integer NOT NULL,
    role integer NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(250) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 26048)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2129 (class 2604 OID 26050)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 26051)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 26052)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 26053)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 26054)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 26055)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 26056)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 26057)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 26058)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 26059)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2318 (class 0 OID 25981)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2319 (class 0 OID 25984)
-- Dependencies: 209
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO author (id, first_name, second_name) VALUES (163, 'Anton', 'Chehov 1463062853175');
INSERT INTO author (id, first_name, second_name) VALUES (164, 'new first name', 'new second name');
INSERT INTO author (id, first_name, second_name) VALUES (165, 'Anton', 'Chehov 1463062923890');
INSERT INTO author (id, first_name, second_name) VALUES (166, 'Anton', 'Chehov 1463062925133');
INSERT INTO author (id, first_name, second_name) VALUES (168, 'Anton', 'Chehov 1463062925233');
INSERT INTO author (id, first_name, second_name) VALUES (169, 'Anton', 'Chehov 1463062976151');
INSERT INTO author (id, first_name, second_name) VALUES (170, 'Anton', 'Chehov 1463062977464');
INSERT INTO author (id, first_name, second_name) VALUES (172, 'new first name', 'new second name 1463062977595');
INSERT INTO author (id, first_name, second_name) VALUES (173, 'Anton', 'Chehov 1463062989729');
INSERT INTO author (id, first_name, second_name) VALUES (174, 'Anton', 'Chehov 1463062990992');
INSERT INTO author (id, first_name, second_name) VALUES (176, 'new first name', 'new second name 1463062991112');
INSERT INTO author (id, first_name, second_name) VALUES (177, 'Anton', 'Chehov 1463063003013');
INSERT INTO author (id, first_name, second_name) VALUES (178, 'Anton', 'Chehov 1463063004216');
INSERT INTO author (id, first_name, second_name) VALUES (180, 'new first name', 'new second name 1463063004336');
INSERT INTO author (id, first_name, second_name) VALUES (181, 'Anton', 'Chehov 1463063016582');
INSERT INTO author (id, first_name, second_name) VALUES (182, 'Anton', 'Chehov 1463063018106');
INSERT INTO author (id, first_name, second_name) VALUES (184, 'new first name', 'new second name 1463063018226');


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 184, true);


--
-- TOC entry 2322 (class 0 OID 25991)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (991, NULL, 'Mumu', 234, '2016-05-12 17:20:53.749', 'Manning', '0.5784641576650957');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (992, NULL, 'Mumu', 234, '2016-05-12 17:20:53.824', 'Manning', '0.24977257848881573');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (993, NULL, 'Mumu', 234, '2016-05-12 17:20:53.835', 'Manning', '0.9056285989299526');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (994, NULL, 'Mumu', 234, '2016-05-12 17:20:53.857', 'Manning', '0.8169546278544613');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (995, NULL, 'Mumu', 234, '2016-05-12 17:20:53.889', 'Manning', '0.12267252121701377');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (996, NULL, 'Mumu', 234, '2016-05-12 17:22:04.462', 'Manning', '0.8814409926024983');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (997, NULL, 'Mumu', 234, '2016-05-12 17:22:04.542', 'Manning', '0.38426720985026885');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (998, NULL, 'Mumu', 234, '2016-05-12 17:22:04.552', 'Manning', '0.0017150850127668482');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (999, NULL, 'Mumu', 234, '2016-05-12 17:22:04.562', 'Manning', '0.5309034134043302');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1000, NULL, 'Mumu', 234, '2016-05-12 17:22:04.582', 'Manning', '0.962504791308322');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1001, NULL, 'Mumu', 234, '2016-05-12 17:22:56.753', 'Manning', '0.2983996958999925');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1002, NULL, 'Mumu', 234, '2016-05-12 17:22:56.873', 'Manning', '0.26468107763901016');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1003, NULL, 'Mumu', 234, '2016-05-12 17:22:56.883', 'Manning', '0.8853861420608314');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1004, NULL, 'Mumu', 234, '2016-05-12 17:22:56.893', 'Manning', '0.9697890873467517');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1005, NULL, 'Mumu', 234, '2016-05-12 17:22:56.913', 'Manning', '0.5532039549889549');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1006, NULL, 'Mumu', 234, '2016-05-12 17:23:10.241', 'Manning', '0.6759046866078141');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1007, NULL, 'Mumu', 234, '2016-05-12 17:23:10.371', 'Manning', '0.7388975889562238');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1008, NULL, 'Mumu', 234, '2016-05-12 17:23:10.391', 'Manning', '0.27295257282176644');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1009, NULL, 'Mumu', 234, '2016-05-12 17:23:10.441', 'Manning', '0.7442299080917144');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1010, NULL, 'Mumu', 234, '2016-05-12 17:23:10.451', 'Manning', '0.014102516422996314');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1011, NULL, 'Mumu', 234, '2016-05-12 17:23:23.545', 'Manning', '0.5625953117791239');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1012, NULL, 'Mumu', 234, '2016-05-12 17:23:23.625', 'Manning', '0.4258869464437124');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1013, NULL, 'Mumu', 234, '2016-05-12 17:23:23.665', 'Manning', '0.6813913714351103');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1014, NULL, 'Mumu', 234, '2016-05-12 17:23:23.675', 'Manning', '0.43277063190508314');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1015, NULL, 'Mumu', 234, '2016-05-12 17:23:23.685', 'Manning', '0.8989890704770329');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1016, NULL, 'Mumu', 234, '2016-05-12 17:23:37.153', 'Manning', '0.4472936283809341');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1017, NULL, 'Mumu', 234, '2016-05-12 17:23:37.324', 'Manning', '0.42436723449710223');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1018, NULL, 'Mumu', 234, '2016-05-12 17:23:37.334', 'Manning', '0.5372296560949638');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1019, NULL, 'Mumu', 234, '2016-05-12 17:23:37.354', 'Manning', '0.9638080200316911');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1020, NULL, 'Mumu', 234, '2016-05-12 17:23:37.394', 'Manning', '0.0191770485128554');


--
-- TOC entry 2323 (class 0 OID 25995)
-- Dependencies: 213
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_author (book_id, author_id) VALUES (991, 163);
INSERT INTO book_2_author (book_id, author_id) VALUES (992, 163);
INSERT INTO book_2_author (book_id, author_id) VALUES (993, 163);
INSERT INTO book_2_author (book_id, author_id) VALUES (994, 163);
INSERT INTO book_2_author (book_id, author_id) VALUES (995, 163);
INSERT INTO book_2_author (book_id, author_id) VALUES (996, 165);
INSERT INTO book_2_author (book_id, author_id) VALUES (997, 165);
INSERT INTO book_2_author (book_id, author_id) VALUES (998, 165);
INSERT INTO book_2_author (book_id, author_id) VALUES (999, 165);
INSERT INTO book_2_author (book_id, author_id) VALUES (1000, 165);
INSERT INTO book_2_author (book_id, author_id) VALUES (1001, 169);
INSERT INTO book_2_author (book_id, author_id) VALUES (1002, 169);
INSERT INTO book_2_author (book_id, author_id) VALUES (1003, 169);
INSERT INTO book_2_author (book_id, author_id) VALUES (1004, 169);
INSERT INTO book_2_author (book_id, author_id) VALUES (1005, 169);
INSERT INTO book_2_author (book_id, author_id) VALUES (1006, 173);
INSERT INTO book_2_author (book_id, author_id) VALUES (1007, 173);
INSERT INTO book_2_author (book_id, author_id) VALUES (1008, 173);
INSERT INTO book_2_author (book_id, author_id) VALUES (1009, 173);
INSERT INTO book_2_author (book_id, author_id) VALUES (1010, 173);
INSERT INTO book_2_author (book_id, author_id) VALUES (1011, 177);
INSERT INTO book_2_author (book_id, author_id) VALUES (1012, 177);
INSERT INTO book_2_author (book_id, author_id) VALUES (1013, 177);
INSERT INTO book_2_author (book_id, author_id) VALUES (1014, 177);
INSERT INTO book_2_author (book_id, author_id) VALUES (1015, 177);
INSERT INTO book_2_author (book_id, author_id) VALUES (1016, 181);
INSERT INTO book_2_author (book_id, author_id) VALUES (1017, 181);
INSERT INTO book_2_author (book_id, author_id) VALUES (1018, 181);
INSERT INTO book_2_author (book_id, author_id) VALUES (1019, 181);
INSERT INTO book_2_author (book_id, author_id) VALUES (1020, 181);


--
-- TOC entry 2324 (class 0 OID 25998)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1020, true);


--
-- TOC entry 2325 (class 0 OID 26001)
-- Dependencies: 215
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 3863, true);


--
-- TOC entry 2327 (class 0 OID 26006)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 60, true);


--
-- TOC entry 2329 (class 0 OID 26012)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO contact (id, phone, address) VALUES (889, 'new phone phone 1463035412637', 'new test Grodno 1463035412637');


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 889, true);


--
-- TOC entry 2331 (class 0 OID 26017)
-- Dependencies: 221
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2333 (class 0 OID 26022)
-- Dependencies: 223
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2344 (class 0 OID 26195)
-- Dependencies: 234
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2335 (class 0 OID 26027)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2336 (class 0 OID 26030)
-- Dependencies: 226
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 26039)
-- Dependencies: 230
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (891, '1463001899323test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (920, '1463040270484test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (921, '1463040270615test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (922, '1463040270645test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (923, '1463040270736test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (924, '1463040496800test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (925, '1463040569111test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (926, '1463040712400test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (927, '1463040712781test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (929, '1463040713210test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (946, '1463060142258test@gmail.com', 'pass');


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 946, true);


--
-- TOC entry 2342 (class 0 OID 26044)
-- Dependencies: 232
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (946, 'OtherFirstName', 'OtherLastName', '2016-05-12 16:35:42.258625', 2, 2, '(095)-1234-54321', 'Grodno, ul.NewStreet');


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2143 (class 2606 OID 26061)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2145 (class 2606 OID 26063)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2147 (class 2606 OID 26065)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2153 (class 2606 OID 26356)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2155 (class 2606 OID 26067)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2157 (class 2606 OID 26069)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2149 (class 2606 OID 26071)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2151 (class 2606 OID 26073)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 26075)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 26077)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 26079)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2166 (class 2606 OID 26081)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 26083)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 26204)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile);


--
-- TOC entry 2170 (class 2606 OID 26087)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 26089)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2172 (class 2606 OID 26091)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 26093)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2178 (class 2606 OID 26095)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2180 (class 2606 OID 26097)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 26175)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2184 (class 2606 OID 26099)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2158 (class 1259 OID 26213)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2187 (class 2606 OID 26100)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2190 (class 2606 OID 26350)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2189 (class 2606 OID 26345)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2192 (class 2606 OID 26219)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2191 (class 2606 OID 26105)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2188 (class 2606 OID 26110)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2193 (class 2606 OID 26115)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2194 (class 2606 OID 26120)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2195 (class 2606 OID 26125)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2203 (class 2606 OID 26214)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2202 (class 2606 OID 26198)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile) REFERENCES user_profile(id);


--
-- TOC entry 2199 (class 2606 OID 26135)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2200 (class 2606 OID 26140)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2196 (class 2606 OID 26145)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2197 (class 2606 OID 26150)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2198 (class 2606 OID 26155)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2201 (class 2606 OID 26160)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-05-12 17:24:40

--
-- PostgreSQL database dump complete
--

