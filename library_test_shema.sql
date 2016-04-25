--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.12
-- Dumped by pg_dump version 9.3.12
-- Started on 2016-04-25 17:07:19 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 16887)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16888)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    issue timestamp without time zone NOT NULL,
    return_date timestamp without time zone,
    return_date_fact timestamp without time zone
);


--
-- TOC entry 199 (class 1259 OID 16891)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 16894)
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
-- TOC entry 201 (class 1259 OID 16896)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 202 (class 1259 OID 16898)
-- Name: book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book (
    id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    catalog_id integer NOT NULL,
    title character varying(200) NOT NULL,
    pages integer NOT NULL,
    year timestamp without time zone NOT NULL,
    publishing_office character varying(200) NOT NULL,
    isbn character varying(50)
);


--
-- TOC entry 203 (class 1259 OID 16902)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 16905)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 16908)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16914)
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
-- TOC entry 207 (class 1259 OID 16916)
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
-- TOC entry 208 (class 1259 OID 16919)
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
-- TOC entry 209 (class 1259 OID 16921)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 16924)
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
-- TOC entry 211 (class 1259 OID 16926)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL,
    state_book integer NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 16929)
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
-- TOC entry 213 (class 1259 OID 16931)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16934)
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
-- TOC entry 215 (class 1259 OID 16936)
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
-- TOC entry 216 (class 1259 OID 16939)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16942)
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
-- TOC entry 218 (class 1259 OID 16944)
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
-- TOC entry 219 (class 1259 OID 16946)
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
-- TOC entry 220 (class 1259 OID 16948)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 16951)
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
-- TOC entry 222 (class 1259 OID 16953)
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
-- TOC entry 223 (class 1259 OID 16956)
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
-- TOC entry 2004 (class 2604 OID 16958)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 16959)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 16960)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 16961)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 16962)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 16963)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 16964)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 16965)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 16966)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 16967)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2180 (class 0 OID 16888)
-- Dependencies: 198
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2181 (class 0 OID 16891)
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
-- TOC entry 2184 (class 0 OID 16898)
-- Dependencies: 202
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (12, 1, 'wwww', 4, '2005-05-06 23:09:45', 'of3', NULL);
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (13, 1, 'eder', 5, '2010-04-05 23:34:12', 'of2', NULL);
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (6, 1, 'test', 23, '2016-05-05 20:30:00', 'office1', 'null');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (9, 1, 'test2', 32, '2005-05-05 00:00:00', 'off2', 'n ull');


--
-- TOC entry 2185 (class 0 OID 16902)
-- Dependencies: 203
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2186 (class 0 OID 16905)
-- Dependencies: 204
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 201
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 13, true);


--
-- TOC entry 2187 (class 0 OID 16908)
-- Dependencies: 205
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (1, 'null', 'home');


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 206
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 1, true);


--
-- TOC entry 2189 (class 0 OID 16916)
-- Dependencies: 207
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (2, 111, 'content', '2016-04-25 16:06:14.483615', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (3, 111, 'content', '2016-04-25 16:11:51.702152', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (4, 111, 'content', '2016-04-25 16:29:47.84279', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (5, 111, 'content', '2016-04-25 16:30:43.26783', NULL, NULL);


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 5, true);


--
-- TOC entry 2191 (class 0 OID 16921)
-- Dependencies: 209
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


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 210
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 86, true);


--
-- TOC entry 2193 (class 0 OID 16926)
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
-- TOC entry 2195 (class 0 OID 16931)
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
-- TOC entry 2197 (class 0 OID 16936)
-- Dependencies: 215
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2198 (class 0 OID 16939)
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
-- TOC entry 2202 (class 0 OID 16948)
-- Dependencies: 220
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


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 114, true);


--
-- TOC entry 2204 (class 0 OID 16953)
-- Dependencies: 222
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


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2018 (class 2606 OID 16969)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2020 (class 2606 OID 16971)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2022 (class 2606 OID 16973)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 16975)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2030 (class 2606 OID 16977)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2024 (class 2606 OID 16979)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2026 (class 2606 OID 16981)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 16983)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2034 (class 2606 OID 16985)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16987)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 17082)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2040 (class 2606 OID 16989)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 16991)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 16993)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2046 (class 2606 OID 16995)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 16997)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2048 (class 2606 OID 16999)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 17001)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2054 (class 2606 OID 17003)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2056 (class 2606 OID 17005)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2058 (class 2606 OID 17007)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 17008)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2061 (class 2606 OID 17013)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2062 (class 2606 OID 17018)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2060 (class 2606 OID 17023)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2063 (class 2606 OID 17028)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2064 (class 2606 OID 17033)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2065 (class 2606 OID 17038)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2069 (class 2606 OID 17043)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2070 (class 2606 OID 17048)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2066 (class 2606 OID 17053)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2067 (class 2606 OID 17058)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2068 (class 2606 OID 17063)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2071 (class 2606 OID 17068)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2072 (class 2606 OID 17073)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-04-25 17:07:20 MSK

--
-- PostgreSQL database dump complete
--

