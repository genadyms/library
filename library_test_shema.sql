--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-15 14:03:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 10 (class 2615 OID 25912)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 214 (class 1259 OID 25913)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 215 (class 1259 OID 25916)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25919)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 216
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 217 (class 1259 OID 25921)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 218 (class 1259 OID 25923)
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
-- TOC entry 219 (class 1259 OID 25927)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 25930)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 25933)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 222 (class 1259 OID 25936)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 222
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 223 (class 1259 OID 25938)
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
-- TOC entry 224 (class 1259 OID 25942)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 224
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 225 (class 1259 OID 25944)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 25947)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 226
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 227 (class 1259 OID 25949)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type integer NOT NULL,
    phone character varying NOT NULL,
    address character varying(250) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 25955)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 25958)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 229
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 230 (class 1259 OID 25960)
-- Name: order; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone
);


--
-- TOC entry 231 (class 1259 OID 25963)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 25966)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 232
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 233 (class 1259 OID 25968)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 234 (class 1259 OID 25970)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 235 (class 1259 OID 25972)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 25975)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 236
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 237 (class 1259 OID 25977)
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
-- TOC entry 238 (class 1259 OID 25984)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2128 (class 2604 OID 25986)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25987)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25988)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25989)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25990)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 25991)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 25992)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 25993)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 25994)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2313 (class 0 OID 25913)
-- Dependencies: 214
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2314 (class 0 OID 25916)
-- Dependencies: 215
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO author (id, first_name, second_name) VALUES (195, 'Anton', 'Chehov 1463074149553');
INSERT INTO author (id, first_name, second_name) VALUES (196, 'Anton', 'Chehov 1463074149767');
INSERT INTO author (id, first_name, second_name) VALUES (197, 'Anton', 'Chehov 1463074149771');
INSERT INTO author (id, first_name, second_name) VALUES (198, 'Anton', 'Chehov 1463084730571');
INSERT INTO author (id, first_name, second_name) VALUES (199, 'Anton', 'Chehov 1463084732188');
INSERT INTO author (id, first_name, second_name) VALUES (201, 'new first name', 'new second name 1463084732286');
INSERT INTO author (id, first_name, second_name) VALUES (202, 'Anton', 'Chehov 1463084858871');
INSERT INTO author (id, first_name, second_name) VALUES (203, 'Anton', 'Chehov 1463084859493');
INSERT INTO author (id, first_name, second_name) VALUES (205, 'new first name', 'new second name 1463084859531');
INSERT INTO author (id, first_name, second_name) VALUES (206, 'Anton', 'Chehov 1463084916931');
INSERT INTO author (id, first_name, second_name) VALUES (207, 'Anton', 'Chehov 1463084917481');
INSERT INTO author (id, first_name, second_name) VALUES (209, 'new first name', 'new second name 1463084917524');
INSERT INTO author (id, first_name, second_name) VALUES (210, 'Anton', 'Chehov 1463084924707');
INSERT INTO author (id, first_name, second_name) VALUES (211, 'Anton', 'Chehov 1463084925396');
INSERT INTO author (id, first_name, second_name) VALUES (213, 'new first name', 'new second name 1463084925432');
INSERT INTO author (id, first_name, second_name) VALUES (214, 'Anton', 'Chehov 1463086376776');
INSERT INTO author (id, first_name, second_name) VALUES (215, 'Anton', 'Chehov 1463086377347');
INSERT INTO author (id, first_name, second_name) VALUES (217, 'new first name', 'new second name 1463086377382');
INSERT INTO author (id, first_name, second_name) VALUES (218, 'Anton', 'Chehov 1463086499073');
INSERT INTO author (id, first_name, second_name) VALUES (219, 'Anton', 'Chehov 1463086499682');
INSERT INTO author (id, first_name, second_name) VALUES (221, 'new first name', 'new second name 1463086499722');
INSERT INTO author (id, first_name, second_name) VALUES (222, 'Anton', 'Chehov 1463086665423');
INSERT INTO author (id, first_name, second_name) VALUES (223, 'Anton', 'Chehov 1463086666008');
INSERT INTO author (id, first_name, second_name) VALUES (225, 'new first name', 'new second name 1463086666049');
INSERT INTO author (id, first_name, second_name) VALUES (226, 'Anton', 'Chehov 1463087218444');
INSERT INTO author (id, first_name, second_name) VALUES (227, 'Anton', 'Chehov 1463087218986');
INSERT INTO author (id, first_name, second_name) VALUES (229, 'new first name', 'new second name 1463087219024');
INSERT INTO author (id, first_name, second_name) VALUES (230, 'Anton', 'Chehov 1463087294813');
INSERT INTO author (id, first_name, second_name) VALUES (231, 'Anton', 'Chehov 1463087295425');
INSERT INTO author (id, first_name, second_name) VALUES (233, 'new first name', 'new second name 1463087295486');
INSERT INTO author (id, first_name, second_name) VALUES (234, 'Anton', 'Chehov 1463087344119');
INSERT INTO author (id, first_name, second_name) VALUES (235, 'Anton', 'Chehov 1463087344763');
INSERT INTO author (id, first_name, second_name) VALUES (237, 'new first name', 'new second name 1463087344810');
INSERT INTO author (id, first_name, second_name) VALUES (238, 'Anton', 'Chehov 1463088887029');
INSERT INTO author (id, first_name, second_name) VALUES (239, 'Anton', 'Chehov 1463088887498');
INSERT INTO author (id, first_name, second_name) VALUES (241, 'new first name', 'new second name 1463088887543');
INSERT INTO author (id, first_name, second_name) VALUES (242, 'Anton', 'Chehov 1463094837191');
INSERT INTO author (id, first_name, second_name) VALUES (243, 'Anton', 'Chehov 1463094837317');
INSERT INTO author (id, first_name, second_name) VALUES (245, 'new first name', 'new second name 1463094837370');
INSERT INTO author (id, first_name, second_name) VALUES (246, 'Anton', 'Chehov 1463094861907');
INSERT INTO author (id, first_name, second_name) VALUES (247, 'Anton', 'Chehov 1463094862471');
INSERT INTO author (id, first_name, second_name) VALUES (249, 'new first name', 'new second name 1463094862510');
INSERT INTO author (id, first_name, second_name) VALUES (250, 'Anton', 'Chehov 1463119888611');
INSERT INTO author (id, first_name, second_name) VALUES (251, 'Anton', 'Chehov 1463119890469');
INSERT INTO author (id, first_name, second_name) VALUES (253, 'new first name', 'new second name 1463119890580');
INSERT INTO author (id, first_name, second_name) VALUES (254, 'Anton', 'Chehov 1463126073537');
INSERT INTO author (id, first_name, second_name) VALUES (255, 'Anton', 'Chehov 1463126074801');
INSERT INTO author (id, first_name, second_name) VALUES (257, 'new first name', 'new second name 1463126074908');
INSERT INTO author (id, first_name, second_name) VALUES (258, 'Anton', 'Chehov 1463126561750');
INSERT INTO author (id, first_name, second_name) VALUES (259, 'Anton', 'Chehov 1463126562935');
INSERT INTO author (id, first_name, second_name) VALUES (261, 'new first name', 'new second name 1463126563102');
INSERT INTO author (id, first_name, second_name) VALUES (262, 'Anton', 'Chehov 1463126615811');
INSERT INTO author (id, first_name, second_name) VALUES (263, 'Anton', 'Chehov 1463126617700');
INSERT INTO author (id, first_name, second_name) VALUES (265, 'new first name', 'new second name 1463126617920');
INSERT INTO author (id, first_name, second_name) VALUES (266, 'Anton', 'Chehov 1463127551521');
INSERT INTO author (id, first_name, second_name) VALUES (267, 'Anton', 'Chehov 1463127552519');
INSERT INTO author (id, first_name, second_name) VALUES (269, 'new first name', 'new second name 1463127552603');
INSERT INTO author (id, first_name, second_name) VALUES (270, 'Anton', 'Chehov 1463133953227');
INSERT INTO author (id, first_name, second_name) VALUES (271, 'Anton', 'Chehov 1463133954287');
INSERT INTO author (id, first_name, second_name) VALUES (273, 'new first name', 'new second name 1463133954365');
INSERT INTO author (id, first_name, second_name) VALUES (274, 'Anton', 'Chehov 1463149211211');
INSERT INTO author (id, first_name, second_name) VALUES (275, 'Anton', 'Chehov 1463149212299');
INSERT INTO author (id, first_name, second_name) VALUES (277, 'new first name', 'new second name 1463149212365');
INSERT INTO author (id, first_name, second_name) VALUES (278, 'Anton', 'Chehov 1463210046038');
INSERT INTO author (id, first_name, second_name) VALUES (279, 'Anton', 'Chehov 1463210046186');
INSERT INTO author (id, first_name, second_name) VALUES (281, 'new first name', 'new second name 1463210046208');
INSERT INTO author (id, first_name, second_name) VALUES (282, 'Anton', 'Chehov 1463217374788');
INSERT INTO author (id, first_name, second_name) VALUES (283, 'Anton', 'Chehov 1463217377335');
INSERT INTO author (id, first_name, second_name) VALUES (285, 'new first name', 'new second name 1463217377522');
INSERT INTO author (id, first_name, second_name) VALUES (286, 'Anton', 'Chehov 1463224478765');
INSERT INTO author (id, first_name, second_name) VALUES (287, 'Anton', 'Chehov 1463224479393');
INSERT INTO author (id, first_name, second_name) VALUES (289, 'new first name', 'new second name 1463224479471');
INSERT INTO author (id, first_name, second_name) VALUES (290, 'Anton', 'Chehov 1463225535143');
INSERT INTO author (id, first_name, second_name) VALUES (291, 'Anton', 'Chehov 1463225535732');
INSERT INTO author (id, first_name, second_name) VALUES (293, 'new first name', 'new second name 1463225535781');


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 216
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 293, true);


--
-- TOC entry 2317 (class 0 OID 25923)
-- Dependencies: 218
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1563, NULL, 'Mumu', 234, '2016-05-14 14:32:16.929', 'Manning', '0.8952097231740813');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1564, NULL, 'Mumu', 234, '2016-05-14 14:32:17.385', 'Manning', '0.5899012925648944');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1565, NULL, 'Mumu', 234, '2016-05-14 14:32:17.813', 'Manning', '0.06309987771133196');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1566, NULL, 'Mumu', 234, '2016-05-14 14:32:17.863', 'Manning', '0.021834403759028342');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1567, NULL, 'Mumu', 234, '2016-05-14 14:32:17.875', 'Manning', '0.07568333744689026');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1568, NULL, 'Mumu', 234, '2016-05-14 14:32:18', 'Manning', '0.9554190868375773');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1569, NULL, 'Mumu', 234, '2016-05-14 14:32:18.033', 'Manning', '0.1586525167881666');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1570, NULL, 'Mumu', 234, '2016-05-14 14:32:18.08', 'Manning', '0.8218890525540374');


--
-- TOC entry 2318 (class 0 OID 25927)
-- Dependencies: 219
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2319 (class 0 OID 25930)
-- Dependencies: 220
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 217
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1570, true);


--
-- TOC entry 2320 (class 0 OID 25933)
-- Dependencies: 221
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 222
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4370, true);


--
-- TOC entry 2322 (class 0 OID 25938)
-- Dependencies: 223
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 224
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 516, true);


--
-- TOC entry 2324 (class 0 OID 25944)
-- Dependencies: 225
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO copy_book (id, book_id, department_id) VALUES (54, 1400, 67);
INSERT INTO copy_book (id, book_id, department_id) VALUES (55, 1401, 68);
INSERT INTO copy_book (id, book_id, department_id) VALUES (56, 1402, 69);
INSERT INTO copy_book (id, book_id, department_id) VALUES (57, 1403, 70);
INSERT INTO copy_book (id, book_id, department_id) VALUES (58, 1404, 71);
INSERT INTO copy_book (id, book_id, department_id) VALUES (59, 1405, 72);
INSERT INTO copy_book (id, book_id, department_id) VALUES (60, 1406, 73);
INSERT INTO copy_book (id, book_id, department_id) VALUES (61, 1424, 74);
INSERT INTO copy_book (id, book_id, department_id) VALUES (62, 1424, 74);
INSERT INTO copy_book (id, book_id, department_id) VALUES (63, 1424, 74);
INSERT INTO copy_book (id, book_id, department_id) VALUES (64, 1424, 74);
INSERT INTO copy_book (id, book_id, department_id) VALUES (65, 1424, 74);
INSERT INTO copy_book (id, book_id, department_id) VALUES (66, 1425, 75);
INSERT INTO copy_book (id, book_id, department_id) VALUES (68, 1427, 81);
INSERT INTO copy_book (id, book_id, department_id) VALUES (69, 1428, 82);
INSERT INTO copy_book (id, book_id, department_id) VALUES (70, 1429, 83);
INSERT INTO copy_book (id, book_id, department_id) VALUES (71, 1430, 84);
INSERT INTO copy_book (id, book_id, department_id) VALUES (72, 1431, 85);
INSERT INTO copy_book (id, book_id, department_id) VALUES (73, 1432, 86);
INSERT INTO copy_book (id, book_id, department_id) VALUES (74, 1433, 87);
INSERT INTO copy_book (id, book_id, department_id) VALUES (75, 1434, 88);
INSERT INTO copy_book (id, book_id, department_id) VALUES (76, 1435, 89);
INSERT INTO copy_book (id, book_id, department_id) VALUES (77, 1436, 90);
INSERT INTO copy_book (id, book_id, department_id) VALUES (78, 1437, 91);
INSERT INTO copy_book (id, book_id, department_id) VALUES (79, 1438, 92);
INSERT INTO copy_book (id, book_id, department_id) VALUES (80, 1439, 93);
INSERT INTO copy_book (id, book_id, department_id) VALUES (81, 1440, 94);
INSERT INTO copy_book (id, book_id, department_id) VALUES (82, 1441, 95);
INSERT INTO copy_book (id, book_id, department_id) VALUES (83, 1442, 96);
INSERT INTO copy_book (id, book_id, department_id) VALUES (84, 1443, 97);
INSERT INTO copy_book (id, book_id, department_id) VALUES (85, 1443, 97);
INSERT INTO copy_book (id, book_id, department_id) VALUES (86, 1443, 97);
INSERT INTO copy_book (id, book_id, department_id) VALUES (87, 1443, 97);
INSERT INTO copy_book (id, book_id, department_id) VALUES (88, 1443, 97);
INSERT INTO copy_book (id, book_id, department_id) VALUES (89, 1444, 98);
INSERT INTO copy_book (id, book_id, department_id) VALUES (91, 1447, 100);
INSERT INTO copy_book (id, book_id, department_id) VALUES (92, 1448, 101);
INSERT INTO copy_book (id, book_id, department_id) VALUES (93, 1449, 102);
INSERT INTO copy_book (id, book_id, department_id) VALUES (94, 1468, 107);
INSERT INTO copy_book (id, book_id, department_id) VALUES (95, 1469, 108);
INSERT INTO copy_book (id, book_id, department_id) VALUES (96, 1470, 109);
INSERT INTO copy_book (id, book_id, department_id) VALUES (97, 1471, 110);
INSERT INTO copy_book (id, book_id, department_id) VALUES (98, 1472, 111);
INSERT INTO copy_book (id, book_id, department_id) VALUES (99, 1473, 112);
INSERT INTO copy_book (id, book_id, department_id) VALUES (100, 1474, 113);
INSERT INTO copy_book (id, book_id, department_id) VALUES (101, 1475, 114);
INSERT INTO copy_book (id, book_id, department_id) VALUES (102, 1476, 115);
INSERT INTO copy_book (id, book_id, department_id) VALUES (103, 1477, 116);
INSERT INTO copy_book (id, book_id, department_id) VALUES (104, 1478, 117);
INSERT INTO copy_book (id, book_id, department_id) VALUES (105, 1479, 118);
INSERT INTO copy_book (id, book_id, department_id) VALUES (106, 1480, 119);
INSERT INTO copy_book (id, book_id, department_id) VALUES (107, 1481, 120);
INSERT INTO copy_book (id, book_id, department_id) VALUES (108, 1482, 121);
INSERT INTO copy_book (id, book_id, department_id) VALUES (109, 1483, 122);
INSERT INTO copy_book (id, book_id, department_id) VALUES (110, 1501, 123);
INSERT INTO copy_book (id, book_id, department_id) VALUES (111, 1502, 124);
INSERT INTO copy_book (id, book_id, department_id) VALUES (112, 1502, 124);
INSERT INTO copy_book (id, book_id, department_id) VALUES (113, 1502, 124);
INSERT INTO copy_book (id, book_id, department_id) VALUES (114, 1502, 124);
INSERT INTO copy_book (id, book_id, department_id) VALUES (115, 1502, 124);
INSERT INTO copy_book (id, book_id, department_id) VALUES (116, 1503, 125);
INSERT INTO copy_book (id, book_id, department_id) VALUES (118, 1505, 131);
INSERT INTO copy_book (id, book_id, department_id) VALUES (119, 1506, 132);
INSERT INTO copy_book (id, book_id, department_id) VALUES (120, 1507, 133);
INSERT INTO copy_book (id, book_id, department_id) VALUES (121, 1508, 134);
INSERT INTO copy_book (id, book_id, department_id) VALUES (122, 1509, 135);
INSERT INTO copy_book (id, book_id, department_id) VALUES (123, 1510, 136);
INSERT INTO copy_book (id, book_id, department_id) VALUES (124, 1511, 137);
INSERT INTO copy_book (id, book_id, department_id) VALUES (125, 1512, 138);
INSERT INTO copy_book (id, book_id, department_id) VALUES (126, 1513, 139);
INSERT INTO copy_book (id, book_id, department_id) VALUES (127, 1515, 140);
INSERT INTO copy_book (id, book_id, department_id) VALUES (128, 1516, 141);
INSERT INTO copy_book (id, book_id, department_id) VALUES (129, 1518, 142);
INSERT INTO copy_book (id, book_id, department_id) VALUES (130, 1519, 143);
INSERT INTO copy_book (id, book_id, department_id) VALUES (131, 1520, 144);
INSERT INTO copy_book (id, book_id, department_id) VALUES (132, 1521, 145);
INSERT INTO copy_book (id, book_id, department_id) VALUES (133, 1523, 146);
INSERT INTO copy_book (id, book_id, department_id) VALUES (134, 1541, 147);
INSERT INTO copy_book (id, book_id, department_id) VALUES (135, 1542, 148);
INSERT INTO copy_book (id, book_id, department_id) VALUES (136, 1542, 148);
INSERT INTO copy_book (id, book_id, department_id) VALUES (137, 1542, 148);
INSERT INTO copy_book (id, book_id, department_id) VALUES (138, 1542, 148);
INSERT INTO copy_book (id, book_id, department_id) VALUES (139, 1542, 148);
INSERT INTO copy_book (id, book_id, department_id) VALUES (140, 1543, 149);
INSERT INTO copy_book (id, book_id, department_id) VALUES (142, 1545, 155);
INSERT INTO copy_book (id, book_id, department_id) VALUES (143, 1546, 156);
INSERT INTO copy_book (id, book_id, department_id) VALUES (144, 1564, 157);
INSERT INTO copy_book (id, book_id, department_id) VALUES (145, 1565, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (146, 1565, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (147, 1565, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (148, 1565, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (149, 1565, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (150, 1566, 159);
INSERT INTO copy_book (id, book_id, department_id) VALUES (152, 1568, 165);
INSERT INTO copy_book (id, book_id, department_id) VALUES (153, 1569, 166);
INSERT INTO copy_book (id, book_id, department_id) VALUES (154, 1570, 167);


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 226
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 154, true);


--
-- TOC entry 2326 (class 0 OID 25949)
-- Dependencies: 227
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO department (id, name, type, phone, address) VALUES (67, 'department name', 0, 'phone 1463147063117', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (68, 'department name', 0, 'phone 1463147477241', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (69, 'department name', 0, 'phone 1463148672428', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (70, 'department name', 0, 'phone 1463148706965', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (71, 'department name', 0, 'phone 1463148874547', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (72, 'department name', 0, 'phone 1463148909784', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (73, 'department name', 0, 'phone 1463148931202', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (74, 'department name', 0, 'phone 1463149214701', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (75, 'department name', 0, 'phone 1463149214772', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (76, 'department name', 0, 'phone 1463149214797', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (77, 'department name', 0, 'phone 1463149214842', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (78, 'department name', 0, 'phone 1463149214868', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (80, 'new name', 1, '23451463149214986', 'grodno 1463149214986');
INSERT INTO department (id, name, type, phone, address) VALUES (81, 'department name', 0, 'phone 1463149215062', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (82, 'department name', 0, 'phone 1463149301692', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (83, 'department name', 0, 'phone 1463202106099', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (84, 'department name', 0, 'phone 1463202203831', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (85, 'department name', 0, 'phone 1463204299924', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (86, 'department name', 0, 'phone 1463204300300', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (87, 'department name', 0, 'phone 1463204320998', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (88, 'department name', 0, 'phone 1463204321117', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (89, 'department name', 0, 'phone 1463204330593', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (90, 'department name', 0, 'phone 1463204330716', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (91, 'department name', 0, 'phone 1463204457151', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (92, 'department name', 0, 'phone 1463204457240', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (93, 'department name', 0, 'phone 1463204457294', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (94, 'department name', 0, 'phone 1463204492232', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (95, 'department name', 0, 'phone 1463204492341', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (96, 'department name', 0, 'phone 1463204492386', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (97, 'department name', 0, 'phone 1463210044246', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (98, 'department name', 0, 'phone 1463210044728', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (99, 'department name', 0, 'phone 1463210044755', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (100, 'department name', 0, 'phone 1463210045625', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (101, 'department name', 0, 'phone 1463210045675', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (102, 'department name', 0, 'phone 1463210045716', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (103, 'department name', 0, 'phone 1463210046836', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (104, 'department name', 0, 'phone 1463210046844', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (106, 'new name', 1, '23451463210046876', 'grodno 1463210046876');
INSERT INTO department (id, name, type, phone, address) VALUES (107, 'department name', 0, 'phone 1463210667004', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (108, 'department name', 0, 'phone 1463210700961', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (109, 'department name', 0, 'phone 1463210701008', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (110, 'department name', 0, 'phone 1463210701036', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (111, 'department name', 0, 'phone 1463214467482', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (112, 'department name', 0, 'phone 1463214467657', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (113, 'department name', 0, 'phone 1463214467682', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (114, 'department name', 0, 'phone 1463214589905', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (115, 'department name', 0, 'phone 1463214590122', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (116, 'department name', 0, 'phone 1463214590160', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (117, 'department name', 0, 'phone 1463214810418', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (118, 'department name', 0, 'phone 1463214810532', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (119, 'department name', 0, 'phone 1463214810590', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (120, 'department name', 0, 'phone 1463215258360', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (121, 'department name', 0, 'phone 1463215258463', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (122, 'department name', 0, 'phone 1463215258503', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (123, 'department name', 0, 'phone 1463217387562', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (124, 'department name', 0, 'phone 1463217388723', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (125, 'department name', 0, 'phone 1463217388875', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (126, 'department name', 0, 'phone 1463217388915', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (127, 'department name', 0, 'phone 1463217388988', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (128, 'department name', 0, 'phone 1463217389022', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (130, 'new name', 1, '23451463217389862', 'grodno 1463217389862');
INSERT INTO department (id, name, type, phone, address) VALUES (131, 'department name', 0, 'phone 1463217390425', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (132, 'department name', 0, 'phone 1463217390519', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (133, 'department name', 0, 'phone 1463217390692', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (134, 'department name', 0, 'phone 1463217532973', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (135, 'department name', 0, 'phone 1463217605873', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (136, 'department name', 0, 'phone 1463217727188', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (137, 'department name', 0, 'phone 1463217774907', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (138, 'department name', 0, 'phone 1463217897809', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (139, 'department name', 0, 'phone 1463217995290', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (140, 'department name', 0, 'phone 1463218221110', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (141, 'department name', 0, 'phone 1463218280000', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (142, 'department name', 0, 'phone 1463218388742', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (143, 'department name', 0, 'phone 1463218460325', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (144, 'department name', 0, 'phone 1463218460534', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (145, 'department name', 0, 'phone 1463218460719', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (146, 'department name', 0, 'phone 1463218495388', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (147, 'department name', 0, 'phone 1463224481522', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (148, 'department name', 0, 'phone 1463224482023', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (149, 'department name', 0, 'phone 1463224482071', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (150, 'department name', 0, 'phone 1463224482087', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (151, 'department name', 0, 'phone 1463224482102', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (152, 'department name', 0, 'phone 1463224482118', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (154, 'new name', 1, '23451463224482234', 'grodno 1463224482234');
INSERT INTO department (id, name, type, phone, address) VALUES (155, 'department name', 0, 'phone 1463224482330', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (156, 'department name', 0, 'phone 1463224482377', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (157, 'department name', 0, 'phone 1463225537390', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (158, 'department name', 0, 'phone 1463225537813', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (159, 'department name', 0, 'phone 1463225537867', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (160, 'department name', 0, 'phone 1463225537875', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (161, 'department name', 0, 'phone 1463225537891', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (162, 'department name', 0, 'phone 1463225537906', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (164, 'new name', 1, '23451463225537969', 'grodno 1463225537969');
INSERT INTO department (id, name, type, phone, address) VALUES (165, 'department name', 0, 'phone 1463225538000', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (166, 'department name', 0, 'phone 1463225538033', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (167, 'department name', 0, 'phone 1463225538080', 'Grodno, ul. departmentStreet');


--
-- TOC entry 2327 (class 0 OID 25955)
-- Dependencies: 228
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 229
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 167, true);


--
-- TOC entry 2329 (class 0 OID 25960)
-- Dependencies: 230
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (25, 1138, 101, '2016-05-14 11:29:49.920985', 1139, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (26, 1140, 102, '2016-05-14 11:29:50.135426', 1141, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (28, 1143, 104, '2016-05-14 11:33:30.433675', 1144, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (29, 1145, 105, '2016-05-14 11:33:30.556971', 1146, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (31, 1148, 107, '2016-05-14 11:40:58.375225', 1149, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (32, 1150, 108, '2016-05-14 11:40:58.478536', 1151, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (34, 1154, 110, '2016-05-14 12:16:27.585416', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (35, 1159, 118, '2016-05-14 12:16:30.443731', 1160, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (36, 1161, 119, '2016-05-14 12:16:30.577204', 1162, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (38, 1164, 121, '2016-05-14 12:18:52.987333', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (39, 1165, 122, '2016-05-14 12:20:05.885964', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (40, 1166, 123, '2016-05-14 12:22:07.209809', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (41, 1167, 124, '2016-05-14 12:22:54.92418', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (42, 1168, 125, '2016-05-14 12:24:57.824877', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (43, 1169, 126, '2016-05-14 12:26:35.314163', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (44, 1171, 127, '2016-05-14 12:30:21.123608', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (45, 1175, 128, '2016-05-14 12:31:20.012586', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (46, 1177, 129, '2016-05-14 12:33:08.770611', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (47, 1181, 130, '2016-05-14 12:34:20.393749', 1182, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (48, 1183, 131, '2016-05-14 12:34:20.63522', 1184, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (50, 1187, 133, '2016-05-14 12:34:55.399682', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (51, 1192, 134, '2016-05-14 14:14:41.645886', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (52, 1199, 142, '2016-05-14 14:14:42.364134', 1200, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (54, 1203, 144, '2016-05-14 14:32:17.421443', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (55, 1208, 152, '2016-05-14 14:32:18.019488', 1209, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (56, 1210, 153, '2016-05-14 14:32:18.061493', 1211, NULL, NULL);


--
-- TOC entry 2330 (class 0 OID 25963)
-- Dependencies: 231
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 232
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 57, true);


--
-- TOC entry 2334 (class 0 OID 25972)
-- Dependencies: 235
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (1090, '1463202105771test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1091, '1463202106055test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1092, '1463202203502test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1093, '1463202203809test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1094, '1463204299348test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1095, '1463204299881test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1096, '1463204300293test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1097, '1463204320680test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1098, '1463204320975test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1099, '1463204321107test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1100, '1463204330269test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1101, '1463204330571test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1102, '1463204330700test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1103, '1463204456854test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1104, '1463204457132test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1105, '1463204457229test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1106, '1463204457247test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1107, '1463204457284test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1108, '1463204491932test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1109, '1463204492210test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1110, '1463204492331test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1111, '1463204492348test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1112, '1463204492375test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1113, '1463210044888test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1114, '1463210045549test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1115, '1463210045575test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1116, '1463210045614test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1117, '1463210045619test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1118, '1463210045665test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1119, '1463210045682test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1120, '1463210045706test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1121, '1463210046847test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1138, '1463214589620test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1139, '1463214589883test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1140, '1463214590114test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1141, '1463214590127test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1142, '1463214590152test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1143, '1463214810094test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1144, '1463214810394test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1145, '1463214810506test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1146, '1463214810540test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1147, '1463214810578test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1148, '1463215258050test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1149, '1463215258340test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1150, '1463215258453test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1151, '1463215258470test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1152, '1463215258494test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1153, '1463217384240test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1154, '1463217387530test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1155, '1463217388422test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1156, '1463217388477test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1157, '1463217388600test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1159, '1463217390362test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1160, '1463217390368test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1161, '1463217390460test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1162, '1463217390552test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1163, '1463217390607test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1164, '1463217532679test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1165, '1463217605616test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1166, '1463217726881test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1167, '1463217774623test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1168, '1463217897561test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1169, '1463217994958test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1170, '1463218220389test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1171, '1463218221099test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1172, '1463218221357test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1173, '1463218221375test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1174, '1463218221413test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1175, '1463218279782test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1176, '1463218387954test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1177, '1463218388731test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1178, '1463218388949test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1179, '1463218388975test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1180, '1463218389017test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1181, '1463218460033test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1182, '1463218460237test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1183, '1463218460471test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1184, '1463218460607test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1185, '1463218460669test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1186, '1463218494407test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1187, '1463218495379test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1188, '1463218495559test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1189, '1463218495591test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1190, '1463218495616test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1192, '1463224481506test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1193, '1463224481921test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1194, '1463224481961test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1195, '1463224481976test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1197, '1463224482250test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1199, '1463224482315test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1200, '1463224482346test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1201, '1463224482377test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1202, '1463225536918test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1203, '1463225537379test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1204, '1463225537684test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1205, '1463225537715test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1206, '1463225537750test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1208, '1463225537984test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1209, '1463225538000test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1210, '1463225538017test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1211, '1463225538049test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1212, '1463225538064test@gmail.com', 'pass');


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 236
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1212, true);


--
-- TOC entry 2336 (class 0 OID 25977)
-- Dependencies: 237
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1194, 'Ivan', 'Ivanov', '2016-05-14 14:14:41.96427', 2, 0, '1463224481961', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1138, 'Ivan', 'Ivanov', '2016-05-14 11:29:49.80616', 2, 2, '1463214589620', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1139, 'Ivan', 'Ivanov', '2016-05-14 11:29:49.88526', 2, 1, '1463214589883', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1140, 'Ivan', 'Ivanov', '2016-05-14 11:29:50.115992', 2, 2, '1463214590114', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1141, 'Ivan', 'Ivanov', '2016-05-14 11:29:50.128961', 2, 1, '1463214590127', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1142, 'Ivan', 'Ivanov', '2016-05-14 11:29:50.153947', 2, 2, '1463214590152', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1143, 'Ivan', 'Ivanov', '2016-05-14 11:33:30.287582', 2, 2, '1463214810094', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1144, 'Ivan', 'Ivanov', '2016-05-14 11:33:30.39665', 2, 1, '1463214810394', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1145, 'Ivan', 'Ivanov', '2016-05-14 11:33:30.509664', 2, 2, '1463214810506', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1146, 'Ivan', 'Ivanov', '2016-05-14 11:33:30.542999', 2, 1, '1463214810540', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1147, 'Ivan', 'Ivanov', '2016-05-14 11:33:30.580654', 2, 2, '1463214810578', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1148, 'Ivan', 'Ivanov', '2016-05-14 11:40:58.259602', 2, 2, '1463215258049', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1149, 'Ivan', 'Ivanov', '2016-05-14 11:40:58.342573', 2, 1, '1463215258340', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1150, 'Ivan', 'Ivanov', '2016-05-14 11:40:58.45525', 2, 2, '1463215258453', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1151, 'Ivan', 'Ivanov', '2016-05-14 11:40:58.472755', 2, 1, '1463215258470', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1152, 'Ivan', 'Ivanov', '2016-05-14 11:40:58.496176', 2, 2, '1463215258494', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1153, 'Ivan', 'Ivanov', '2016-05-14 12:16:24.242041', 2, 0, '1463217384240', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1154, 'Ivan', 'Ivanov', '2016-05-14 12:16:27.532225', 2, 0, '1463217387530', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1155, 'Ivan', 'Ivanov', '2016-05-14 12:16:28.424392', 2, 0, '1463217388422', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1156, 'Ivan', 'Ivanov', '2016-05-14 12:16:28.480024', 2, 0, '1463217388477', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1157, 'Ivan', 'Ivanov', '2016-05-14 12:16:28.604629', 2, 0, '1463217388600', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1159, 'Ivan', 'Ivanov', '2016-05-14 12:16:30.365302', 2, 2, '1463217390362', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1160, 'Ivan', 'Ivanov', '2016-05-14 12:16:30.371093', 2, 1, '1463217390368', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1161, 'Ivan', 'Ivanov', '2016-05-14 12:16:30.461762', 2, 2, '1463217390460', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1162, 'Ivan', 'Ivanov', '2016-05-14 12:16:30.554385', 2, 1, '1463217390552', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1163, 'Ivan', 'Ivanov', '2016-05-14 12:16:30.609885', 2, 2, '1463217390607', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1164, 'Ivan', 'Ivanov', '2016-05-14 12:18:52.864664', 2, 0, '1463217532679', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1165, 'Ivan', 'Ivanov', '2016-05-14 12:20:05.791274', 2, 0, '1463217605616', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1166, 'Ivan', 'Ivanov', '2016-05-14 12:22:07.078402', 2, 0, '1463217726881', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1167, 'Ivan', 'Ivanov', '2016-05-14 12:22:54.838517', 2, 0, '1463217774623', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1168, 'Ivan', 'Ivanov', '2016-05-14 12:24:57.712882', 2, 0, '1463217897561', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1169, 'Ivan', 'Ivanov', '2016-05-14 12:26:35.16553', 2, 0, '1463217994958', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1170, 'Ivan', 'Ivanov', '2016-05-14 12:30:20.569462', 2, 0, '1463218220389', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1171, 'Ivan', 'Ivanov', '2016-05-14 12:30:21.101374', 2, 0, '1463218221099', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1172, 'Ivan', 'Ivanov', '2016-05-14 12:30:21.35938', 2, 0, '1463218221357', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1173, 'Ivan', 'Ivanov', '2016-05-14 12:30:21.3773', 2, 0, '1463218221375', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1174, 'Ivan', 'Ivanov', '2016-05-14 12:30:21.416702', 2, 0, '1463218221413', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1175, 'Ivan', 'Ivanov', '2016-05-14 12:31:19.912657', 2, 0, '1463218279782', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1176, 'Ivan', 'Ivanov', '2016-05-14 12:33:08.108213', 2, 0, '1463218387954', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1177, 'Ivan', 'Ivanov', '2016-05-14 12:33:08.733376', 2, 0, '1463218388731', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1178, 'Ivan', 'Ivanov', '2016-05-14 12:33:08.956897', 2, 0, '1463218388949', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1179, 'Ivan', 'Ivanov', '2016-05-14 12:33:08.978209', 2, 0, '1463218388975', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1180, 'Ivan', 'Ivanov', '2016-05-14 12:33:09.020039', 2, 0, '1463218389017', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1181, 'Ivan', 'Ivanov', '2016-05-14 12:34:20.187341', 2, 2, '1463218460033', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1182, 'Ivan', 'Ivanov', '2016-05-14 12:34:20.238615', 2, 1, '1463218460237', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1183, 'Ivan', 'Ivanov', '2016-05-14 12:34:20.473148', 2, 2, '1463218460471', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1184, 'Ivan', 'Ivanov', '2016-05-14 12:34:20.608962', 2, 1, '1463218460607', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1185, 'Ivan', 'Ivanov', '2016-05-14 12:34:20.672296', 2, 2, '1463218460669', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1186, 'Ivan', 'Ivanov', '2016-05-14 12:34:54.656566', 2, 0, '1463218494407', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1187, 'Ivan', 'Ivanov', '2016-05-14 12:34:55.381294', 2, 0, '1463218495379', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1188, 'Ivan', 'Ivanov', '2016-05-14 12:34:55.560395', 2, 0, '1463218495559', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1189, 'Ivan', 'Ivanov', '2016-05-14 12:34:55.593097', 2, 0, '1463218495591', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1190, 'Ivan', 'Ivanov', '2016-05-14 12:34:55.617883', 2, 0, '1463218495616', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1192, 'Ivan', 'Ivanov', '2016-05-14 14:14:41.519779', 2, 0, '1463224481506', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1193, 'Ivan', 'Ivanov', '2016-05-14 14:14:41.923574', 2, 0, '1463224481921', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1195, 'Ivan', 'Ivanov', '2016-05-14 14:14:41.994115', 2, 0, '1463224481976', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1197, 'Ivan', 'Ivanov', '2016-05-14 14:14:42.256972', 2, 2, '1463224482250', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1199, 'Ivan', 'Ivanov', '2016-05-14 14:14:42.330695', 2, 2, '1463224482315', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1200, 'Ivan', 'Ivanov', '2016-05-14 14:14:42.356769', 2, 1, '1463224482346', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1201, 'Ivan', 'Ivanov', '2016-05-14 14:14:42.381578', 2, 2, '1463224482377', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1202, 'Ivan', 'Ivanov', '2016-05-14 14:32:16.920534', 2, 0, '1463225536918', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1203, 'Ivan', 'Ivanov', '2016-05-14 14:32:17.381644', 2, 0, '1463225537379', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1204, 'Ivan', 'Ivanov', '2016-05-14 14:32:17.689283', 2, 0, '1463225537684', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1205, 'Ivan', 'Ivanov', '2016-05-14 14:32:17.723583', 2, 0, '1463225537715', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1206, 'Ivan', 'Ivanov', '2016-05-14 14:32:17.767419', 2, 0, '1463225537750', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1208, 'Ivan', 'Ivanov', '2016-05-14 14:32:17.99902', 2, 2, '1463225537984', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1209, 'Ivan', 'Ivanov', '2016-05-14 14:32:18.003695', 2, 1, '1463225538000', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1210, 'Ivan', 'Ivanov', '2016-05-14 14:32:18.037062', 2, 2, '1463225538017', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1211, 'Ivan', 'Ivanov', '2016-05-14 14:32:18.05194', 2, 1, '1463225538049', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1212, 'Ivan', 'Ivanov', '2016-05-14 14:32:18.079022', 2, 2, '1463225538064', 'Grodno, ul.Gorkogo, 89');


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 238
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2142 (class 2606 OID 25996)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2144 (class 2606 OID 25998)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2146 (class 2606 OID 26000)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 26002)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2154 (class 2606 OID 26004)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2148 (class 2606 OID 26006)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2150 (class 2606 OID 26008)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 26010)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2159 (class 2606 OID 26012)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 26014)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 26016)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);


--
-- TOC entry 2163 (class 2606 OID 26018)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 26020)
-- Name: department_type_phone_address_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);


--
-- TOC entry 2171 (class 2606 OID 26022)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2169 (class 2606 OID 26024)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 26026)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2175 (class 2606 OID 26028)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2177 (class 2606 OID 26030)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 26032)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2181 (class 2606 OID 26034)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2155 (class 1259 OID 26035)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2182 (class 2606 OID 26036)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2184 (class 2606 OID 26041)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2185 (class 2606 OID 26046)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2186 (class 2606 OID 26051)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2187 (class 2606 OID 26056)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2183 (class 2606 OID 26061)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2188 (class 2606 OID 26066)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2189 (class 2606 OID 26071)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2190 (class 2606 OID 26076)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2191 (class 2606 OID 26081)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2192 (class 2606 OID 26086)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2196 (class 2606 OID 26091)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2197 (class 2606 OID 26096)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2193 (class 2606 OID 26101)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2194 (class 2606 OID 26106)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2195 (class 2606 OID 26111)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2198 (class 2606 OID 26116)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-05-15 14:03:14

--
-- PostgreSQL database dump complete
--

