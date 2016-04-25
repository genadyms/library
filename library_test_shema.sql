--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-26 00:28:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 18553)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 18554)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    issue timestamp without time zone NOT NULL,
    return_date timestamp without time zone,
    return_date_fact timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 18557)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18560)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 211 (class 1259 OID 18562)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 18564)
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
-- TOC entry 213 (class 1259 OID 18568)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 18571)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 18574)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300)
);


--
-- TOC entry 216 (class 1259 OID 18580)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 217 (class 1259 OID 18582)
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
-- TOC entry 218 (class 1259 OID 18586)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 219 (class 1259 OID 18588)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 18591)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 221 (class 1259 OID 18593)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL,
    state_book integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18596)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 223 (class 1259 OID 18598)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 18601)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 225 (class 1259 OID 18603)
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
-- TOC entry 226 (class 1259 OID 18606)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 18609)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 228 (class 1259 OID 18611)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 229 (class 1259 OID 18613)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 230 (class 1259 OID 18615)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 18618)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 232 (class 1259 OID 18620)
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
-- TOC entry 233 (class 1259 OID 18624)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2124 (class 2604 OID 18626)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 18627)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 18628)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 18629)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 18630)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 18631)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 18632)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 18633)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 18634)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 18635)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2307 (class 0 OID 18554)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2308 (class 0 OID 18557)
-- Dependencies: 209
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 1, false);


--
-- TOC entry 2311 (class 0 OID 18564)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (14, 22, 'Hello World', 321, '2016-04-25 22:02:07.177', 'Oreally', '12312312');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (17, 25, 'Hello World', 321, '2016-04-25 22:19:47.409', 'Oreally', '1461611987409');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (18, 26, 'Hello World', 321, '2016-04-25 22:19:47.488', 'Oreally', '1461611987488');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (19, 27, 'Hello World', 321, '2016-04-25 22:25:33.328', 'Oreally', '1461612333328');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (20, 28, 'Hello World', 321, '2016-04-25 22:27:26.945', 'Oreally', '1461612446945');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (21, 29, 'Hello World', 321, '2016-04-25 22:29:38.866', 'Oreally', '1461612578866');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (22, 30, 'Hello World', 321, '2016-04-25 22:30:35.651', 'Oreally', '1461612635651');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (23, 31, 'Hello World', 321, '2016-04-25 22:31:09.108', 'Oreally', '1461612669108');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (24, 32, 'Hello World', 321, '2016-04-25 22:32:00.625', 'Oreally', '1461612720625');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (25, 33, 'Hello World', 321, '2016-04-25 22:39:00.099', 'Oreally', '1461613140099');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (26, 34, 'Hello World', 321, '2016-04-25 22:42:06.612', 'Oreally', '1461613326612');


--
-- TOC entry 2312 (class 0 OID 18568)
-- Dependencies: 213
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2313 (class 0 OID 18571)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_comment (comment_id, book_id) VALUES (7, 18);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (8, 19);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (9, 20);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (10, 21);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (11, 24);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (12, 25);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (13, 26);


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 26, true);


--
-- TOC entry 2314 (class 0 OID 18574)
-- Dependencies: 215
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


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 34, true);


--
-- TOC entry 2316 (class 0 OID 18582)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (2, 111, 'content', '2016-04-25 16:06:14.483615', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (3, 111, 'content', '2016-04-25 16:11:51.702152', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (4, 111, 'content', '2016-04-25 16:29:47.84279', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (5, 111, 'content', '2016-04-25 16:30:43.26783', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (6, 111, 'content2', '2016-04-25 19:14:26.750086', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (7, 111, 'test add comment in book', '2016-04-25 22:19:47.60796', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (8, 111, 'test add comment in book', '2016-04-25 22:25:33.390865', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (9, 111, 'test add comment in book', '2016-04-25 22:27:27.020349', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (10, 111, 'test add comment in book', '2016-04-25 22:29:38.927418', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (11, 111, 'test add comment in book', '2016-04-25 22:32:00.696142', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (12, 111, 'test add comment in book', '2016-04-25 22:39:00.157081', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (13, 111, 'test add comment in book', '2016-04-25 22:42:06.687013', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (14, 111, 'content2', '2016-04-25 22:43:15.135278', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (15, 111, 'content2', '2016-04-25 22:43:51.128779', NULL, NULL);


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 15, true);


--
-- TOC entry 2318 (class 0 OID 18588)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO contact (id, phone, address) VALUES (62, '1461583272339', 'Grodno, Sovetskaya 1461583272339');
INSERT INTO contact (id, phone, address) VALUES (64, '1461583368883', 'Grodno, Sovetskaya 1461583368883');
INSERT INTO contact (id, phone, address) VALUES (65, '1461583509661', 'Grodno, Sovetskaya 1461583509661');
INSERT INTO contact (id, phone, address) VALUES (66, '1461583551370', 'Grodno, Sovetskaya 1461583551370');
INSERT INTO contact (id, phone, address) VALUES (67, '1461583601812', 'Grodno, Sovetskaya 1461583601812');
INSERT INTO contact (id, phone, address) VALUES (68, '1461583668338', 'Grodno, Sovetskaya 1461583668338');
INSERT INTO contact (id, phone, address) VALUES (70, '1461583937304', 'Grodno, Sovetskaya 1461583937304');
INSERT INTO contact (id, phone, address) VALUES (77, '1461584267420', 'Grodno, Sovetskaya 1461584267420');
INSERT INTO contact (id, phone, address) VALUES (78, '1461584638632', 'Grodno, Sovetskaya 1461584638632');
INSERT INTO contact (id, phone, address) VALUES (79, '1461584681033', 'Grodno, Sovetskaya 1461584681033');
INSERT INTO contact (id, phone, address) VALUES (20, '12345-6789', 'Grodno, Sovetskaya 25');
INSERT INTO contact (id, phone, address) VALUES (80, '1461584742701', 'Grodno, Sovetskaya 1461584742701');
INSERT INTO contact (id, phone, address) VALUES (81, '1461584784054', 'Grodno, Sovetskaya 1461584784054');
INSERT INTO contact (id, phone, address) VALUES (24, '1461577479234', 'Grodno, Sovetskaya 1461577479234');
INSERT INTO contact (id, phone, address) VALUES (25, '1461577479249', 'Grodno, Sovetskaya 1461577479249');
INSERT INTO contact (id, phone, address) VALUES (26, '1461577479257', 'Grodno, Sovetskaya 1461577479257');
INSERT INTO contact (id, phone, address) VALUES (83, '1461585266380', 'Grodno, Sovetskaya 1461585266380');
INSERT INTO contact (id, phone, address) VALUES (28, '1461577611694', 'Grodno, Sovetskaya 1461577611694');
INSERT INTO contact (id, phone, address) VALUES (29, '1461577611732', 'Grodno, Sovetskaya 1461577611732');
INSERT INTO contact (id, phone, address) VALUES (85, '1461585344191', 'Grodno, Sovetskaya 1461585344191');
INSERT INTO contact (id, phone, address) VALUES (86, '1461585344219', 'Grodno, Sovetskaya 1461585344219');
INSERT INTO contact (id, phone, address) VALUES (57, '1461582995271', 'Grodno, Sovetskaya 1461582995271');
INSERT INTO contact (id, phone, address) VALUES (58, '1461583026152', 'Grodno, Sovetskaya 1461583026152');
INSERT INTO contact (id, phone, address) VALUES (87, '1461618021414', 'Grodno, Sovetskaya 1461618021414');


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 87, true);


--
-- TOC entry 2320 (class 0 OID 18593)
-- Dependencies: 221
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2322 (class 0 OID 18598)
-- Dependencies: 223
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2324 (class 0 OID 18603)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2325 (class 0 OID 18606)
-- Dependencies: 226
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2329 (class 0 OID 18615)
-- Dependencies: 230
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (85, '1461582995271mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (86, '1461583026152mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (90, '1461583272339mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (92, '1461583368883mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (93, '1461583509661mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (94, '1461583551370mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (95, '1461583601812mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (96, '1461583668338mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (98, '1461583937304mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (105, '1461584267420mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (106, '1461584638632mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (107, '1461584681033mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (50, '1461577176161mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (108, '1461584742701mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (52, '1461577479234mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (53, '1461577479249mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (54, '1461577479257mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (109, '1461584784054mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (56, '1461577611694mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (57, '1461577611732mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (111, '1461585266380mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (113, '1461585344191mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (114, '1461585344219mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (115, '1461618021414mail@test.by', 'pswd');


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 115, true);


--
-- TOC entry 2331 (class 0 OID 18620)
-- Dependencies: 232
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (50, 20, 'Vasya', 'Ivanov', '2016-04-25 12:39:36.164', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (52, 24, 'Vasya', 'Ivanov', '2016-04-25 12:44:39.239', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (53, 25, 'Vasya', 'Ivanov', '2016-04-25 12:44:39.253', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (54, 26, 'OtherFirstName', 'OtherLastName', '2016-04-25 12:44:39.266', 1, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (56, 28, 'Vasya', 'Ivanov', '2016-04-25 12:46:51.711', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (57, 29, 'ere', 'ererer', '2016-04-25 14:13:28.2949', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (85, 57, 'Vasya', 'Ivanov', '2016-04-25 14:16:35.422821', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (86, 58, 'Vasya', 'Ivanov', '2016-04-25 14:17:06.300818', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (90, 62, 'Vasya', 'Ivanov', '2016-04-25 14:21:12.509058', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (92, 64, 'Vasya', 'Ivanov', '2016-04-25 14:22:49.048', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (93, 65, 'Vasya', 'Ivanov', '3915-06-23 00:00:00', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (94, 66, 'Vasya', 'Ivanov', '1915-06-23 00:00:00', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (95, 67, 'Vasya', 'Ivanov', '2016-04-25 14:26:41.954991', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (96, 68, 'Vasya', 'Ivanov', '1915-06-23 00:00:00', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (98, 70, 'Vasya', 'Ivanov', '2016-04-25 14:32:17.445239', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (106, 78, 'Vasya', 'Ivanov', '2016-04-25 14:43:58.802', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (107, 79, 'Vasya', 'Ivanov', '2016-04-25 14:44:41.194', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (108, 80, 'Vasya', 'Ivanov', '2016-04-25 14:45:42.863', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (109, 81, 'Vasya', 'Ivanov', '2016-04-25 14:46:24.238', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (111, 83, 'Vasya', 'Ivanov', '2016-04-25 14:54:26.541432', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (113, 85, 'Vasya', 'Ivanov', '2016-04-25 14:55:44.198585', 0, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (114, 86, 'OtherFirstName', 'OtherLastName', '2016-04-25 14:55:44.222', 1, 0);
INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (115, 87, 'Vasya', 'Ivanov', '2016-04-26 00:00:21.531425', 0, 0);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2138 (class 2606 OID 18637)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2140 (class 2606 OID 18639)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2142 (class 2606 OID 18641)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 18643)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2150 (class 2606 OID 18645)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2144 (class 2606 OID 18647)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2146 (class 2606 OID 18649)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 18651)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2154 (class 2606 OID 18653)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 18655)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 18657)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2160 (class 2606 OID 18659)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 18661)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 18663)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2166 (class 2606 OID 18665)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 18667)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2168 (class 2606 OID 18669)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 18671)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2174 (class 2606 OID 18673)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2176 (class 2606 OID 18675)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 18677)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 18678)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2181 (class 2606 OID 18683)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2182 (class 2606 OID 18688)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2180 (class 2606 OID 18693)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2183 (class 2606 OID 18698)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2184 (class 2606 OID 18703)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2185 (class 2606 OID 18708)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2189 (class 2606 OID 18713)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2190 (class 2606 OID 18718)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2186 (class 2606 OID 18723)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2187 (class 2606 OID 18728)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2188 (class 2606 OID 18733)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2191 (class 2606 OID 18738)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2192 (class 2606 OID 18743)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-04-26 00:28:35

--
-- PostgreSQL database dump complete
--

