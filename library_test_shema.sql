--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-06 17:14:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25557)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 25558)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25561)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25564)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 211 (class 1259 OID 25566)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 25568)
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
-- TOC entry 233 (class 1259 OID 25753)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 25575)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25578)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300)
);


--
-- TOC entry 215 (class 1259 OID 25584)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 215
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 216 (class 1259 OID 25586)
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
-- TOC entry 217 (class 1259 OID 25590)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 217
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 218 (class 1259 OID 25592)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 25595)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 220 (class 1259 OID 25597)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 25600)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 221
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 222 (class 1259 OID 25602)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 25605)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 223
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 224 (class 1259 OID 25607)
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
-- TOC entry 225 (class 1259 OID 25610)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 25613)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 226
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 227 (class 1259 OID 25615)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 228 (class 1259 OID 25617)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 229 (class 1259 OID 25619)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 25622)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 230
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 231 (class 1259 OID 25624)
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
-- TOC entry 232 (class 1259 OID 25628)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2124 (class 2604 OID 25630)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 25631)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 25632)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 25633)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25634)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 25635)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25636)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25637)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25638)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 25639)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2306 (class 0 OID 25558)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2307 (class 0 OID 25561)
-- Dependencies: 209
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO author (id, first_name, second_name) VALUES (61, 'namne 10', 'secnamne 10');
INSERT INTO author (id, first_name, second_name) VALUES (62, 'namne 11', 'secnamne 11');
INSERT INTO author (id, first_name, second_name) VALUES (63, 'namne 12', 'secnamne 12');
INSERT INTO author (id, first_name, second_name) VALUES (64, 'namne 13', 'secnamne 13');
INSERT INTO author (id, first_name, second_name) VALUES (66, 'namne 15', 'secnamne 15');
INSERT INTO author (id, first_name, second_name) VALUES (67, 'namne 16', 'secnamne 16');
INSERT INTO author (id, first_name, second_name) VALUES (68, 'namne 17', 'secnamne 17');
INSERT INTO author (id, first_name, second_name) VALUES (69, 'namne 18', 'secnamne 18');
INSERT INTO author (id, first_name, second_name) VALUES (70, 'namne 19', 'secnamne 19');
INSERT INTO author (id, first_name, second_name) VALUES (71, 'namne 20', 'secnamne 20');
INSERT INTO author (id, first_name, second_name) VALUES (72, 'namne 21', 'secnamne 21');
INSERT INTO author (id, first_name, second_name) VALUES (74, 'namne 23', 'secnamne 23');
INSERT INTO author (id, first_name, second_name) VALUES (75, 'namne 24', 'secnamne 24');
INSERT INTO author (id, first_name, second_name) VALUES (76, 'namne 25', 'secnamne 25');
INSERT INTO author (id, first_name, second_name) VALUES (78, 'namne 26', 'secnamne 26');
INSERT INTO author (id, first_name, second_name) VALUES (80, 'namne 27', 'secnamne 27');
INSERT INTO author (id, first_name, second_name) VALUES (81, 'namne 28', 'secnamne 28');
INSERT INTO author (id, first_name, second_name) VALUES (82, 'namne 29', 'secnamne 29');
INSERT INTO author (id, first_name, second_name) VALUES (83, 'namne 30', 'secnamne 30');
INSERT INTO author (id, first_name, second_name) VALUES (84, 'namne 31', 'secnamne 31');
INSERT INTO author (id, first_name, second_name) VALUES (85, 'namne 32', 'secnamne 32');
INSERT INTO author (id, first_name, second_name) VALUES (42, 'Anton', 'Chehov');
INSERT INTO author (id, first_name, second_name) VALUES (44, 'Fedor', 'Dostoevskiy');
INSERT INTO author (id, first_name, second_name) VALUES (45, 'namne 0', 'secnamne 0');
INSERT INTO author (id, first_name, second_name) VALUES (46, 'namne 1', 'secnamne 1');
INSERT INTO author (id, first_name, second_name) VALUES (47, 'namne 2', 'secnamne 2');
INSERT INTO author (id, first_name, second_name) VALUES (48, 'namne 3', 'secnamne 3');
INSERT INTO author (id, first_name, second_name) VALUES (49, 'namne 4', 'secnamne 4');
INSERT INTO author (id, first_name, second_name) VALUES (50, 'namne 5', 'secnamne 5');
INSERT INTO author (id, first_name, second_name) VALUES (51, 'namne 6', 'secnamne 6');
INSERT INTO author (id, first_name, second_name) VALUES (52, 'namne 7', 'secnamne 7');
INSERT INTO author (id, first_name, second_name) VALUES (53, 'namne 8', 'secnamne 8');
INSERT INTO author (id, first_name, second_name) VALUES (54, 'namne 9', 'secnamne 9');


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 85, true);


--
-- TOC entry 2310 (class 0 OID 25568)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (406, 2465, 'Mumu', 234, '2016-05-06 16:02:04.804', 'Manning', '1462539724803');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (407, 2466, 'Mumu', 234, '2016-05-06 16:07:54.103', 'Manning', '1462540074102');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (408, 2467, 'Mumu', 234, '2016-05-06 16:09:18.783', 'Manning', '1462540158782');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (409, 2468, 'Mumu', 234, '2016-05-06 16:22:18.45', 'Manning', '1462540938450');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (410, 2469, 'Mumu', 234, '2016-05-06 16:24:23.951', 'Manning', '1462541063951');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (411, 2470, 'Mumu', 234, '2016-05-06 16:26:04.533', 'Manning', '1462541164533');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (412, 2471, 'Mumu', 234, '2016-05-06 16:27:11.206', 'Manning', '1462541231206');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (413, 2472, 'Mumu', 234, '2016-05-06 17:13:08.151', 'Manning', '1462543988150');


--
-- TOC entry 2331 (class 0 OID 25753)
-- Dependencies: 233
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_author (book_id, author_id) VALUES (406, 61);
INSERT INTO book_2_author (book_id, author_id) VALUES (406, 62);
INSERT INTO book_2_author (book_id, author_id) VALUES (406, 63);
INSERT INTO book_2_author (book_id, author_id) VALUES (406, 64);
INSERT INTO book_2_author (book_id, author_id) VALUES (407, 66);
INSERT INTO book_2_author (book_id, author_id) VALUES (407, 67);
INSERT INTO book_2_author (book_id, author_id) VALUES (407, 68);
INSERT INTO book_2_author (book_id, author_id) VALUES (407, 69);
INSERT INTO book_2_author (book_id, author_id) VALUES (407, 70);
INSERT INTO book_2_author (book_id, author_id) VALUES (408, 71);
INSERT INTO book_2_author (book_id, author_id) VALUES (408, 72);
INSERT INTO book_2_author (book_id, author_id) VALUES (409, 74);
INSERT INTO book_2_author (book_id, author_id) VALUES (410, 75);
INSERT INTO book_2_author (book_id, author_id) VALUES (410, 76);
INSERT INTO book_2_author (book_id, author_id) VALUES (411, 78);
INSERT INTO book_2_author (book_id, author_id) VALUES (412, 80);
INSERT INTO book_2_author (book_id, author_id) VALUES (412, 81);
INSERT INTO book_2_author (book_id, author_id) VALUES (412, 82);
INSERT INTO book_2_author (book_id, author_id) VALUES (413, 83);
INSERT INTO book_2_author (book_id, author_id) VALUES (413, 84);
INSERT INTO book_2_author (book_id, author_id) VALUES (413, 85);


--
-- TOC entry 2311 (class 0 OID 25575)
-- Dependencies: 213
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 413, true);


--
-- TOC entry 2312 (class 0 OID 25578)
-- Dependencies: 214
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (2455, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2456, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2457, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2458, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2459, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2460, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2461, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2462, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2463, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2464, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2465, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2466, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2467, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2468, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2469, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2470, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2471, 'books for test', NULL);
INSERT INTO catalog (id, path, path_parent) VALUES (2472, 'books for test', NULL);


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 215
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 2472, true);


--
-- TOC entry 2314 (class 0 OID 25586)
-- Dependencies: 216
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 217
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 60, true);


--
-- TOC entry 2316 (class 0 OID 25592)
-- Dependencies: 218
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 219
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 760, true);


--
-- TOC entry 2318 (class 0 OID 25597)
-- Dependencies: 220
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 221
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2320 (class 0 OID 25602)
-- Dependencies: 222
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 223
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2322 (class 0 OID 25607)
-- Dependencies: 224
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2323 (class 0 OID 25610)
-- Dependencies: 225
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 226
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2327 (class 0 OID 25619)
-- Dependencies: 229
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 230
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 788, true);


--
-- TOC entry 2329 (class 0 OID 25624)
-- Dependencies: 231
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2138 (class 2606 OID 25641)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2140 (class 2606 OID 25643)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2142 (class 2606 OID 25645)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 25647)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2150 (class 2606 OID 25649)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2144 (class 2606 OID 25651)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2146 (class 2606 OID 25653)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 25655)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2154 (class 2606 OID 25657)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 25659)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 25661)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2160 (class 2606 OID 25663)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 25665)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 25667)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2166 (class 2606 OID 25669)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 25671)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2168 (class 2606 OID 25673)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 25675)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2174 (class 2606 OID 25677)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2176 (class 2606 OID 25679)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 25681)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 25682)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2181 (class 2606 OID 25692)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2180 (class 2606 OID 25697)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2182 (class 2606 OID 25702)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2183 (class 2606 OID 25707)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2184 (class 2606 OID 25712)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2188 (class 2606 OID 25717)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2189 (class 2606 OID 25722)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2185 (class 2606 OID 25727)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2186 (class 2606 OID 25732)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2187 (class 2606 OID 25737)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2190 (class 2606 OID 25742)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2191 (class 2606 OID 25747)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-05-06 17:14:01

--
-- PostgreSQL database dump complete
--

