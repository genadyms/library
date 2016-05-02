--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-02 07:38:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 18950)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 18952)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    issue timestamp without time zone NOT NULL,
    return_date timestamp without time zone,
    return_date_fact timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 18955)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18958)
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
-- TOC entry 211 (class 1259 OID 18960)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 18962)
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
-- TOC entry 213 (class 1259 OID 18966)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 18969)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 18972)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300)
);


--
-- TOC entry 216 (class 1259 OID 18978)
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
-- TOC entry 217 (class 1259 OID 18980)
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
-- TOC entry 218 (class 1259 OID 18984)
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
-- TOC entry 219 (class 1259 OID 18986)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 18989)
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
-- TOC entry 221 (class 1259 OID 18991)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL,
    state_book integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 18994)
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
-- TOC entry 223 (class 1259 OID 18996)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 18999)
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
-- TOC entry 225 (class 1259 OID 19001)
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
-- TOC entry 226 (class 1259 OID 19004)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 19007)
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
-- TOC entry 228 (class 1259 OID 19009)
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
-- TOC entry 229 (class 1259 OID 19011)
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
-- TOC entry 230 (class 1259 OID 19013)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 19016)
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
-- TOC entry 232 (class 1259 OID 19018)
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
-- TOC entry 233 (class 1259 OID 19022)
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
-- TOC entry 2124 (class 2604 OID 19024)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 19025)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 19026)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 19027)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 19028)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 19029)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 19030)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 19031)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 19032)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 19033)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2307 (class 0 OID 18952)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2308 (class 0 OID 18955)
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
-- TOC entry 2311 (class 0 OID 18962)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (52, 140, 'Mumu', 234, '2016-04-30 06:40:32.585', 'Manning', '1461987632585');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (53, 140, 'Mumu', 234, '2016-04-30 06:40:32.594', 'Manning', '1461987632594');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (54, 140, 'Mumu', 234, '2016-04-30 06:40:32.597', 'Manning', '1461987632597');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (55, 140, 'Mumu', 234, '2016-04-30 06:40:32.602', 'Manning', '1461987632602');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (56, 140, 'Mumu', 234, '2016-04-30 06:40:32.606', 'Manning', '1461987632606');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (57, 141, 'Mumu', 234, '2016-04-30 06:40:32.872', 'Manning', '1461987632872');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (59, 143, 'Mumu', 234, '2016-04-30 06:54:04.139', 'Manning', '1461988444139');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (60, 143, 'Mumu', 234, '2016-04-30 06:54:04.147', 'Manning', '1461988444147');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (61, 143, 'Mumu', 234, '2016-04-30 06:54:04.151', 'Manning', '1461988444151');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (62, 143, 'Mumu', 234, '2016-04-30 06:54:04.155', 'Manning', '1461988444155');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (63, 143, 'Mumu', 234, '2016-04-30 06:54:04.159', 'Manning', '1461988444159');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (64, 144, 'Mumu', 234, '2016-04-30 06:54:04.508', 'Manning', '1461988444508');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (66, 146, 'Mumu', 234, '2016-04-30 07:09:56.145', 'Manning', '1461989396145');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (67, 146, 'Mumu', 234, '2016-04-30 07:09:56.155', 'Manning', '1461989396155');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (68, 146, 'Mumu', 234, '2016-04-30 07:09:56.159', 'Manning', '1461989396159');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (69, 146, 'Mumu', 234, '2016-04-30 07:09:56.163', 'Manning', '1461989396163');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (70, 146, 'Mumu', 234, '2016-04-30 07:09:56.169', 'Manning', '1461989396169');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (71, 147, 'Mumu', 234, '2016-04-30 07:09:56.505', 'Manning', '1461989396505');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (73, 149, 'Mumu', 234, '2016-04-30 07:10:49.628', 'Manning', '1461989449628');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (74, 149, 'Mumu', 234, '2016-04-30 07:10:49.637', 'Manning', '1461989449637');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (75, 149, 'Mumu', 234, '2016-04-30 07:10:49.64', 'Manning', '1461989449640');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (76, 149, 'Mumu', 234, '2016-04-30 07:10:49.644', 'Manning', '1461989449644');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (77, 149, 'Mumu', 234, '2016-04-30 07:10:49.649', 'Manning', '1461989449649');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (78, 150, 'Mumu', 234, '2016-04-30 07:10:49.907', 'Manning', '1461989449907');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (80, 152, 'Mumu', 234, '2016-04-30 07:11:13.995', 'Manning', '1461989473995');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (81, 152, 'Mumu', 234, '2016-04-30 07:11:14.005', 'Manning', '1461989474005');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (82, 152, 'Mumu', 234, '2016-04-30 07:11:14.008', 'Manning', '1461989474008');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (83, 152, 'Mumu', 234, '2016-04-30 07:11:14.013', 'Manning', '1461989474013');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (84, 152, 'Mumu', 234, '2016-04-30 07:11:14.018', 'Manning', '1461989474018');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (85, 153, 'Mumu', 234, '2016-04-30 07:11:14.294', 'Manning', '1461989474294');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (87, 155, 'Mumu', 234, '2016-04-30 07:11:47.109', 'Manning', '1461989507109');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (88, 155, 'Mumu', 234, '2016-04-30 07:11:47.117', 'Manning', '1461989507117');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (89, 155, 'Mumu', 234, '2016-04-30 07:11:47.12', 'Manning', '1461989507120');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (90, 155, 'Mumu', 234, '2016-04-30 07:11:47.124', 'Manning', '1461989507124');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (91, 155, 'Mumu', 234, '2016-04-30 07:11:47.128', 'Manning', '1461989507128');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (92, 156, 'Mumu', 234, '2016-04-30 07:11:47.412', 'Manning', '1461989507412');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (94, 158, 'Mumu', 234, '2016-04-30 07:12:10.77', 'Manning', '1461989530770');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (95, 158, 'Mumu', 234, '2016-04-30 07:12:10.78', 'Manning', '1461989530780');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (96, 158, 'Mumu', 234, '2016-04-30 07:12:10.783', 'Manning', '1461989530783');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (97, 158, 'Mumu', 234, '2016-04-30 07:12:10.787', 'Manning', '1461989530787');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (98, 158, 'Mumu', 234, '2016-04-30 07:12:10.791', 'Manning', '1461989530791');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (99, 159, 'Mumu', 234, '2016-04-30 07:12:11.108', 'Manning', '1461989531108');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (101, 161, 'Mumu', 234, '2016-04-30 07:13:02.48', 'Manning', '1461989582479');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (102, 161, 'Mumu', 234, '2016-04-30 07:13:02.489', 'Manning', '1461989582489');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (103, 161, 'Mumu', 234, '2016-04-30 07:13:02.493', 'Manning', '1461989582493');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (104, 161, 'Mumu', 234, '2016-04-30 07:13:02.497', 'Manning', '1461989582497');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (105, 161, 'Mumu', 234, '2016-04-30 07:13:02.5', 'Manning', '1461989582500');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (106, 162, 'Mumu', 234, '2016-04-30 07:13:38.863', 'Manning', '1461989618862');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (107, 162, 'Mumu', 234, '2016-04-30 07:13:38.871', 'Manning', '1461989618871');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (108, 162, 'Mumu', 234, '2016-04-30 07:13:38.875', 'Manning', '1461989618875');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (109, 162, 'Mumu', 234, '2016-04-30 07:13:38.879', 'Manning', '1461989618879');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (110, 162, 'Mumu', 234, '2016-04-30 07:13:38.883', 'Manning', '1461989618883');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (111, 163, 'Mumu', 234, '2016-04-30 07:14:28.221', 'Manning', '1461989668221');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (112, 163, 'Mumu', 234, '2016-04-30 07:14:28.237', 'Manning', '1461989668237');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (113, 163, 'Mumu', 234, '2016-04-30 07:14:28.242', 'Manning', '1461989668242');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (114, 163, 'Mumu', 234, '2016-04-30 07:14:28.246', 'Manning', '1461989668246');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (115, 163, 'Mumu', 234, '2016-04-30 07:14:28.25', 'Manning', '1461989668250');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (116, 164, 'Mumu', 234, '2016-04-30 07:14:38.877', 'Manning', '1461989678877');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (117, 164, 'Mumu', 234, '2016-04-30 07:14:38.887', 'Manning', '1461989678887');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (118, 164, 'Mumu', 234, '2016-04-30 07:14:38.892', 'Manning', '1461989678892');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (119, 164, 'Mumu', 234, '2016-04-30 07:14:38.896', 'Manning', '1461989678896');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (120, 164, 'Mumu', 234, '2016-04-30 07:14:38.9', 'Manning', '1461989678900');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (121, 165, 'Mumu', 234, '2016-04-30 07:16:14.722', 'Manning', '1461989774722');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (122, 165, 'Mumu', 234, '2016-04-30 07:16:14.732', 'Manning', '1461989774732');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (123, 165, 'Mumu', 234, '2016-04-30 07:16:14.736', 'Manning', '1461989774736');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (124, 165, 'Mumu', 234, '2016-04-30 07:16:14.741', 'Manning', '1461989774741');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (125, 165, 'Mumu', 234, '2016-04-30 07:16:14.745', 'Manning', '1461989774745');


--
-- TOC entry 2312 (class 0 OID 18966)
-- Dependencies: 213
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2313 (class 0 OID 18969)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 125, true);


--
-- TOC entry 2314 (class 0 OID 18972)
-- Dependencies: 215
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (132, 'belorussian litrature 1461987253129', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (133, 'belorussian litrature 1461987253475', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (136, 'belorussian litrature 1461987253730', 'belorussian litrature 1461987253727');
INSERT INTO catalog (id, path, path_parent) VALUES (138, 'belorussian litrature 1461987360997', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (139, 'belorussian litrature 1461987361330', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (140, 'belorussian litrature 1461987632237', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (141, 'belorussian litrature 1461987632868', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (142, 'belorussian litrature 1461987632888', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (143, 'belorussian litrature 1461988443845', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (144, 'belorussian litrature 1461988444469', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (145, 'belorussian litrature 1461988444525', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (146, 'belorussian litrature 1461989395815', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (147, 'belorussian litrature 1461989396499', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (148, 'belorussian litrature 1461989396527', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (149, 'belorussian litrature 1461989449393', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (150, 'belorussian litrature 1461989449904', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (151, 'belorussian litrature 1461989449931', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (152, 'belorussian litrature 1461989473746', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (153, 'belorussian litrature 1461989474291', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (154, 'belorussian litrature 1461989474313', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (155, 'belorussian litrature 1461989506812', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (156, 'belorussian litrature 1461989507409', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (157, 'belorussian litrature 1461989507428', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (158, 'belorussian litrature 1461989530505', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (159, 'belorussian litrature 1461989531104', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (160, 'belorussian litrature 1461989531141', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (161, 'belorussian litrature 1461989582247', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (162, 'belorussian litrature 1461989618580', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (163, 'belorussian litrature 1461989667876', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (164, 'belorussian litrature 1461989678603', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (165, 'belorussian litrature 1461989774399', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (126, 'belorussian litrature 1461987085269', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (127, 'belorussian litrature 1461987085569', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (130, 'belorussian litrature 1461987085768', 'belorussian litrature 1461987085765');


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 165, true);


--
-- TOC entry 2316 (class 0 OID 18980)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 54, true);


--
-- TOC entry 2318 (class 0 OID 18986)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 748, true);


--
-- TOC entry 2320 (class 0 OID 18991)
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
-- TOC entry 2322 (class 0 OID 18996)
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
-- TOC entry 2324 (class 0 OID 19001)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2325 (class 0 OID 19004)
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
-- TOC entry 2329 (class 0 OID 19013)
-- Dependencies: 230
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 776, true);


--
-- TOC entry 2331 (class 0 OID 19018)
-- Dependencies: 232
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2138 (class 2606 OID 19035)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2140 (class 2606 OID 19037)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2142 (class 2606 OID 19039)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 19041)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2150 (class 2606 OID 19043)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2144 (class 2606 OID 19045)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2146 (class 2606 OID 19047)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 19049)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2154 (class 2606 OID 19051)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 19053)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 19055)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2160 (class 2606 OID 19057)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 19059)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 19061)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2166 (class 2606 OID 19063)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 19065)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2168 (class 2606 OID 19067)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 19069)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2174 (class 2606 OID 19071)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2176 (class 2606 OID 19073)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 19075)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 19076)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2181 (class 2606 OID 19081)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2182 (class 2606 OID 19086)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2180 (class 2606 OID 19091)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2183 (class 2606 OID 19096)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2184 (class 2606 OID 19101)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2185 (class 2606 OID 19106)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2189 (class 2606 OID 19111)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2190 (class 2606 OID 19116)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2186 (class 2606 OID 19121)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2187 (class 2606 OID 19126)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2188 (class 2606 OID 19131)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2191 (class 2606 OID 19136)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2192 (class 2606 OID 19141)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-05-02 07:38:26

--
-- PostgreSQL database dump complete
--

