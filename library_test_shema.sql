--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-04 16:48:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25352)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 25354)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25357)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25360)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 211 (class 1259 OID 25362)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 25364)
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
-- TOC entry 213 (class 1259 OID 25368)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25371)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25374)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300),
    parent character varying(250)
);


--
-- TOC entry 216 (class 1259 OID 25380)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 234 (class 1259 OID 25549)
-- Name: catalog_test; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog_test (
    id character varying(250) NOT NULL,
    parent_id character varying(250)
);


--
-- TOC entry 217 (class 1259 OID 25382)
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
-- TOC entry 218 (class 1259 OID 25386)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 219 (class 1259 OID 25388)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 25391)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 221 (class 1259 OID 25393)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25396)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 223 (class 1259 OID 25398)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 25401)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 225 (class 1259 OID 25403)
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
-- TOC entry 226 (class 1259 OID 25406)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 25409)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 228 (class 1259 OID 25411)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 229 (class 1259 OID 25413)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 230 (class 1259 OID 25415)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 25418)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 232 (class 1259 OID 25420)
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
-- TOC entry 233 (class 1259 OID 25424)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2128 (class 2604 OID 25426)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25427)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25428)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25429)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25430)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 25431)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 25432)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 25433)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 25434)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 25435)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2315 (class 0 OID 25354)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2316 (class 0 OID 25357)
-- Dependencies: 209
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 1, false);


--
-- TOC entry 2319 (class 0 OID 25364)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (285, 213, 'Mumu', 234, '2016-05-03 08:51:10.356', 'Manning', '1462254670356');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (286, 214, 'Mumu', 234, '2016-05-03 08:51:12.338', 'Manning', '1462254672338');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (287, 215, 'Mumu', 234, '2016-05-03 08:51:12.418', 'Manning', '1462254672418');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (288, 215, 'Mumu', 234, '2016-05-03 08:51:12.449', 'Manning', '1462254672449');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (289, 215, 'Mumu', 234, '2016-05-03 08:51:12.47', 'Manning', '1462254672470');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (290, 215, 'Mumu', 234, '2016-05-03 08:51:12.519', 'Manning', '1462254672519');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (291, 215, 'Mumu', 234, '2016-05-03 08:51:12.545', 'Manning', '1462254672545');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (292, 216, 'Mumu', 234, '2016-05-03 08:51:12.747', 'Manning', '1462254672747');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (293, 222, 'Mumu', 234, '2016-05-03 08:52:39.554', 'Manning', '1462254759553');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (294, 223, 'Mumu', 234, '2016-05-03 08:52:40.077', 'Manning', '1462254760077');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (295, 224, 'Mumu', 234, '2016-05-03 08:52:40.168', 'Manning', '1462254760168');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (296, 224, 'Mumu', 234, '2016-05-03 08:52:40.207', 'Manning', '1462254760207');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (297, 224, 'Mumu', 234, '2016-05-03 08:52:40.222', 'Manning', '1462254760222');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (298, 224, 'Mumu', 234, '2016-05-03 08:52:40.272', 'Manning', '1462254760272');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (299, 224, 'Mumu', 234, '2016-05-03 08:52:40.336', 'Manning', '1462254760336');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (300, 225, 'Mumu', 234, '2016-05-03 08:52:40.462', 'Manning', '1462254760462');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (301, 231, 'Mumu', 234, '2016-05-03 08:54:17.729', 'Manning', '1462254857729');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (302, 232, 'Mumu', 234, '2016-05-03 08:54:18.155', 'Manning', '1462254858155');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (303, 233, 'Mumu', 234, '2016-05-03 08:54:18.267', 'Manning', '1462254858267');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (304, 233, 'Mumu', 234, '2016-05-03 08:54:18.299', 'Manning', '1462254858299');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (305, 233, 'Mumu', 234, '2016-05-03 08:54:18.311', 'Manning', '1462254858311');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (306, 233, 'Mumu', 234, '2016-05-03 08:54:18.319', 'Manning', '1462254858319');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (307, 233, 'Mumu', 234, '2016-05-03 08:54:18.341', 'Manning', '1462254858341');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (308, 234, 'Mumu', 234, '2016-05-03 08:54:18.435', 'Manning', '1462254858435');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (309, 243, 'Mumu', 234, '2016-05-03 09:13:17.394', 'Manning', '1462255997394');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (310, 244, 'Mumu', 234, '2016-05-03 09:13:18.432', 'Manning', '1462255998432');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (311, 245, 'Mumu', 234, '2016-05-03 09:13:18.473', 'Manning', '1462255998473');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (312, 245, 'Mumu', 234, '2016-05-03 09:13:18.481', 'Manning', '1462255998481');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (313, 245, 'Mumu', 234, '2016-05-03 09:13:18.504', 'Manning', '1462255998504');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (314, 245, 'Mumu', 234, '2016-05-03 09:13:18.517', 'Manning', '1462255998517');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (315, 245, 'Mumu', 234, '2016-05-03 09:13:18.532', 'Manning', '1462255998532');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (316, 246, 'Mumu', 234, '2016-05-03 09:13:18.613', 'Manning', '1462255998613');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (317, 253, 'Mumu', 234, '2016-05-03 09:51:14.863', 'Manning', '1462258274863');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (318, 254, 'Mumu', 234, '2016-05-03 09:51:15.044', 'Manning', '1462258275044');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (319, 255, 'Mumu', 234, '2016-05-03 09:51:15.091', 'Manning', '1462258275091');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (320, 255, 'Mumu', 234, '2016-05-03 09:51:15.104', 'Manning', '1462258275104');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (321, 255, 'Mumu', 234, '2016-05-03 09:51:15.117', 'Manning', '1462258275117');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (322, 255, 'Mumu', 234, '2016-05-03 09:51:15.122', 'Manning', '1462258275122');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (323, 255, 'Mumu', 234, '2016-05-03 09:51:15.128', 'Manning', '1462258275128');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (324, 256, 'Mumu', 234, '2016-05-03 09:51:15.203', 'Manning', '1462258275203');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (325, 472, 'Mumu', 234, '2016-05-04 08:51:33.714', 'Manning', '1462341093714');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (326, 473, 'Mumu', 234, '2016-05-04 08:51:34.288', 'Manning', '1462341094288');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (327, 474, 'Mumu', 234, '2016-05-04 08:51:34.338', 'Manning', '1462341094338');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (328, 474, 'Mumu', 234, '2016-05-04 08:51:34.348', 'Manning', '1462341094348');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (329, 474, 'Mumu', 234, '2016-05-04 08:51:34.358', 'Manning', '1462341094358');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (330, 474, 'Mumu', 234, '2016-05-04 08:51:34.363', 'Manning', '1462341094363');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (331, 474, 'Mumu', 234, '2016-05-04 08:51:34.37', 'Manning', '1462341094370');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (332, 475, 'Mumu', 234, '2016-05-04 08:51:34.404', 'Manning', '1462341094404');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (333, 484, 'Mumu', 234, '2016-05-04 09:16:14.848', 'Manning', '1462342574848');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (334, 485, 'Mumu', 234, '2016-05-04 09:16:15.44', 'Manning', '1462342575440');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (335, 486, 'Mumu', 234, '2016-05-04 09:16:15.505', 'Manning', '1462342575505');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (336, 486, 'Mumu', 234, '2016-05-04 09:16:15.511', 'Manning', '1462342575511');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (337, 486, 'Mumu', 234, '2016-05-04 09:16:15.528', 'Manning', '1462342575528');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (338, 486, 'Mumu', 234, '2016-05-04 09:16:15.554', 'Manning', '1462342575553');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (339, 486, 'Mumu', 234, '2016-05-04 09:16:15.569', 'Manning', '1462342575569');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (340, 487, 'Mumu', 234, '2016-05-04 09:16:15.662', 'Manning', '1462342575662');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (341, 492, 'Mumu', 234, '2016-05-04 09:16:47.214', 'Manning', '1462342607214');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (342, 493, 'Mumu', 234, '2016-05-04 09:16:47.834', 'Manning', '1462342607834');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (343, 494, 'Mumu', 234, '2016-05-04 09:16:47.866', 'Manning', '1462342607866');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (344, 494, 'Mumu', 234, '2016-05-04 09:16:47.874', 'Manning', '1462342607874');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (345, 494, 'Mumu', 234, '2016-05-04 09:16:47.891', 'Manning', '1462342607891');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (346, 494, 'Mumu', 234, '2016-05-04 09:16:47.898', 'Manning', '1462342607898');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (347, 494, 'Mumu', 234, '2016-05-04 09:16:47.903', 'Manning', '1462342607903');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (348, 495, 'Mumu', 234, '2016-05-04 09:16:47.954', 'Manning', '1462342607954');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (349, 504, 'Mumu', 234, '2016-05-04 15:06:41.008', 'Manning', '1462363601008');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (350, 505, 'Mumu', 234, '2016-05-04 15:06:41.658', 'Manning', '1462363601658');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (351, 506, 'Mumu', 234, '2016-05-04 15:06:41.719', 'Manning', '1462363601719');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (352, 506, 'Mumu', 234, '2016-05-04 15:06:41.732', 'Manning', '1462363601732');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (353, 506, 'Mumu', 234, '2016-05-04 15:06:41.743', 'Manning', '1462363601743');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (354, 506, 'Mumu', 234, '2016-05-04 15:06:41.749', 'Manning', '1462363601749');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (355, 506, 'Mumu', 234, '2016-05-04 15:06:41.755', 'Manning', '1462363601755');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (356, 507, 'Mumu', 234, '2016-05-04 15:06:41.806', 'Manning', '1462363601806');


--
-- TOC entry 2320 (class 0 OID 25368)
-- Dependencies: 213
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2321 (class 0 OID 25371)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 356, true);


--
-- TOC entry 2322 (class 0 OID 25374)
-- Dependencies: 215
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent, parent) VALUES (213, 'belorussian litrature 1462254669371', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (214, 'belorussian litrature 1462254672316', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (215, 'belorussian litrature 1462254672396', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (216, 'belorussian litrature 1462254672714', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (217, 'belorussian litrature 1462254672788', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (218, 'belorussian litrature 1462254672844', 'belorussian litrature 1462254672788', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (219, 'belorussian litrature 1462254673016', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (220, 'belorussian litrature 1462254673056', 'belorussian litrature 1462254673016', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (221, 'belorussian litrature 1462254673094', 'belorussian litrature 1462254673016', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (222, 'belorussian litrature 1462254759352', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (223, 'belorussian litrature 1462254760036', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (224, 'belorussian litrature 1462254760138', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (225, 'belorussian litrature 1462254760421', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (226, 'belorussian litrature 1462254760472', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (227, 'belorussian litrature 1462254760497', 'belorussian litrature 1462254760472', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (228, 'belorussian litrature 1462254760600', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (229, 'belorussian litrature 1462254760653', 'belorussian litrature 1462254760600', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (230, 'belorussian litrature 1462254760679', 'belorussian litrature 1462254760600', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (231, 'belorussian litrature 1462254857562', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (232, 'belorussian litrature 1462254858137', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (233, 'belorussian litrature 1462254858226', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (234, 'belorussian litrature 1462254858415', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (235, 'belorussian litrature 1462254858456', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (236, 'belorussian litrature 1462254858476', 'belorussian litrature 1462254858456', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (237, 'belorussian litrature 1462254858605', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (238, 'belorussian litrature 1462254858624', 'belorussian litrature 1462254858605', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (239, 'belorussian litrature 1462254858636', 'belorussian litrature 1462254858605', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (240, 'belorussian litrature 1462254925586', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (241, 'belorussian litrature 1462254925765', 'belorussian litrature 1462254925586', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (242, 'belorussian litrature 1462254925804', 'belorussian litrature 1462254925586', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (243, 'belorussian litrature 1462255997057', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (244, 'belorussian litrature 1462255998394', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (245, 'belorussian litrature 1462255998465', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (246, 'belorussian litrature 1462255998599', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (247, 'belorussian litrature 1462255998625', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (248, 'belorussian litrature 1462255998634', 'belorussian litrature 1462255998625', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (249, 'belorussian litrature 1462255998638', 'belorussian litrature 1462255998625', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (250, 'belorussian litrature 1462258272241', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (251, 'belorussian litrature 1462258272667', 'belorussian litrature 1462258272241', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (252, 'belorussian litrature 1462258272769', 'belorussian litrature 1462258272241', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (253, 'belorussian litrature 1462258274833', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (254, 'belorussian litrature 1462258275009', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (255, 'belorussian litrature 1462258275082', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (256, 'belorussian litrature 1462258275195', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (257, 'belorussian litrature 1462258275234', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (258, 'belorussian litrature 1462258275247', 'belorussian litrature 1462258275234', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (259, 'belorussian litrature 1462258275250', 'belorussian litrature 1462258275234', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (260, 'belorussian litrature 1462258694361', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (261, 'belorussian litrature 1462258694606', 'belorussian litrature 1462258694361', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (262, 'belorussian litrature 1462258694634', 'belorussian litrature 1462258694361', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (263, 'belorussian litrature 1462258740970', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (264, 'belorussian litrature 1462258741194', 'belorussian litrature 1462258740970', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (265, 'belorussian litrature 1462258741233', 'belorussian litrature 1462258740970', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (267, 'belorussian litrature 1462261051183', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (268, 'belorussian litrature 1462261051208', 'belorussian litrature 1462261051183', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (269, 'belorussian litrature 1462261051352', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (270, 'belorussian litrature 1462261051358', 'belorussian litrature 1462261051352', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (271, 'belorussian litrature 1462261051362', 'belorussian litrature 1462261051352', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (272, 'belorussian litrature 1462261051471', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (274, 'belorussian litrature 1462261189948', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (275, 'belorussian litrature 1462261189957', 'belorussian litrature 1462261189948', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (276, 'belorussian litrature 1462261190120', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (277, 'belorussian litrature 1462261190126', 'belorussian litrature 1462261190120', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (278, 'belorussian litrature 1462261190132', 'belorussian litrature 1462261190120', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (279, 'belorussian litrature 1462261190197', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (281, 'belorussian litrature 1462261211599', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (282, 'belorussian litrature 1462261211621', 'belorussian litrature 1462261211599', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (283, 'belorussian litrature 1462261211739', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (284, 'belorussian litrature 1462261211753', 'belorussian litrature 1462261211739', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (285, 'belorussian litrature 1462261211762', 'belorussian litrature 1462261211739', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (286, 'belorussian litrature 1462261211807', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (288, 'belorussian litrature 1462261355626', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (289, 'belorussian litrature 1462261355646', 'belorussian litrature 1462261355626', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (290, 'belorussian litrature 1462261355728', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (291, 'belorussian litrature 1462261355753', 'belorussian litrature 1462261355728', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (292, 'belorussian litrature 1462261355762', 'belorussian litrature 1462261355728', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (293, 'belorussian litrature 1462261355801', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (295, 'belorussian litrature 1462261437759', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (296, 'belorussian litrature 1462261437768', 'belorussian litrature 1462261437759', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (297, 'belorussian litrature 1462261437863', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (298, 'belorussian litrature 1462261437895', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (299, 'belorussian litrature 1462261437905', 'belorussian litrature 1462261437895', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (300, 'belorussian litrature 1462261437910', 'belorussian litrature 1462261437895', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (302, 'belorussian litrature 1462261707397', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (303, 'belorussian litrature 1462261707425', 'belorussian litrature 1462261707397', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (304, 'belorussian litrature 1462261707506', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (305, 'test new path', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (306, 'belorussian litrature 1462261707671', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (307, 'belorussian litrature 1462261707698', 'belorussian litrature 1462261707671', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (308, 'belorussian litrature 1462261707703', 'belorussian litrature 1462261707671', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (309, 'belorussian litrature 1462262153496', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (310, 'test new path 2', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (312, 'belorussian litrature 1462263938577', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (313, 'belorussian litrature 1462263938611', 'belorussian litrature 1462263938577', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (314, 'belorussian litrature 1462263938678', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (315, 'belorussian litrature 1462263938725', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (316, 'belorussian litrature 1462263938771', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (317, 'belorussian litrature 1462263938790', 'belorussian litrature 1462263938771', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (318, 'belorussian litrature 1462263938802', 'belorussian litrature 1462263938771', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (320, 'belorussian litrature 1462264042699', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (321, 'belorussian litrature 1462264042729', 'belorussian litrature 1462264042699', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (322, 'belorussian litrature 1462264042796', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (323, 'belorussian litrature 1462264042814', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (324, 'belorussian litrature 1462264042847', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (325, 'belorussian litrature 1462264042852', 'belorussian litrature 1462264042847', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (326, 'belorussian litrature 1462264042883', 'belorussian litrature 1462264042847', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (327, 'belorussian litrature 1462264155323', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (328, 'belorussian litrature 1462264245287', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (329, 'belorussian litrature 1462264297803', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (330, 'belorussian litrature 1462264791020', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (331, 'belorussian litrature 1462264924283', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (332, 'belorussian litrature 1462264978228', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (333, 'test new path 4', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (334, 'test new path 5', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (335, 'test new path 6', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (336, 'test new path 7', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (337, 'belorussian litrature 1462266072471', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (338, 'new path 0.7135887923822253', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (339, 'belorussian litrature 1462266226507', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (340, 'belorussian litrature 1462266394856', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (341, 'belorussian litrature 1462266575491', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (342, 'belorussian litrature 1462266670086', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (344, 'belorussian litrature 1462266701890', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (345, 'belorussian litrature 1462266701908', 'belorussian litrature 1462266701890', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (346, 'belorussian litrature 1462266701976', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (347, 'belorussian litrature 1462266702004', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (348, 'belorussian litrature 1462266702030', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (349, 'belorussian litrature 1462266702038', 'belorussian litrature 1462266702030', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (350, 'belorussian litrature 1462266702060', 'belorussian litrature 1462266702030', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (351, 'belorussian litrature 1462267036669', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (352, 'belorussian litrature 1462267101535', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (353, 'belorussian litrature 1462267169232', 'new path 0.6947410498805514', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (354, 'new path 0.3898967275116143', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (355, 'belorussian litrature 1462267325434', 'new path 0.06444225095519507', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (356, 'belorussian litrature 1462267358748', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (357, 'belorussian litrature 1462267398959', 'new path 0.4945782769776189', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (358, 'belorussian litrature 1462267444487', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (359, 'belorussian litrature 1462267556844', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (360, 'belorussian litrature 1462267586258', 'new path 0.37291525607629905', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (361, 'belorussian litrature 1462267670783', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (362, 'belorussian litrature 1462267894549', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (363, 'belorussian litrature 1462267984667', 'new path 0.16599185314104237', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (364, 'belorussian litrature 1462268323594', 'new path 0.39945252201988934', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (365, 'belorussian litrature 1462268350979', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (366, 'new path 0.13937914567085663', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (367, 'new path 0.46538533274049554', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (368, 'new path 0.24922892696789445', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (370, 'belorussian litrature 1462268979869', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (371, 'belorussian litrature 1462268979891', 'belorussian litrature 1462268979869', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (372, 'belorussian litrature 1462268979957', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (373, 'new path 0.20355038431791272', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (374, 'belorussian litrature 1462268980088', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (375, 'belorussian litrature 1462268980106', 'belorussian litrature 1462268980088', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (376, 'belorussian litrature 1462268980110', 'belorussian litrature 1462268980088', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (378, 'belorussian litrature 1462269161396', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (380, 'belorussian litrature 1462269161526', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (381, 'new path 0.1388053341200397', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (382, 'belorussian litrature 1462269161657', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (383, 'belorussian litrature 1462269161669', 'belorussian litrature 1462269161657', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (384, 'belorussian litrature 1462269161673', 'belorussian litrature 1462269161657', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (385, 'belorussian litrature 1462269254164', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (387, 'belorussian litrature 1462269419504', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (388, 'belorussian litrature 1462269419675', 'belorussian litrature 1462269419504', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (389, 'belorussian litrature 1462269518618', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (391, 'belorussian litrature 1462275964778', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (392, 'belorussian litrature 1462275964978', 'belorussian litrature 1462275964778', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (394, 'belorussian litrature 1462275982799', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (395, 'belorussian litrature 1462275982812', 'belorussian litrature 1462275982799', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (396, 'belorussian litrature 1462275982903', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (397, 'new path 0.9767873713933095', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (398, 'belorussian litrature 1462275983033', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (399, 'belorussian litrature 1462275983049', 'belorussian litrature 1462275983033', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (400, 'belorussian litrature 1462275983053', 'belorussian litrature 1462275983033', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (402, 'belorussian litrature 1462276101325', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (403, 'belorussian litrature 1462276101336', 'belorussian litrature 1462276101325', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (404, 'belorussian litrature 1462276101484', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (405, 'new path 0.9023959469380951', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (406, 'belorussian litrature 1462276101700', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (407, 'belorussian litrature 1462276101738', 'belorussian litrature 1462276101700', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (408, 'belorussian litrature 1462276101748', 'belorussian litrature 1462276101700', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (410, 'belorussian litrature 1462276141029', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (411, 'belorussian litrature 1462276141039', 'belorussian litrature 1462276141029', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (412, 'belorussian litrature 1462276141126', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (413, 'new path 0.9894678015737408', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (414, 'belorussian litrature 1462276141255', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (415, 'belorussian litrature 1462276141263', 'belorussian litrature 1462276141255', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (416, 'belorussian litrature 1462276141289', 'belorussian litrature 1462276141255', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (418, 'belorussian litrature 1462276164629', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (419, 'belorussian litrature 1462276164643', 'belorussian litrature 1462276164629', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (420, 'belorussian litrature 1462276164752', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (421, 'new path 0.1416487280021551', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (422, 'belorussian litrature 1462276164895', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (423, 'belorussian litrature 1462276164905', 'belorussian litrature 1462276164895', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (424, 'belorussian litrature 1462276164909', 'belorussian litrature 1462276164895', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (426, 'belorussian litrature 1462276421324', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (427, 'belorussian litrature 1462276421338', 'belorussian litrature 1462276421324', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (428, 'belorussian litrature 1462276421437', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (429, 'new path 0.7994645741648853', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (430, 'belorussian litrature 1462276421531', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (431, 'belorussian litrature 1462276421537', 'belorussian litrature 1462276421531', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (432, 'belorussian litrature 1462276421543', 'belorussian litrature 1462276421531', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (434, 'belorussian litrature 1462276912103', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (435, 'belorussian litrature 1462276912186', 'belorussian litrature 1462276912103', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (436, 'belorussian litrature 1462276912337', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (437, 'new path 0.9058018026817521', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (438, 'belorussian litrature 1462276912467', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (439, 'belorussian litrature 1462276912474', 'belorussian litrature 1462276912467', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (440, 'belorussian litrature 1462276912479', 'belorussian litrature 1462276912467', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (442, 'belorussian litrature 1462276987302', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (443, 'belorussian litrature 1462276987329', 'belorussian litrature 1462276987302', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (444, 'belorussian litrature 1462276987437', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (445, 'new path 0.7653529521487615', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (446, 'belorussian litrature 1462276987618', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (447, 'belorussian litrature 1462276987624', 'belorussian litrature 1462276987618', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (448, 'belorussian litrature 1462276987634', 'belorussian litrature 1462276987618', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (450, 'belorussian litrature 1462277675249', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (452, 'belorussian litrature 1462277675399', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (453, 'new path 0.637674408927245', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (454, 'belorussian litrature 1462277675569', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (455, 'belorussian litrature 1462277675576', 'belorussian litrature 1462277675569', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (456, 'belorussian litrature 1462277675580', 'belorussian litrature 1462277675569', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (457, 'belorussian litrature 1462277728379', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (459, 'belorussian litrature 1462277729430', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (460, 'new path 0.31589799207019575', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (461, 'belorussian litrature 1462277729618', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (462, 'belorussian litrature 1462277729622', 'belorussian litrature 1462277729618', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (463, 'belorussian litrature 1462277729627', 'belorussian litrature 1462277729618', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (464, 'belorussian litrature 1462278141069', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (466, 'belorussian litrature 1462278142343', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (467, 'new path 0.9814738545460201', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (468, 'belorussian litrature 1462278142521', 'liturature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (469, 'belorussian litrature 1462278142543', 'belorussian litrature 1462278142521', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (470, 'belorussian litrature 1462278142548', 'belorussian litrature 1462278142521', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (471, 'belorussian litrature 1462278142557', 'belorussian litrature 1462278142521', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (472, 'belorussian litrature 1462341093370', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (473, 'belorussian litrature 1462341094283', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (474, 'belorussian litrature 1462341094308', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (475, 'belorussian litrature 1462341094399', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (476, 'belorussian litrature 1462341094486', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (477, 'belorussian litrature 1462341094494', 'litrature/belorussian litrature 1462341094486', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (478, 'belorussian litrature 1462341094500', 'litrature/belorussian litrature 1462341094486', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (479, 'belorussian litrature 1462341094507', 'litrature/belorussian litrature 1462341094486', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (480, 'belorussian litrature 1462342549145', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (481, 'belorussian litrature 1462342549655', 'belorussian litrature 1462342549145', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (482, 'belorussian litrature 1462342549658', 'belorussian litrature 1462342549145', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (483, 'belorussian litrature 1462342549663', 'belorussian litrature 1462342549145', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (484, 'belorussian litrature 1462342574424', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (485, 'belorussian litrature 1462342575434', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (486, 'belorussian litrature 1462342575496', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (487, 'belorussian litrature 1462342575652', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (488, 'belorussian litrature 1462342575679', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (489, 'belorussian litrature 1462342575685', 'belorussian litrature 1462342575679', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (490, 'belorussian litrature 1462342575691', 'belorussian litrature 1462342575679', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (491, 'belorussian litrature 1462342575703', 'belorussian litrature 1462342575679', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (492, 'belorussian litrature 1462342606865', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (493, 'belorussian litrature 1462342607829', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (494, 'belorussian litrature 1462342607858', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (495, 'belorussian litrature 1462342607951', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (500, 'belorussian litrature 1462352866886', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (501, 'belorussian litrature 1462352867229', 'belorussian litrature 1462352866886', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (502, 'belorussian litrature 1462352867240', 'belorussian litrature 1462352866886', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (503, 'belorussian litrature 1462352867257', 'belorussian litrature 1462352866886', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (504, 'belorussian litrature 1462363600088', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (505, 'belorussian litrature 1462363601651', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (506, 'belorussian litrature 1462363601704', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (507, 'belorussian litrature 1462363601796', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (508, 'belorussian litrature 1462363601814', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (509, 'belorussian litrature 1462363601832', 'belorussian litrature 1462363601814', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (510, 'belorussian litrature 1462363601842', 'belorussian litrature 1462363601814', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (511, 'belorussian litrature 1462363601866', 'belorussian litrature 1462363601814', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (512, 'belorussian litrature 1462363603095', 'litrature', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (513, 'belorussian litrature 1462363603107', 'belorussian litrature 1462363603095', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (514, 'belorussian litrature 1462363603112', 'belorussian litrature 1462363603095', NULL);
INSERT INTO catalog (id, path, path_parent, parent) VALUES (515, 'belorussian litrature 1462363603117', 'belorussian litrature 1462363603095', NULL);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 515, true);


--
-- TOC entry 2341 (class 0 OID 25549)
-- Dependencies: 234
-- Data for Name: catalog_test; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog_test (id, parent_id) VALUES ('root1', NULL);
INSERT INTO catalog_test (id, parent_id) VALUES ('root1/root2', 'root1');
INSERT INTO catalog_test (id, parent_id) VALUES ('root1/root2/root3', 'root1/root2');
INSERT INTO catalog_test (id, parent_id) VALUES ('root1/root2/root4', 'root1/root2');
INSERT INTO catalog_test (id, parent_id) VALUES ('root11', NULL);
INSERT INTO catalog_test (id, parent_id) VALUES ('каталог 1', NULL);


--
-- TOC entry 2324 (class 0 OID 25382)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 60, true);


--
-- TOC entry 2326 (class 0 OID 25388)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 760, true);


--
-- TOC entry 2328 (class 0 OID 25393)
-- Dependencies: 221
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2330 (class 0 OID 25398)
-- Dependencies: 223
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2332 (class 0 OID 25403)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2333 (class 0 OID 25406)
-- Dependencies: 226
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 25415)
-- Dependencies: 230
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 788, true);


--
-- TOC entry 2339 (class 0 OID 25420)
-- Dependencies: 232
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2142 (class 2606 OID 25437)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2144 (class 2606 OID 25439)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2146 (class 2606 OID 25441)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 25443)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2154 (class 2606 OID 25445)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2148 (class 2606 OID 25447)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2150 (class 2606 OID 25449)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 25451)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2158 (class 2606 OID 25453)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 25553)
-- Name: catalog_test_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog_test
    ADD CONSTRAINT catalog_test_id_key UNIQUE (id);


--
-- TOC entry 2186 (class 2606 OID 25555)
-- Name: catalog_test_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog_test
    ADD CONSTRAINT catalog_test_pkey PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 25455)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 25457)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2164 (class 2606 OID 25459)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 25461)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 25463)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2170 (class 2606 OID 25465)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 25467)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2172 (class 2606 OID 25469)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 25471)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2178 (class 2606 OID 25473)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2180 (class 2606 OID 25475)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 25477)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2187 (class 2606 OID 25478)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2189 (class 2606 OID 25483)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2190 (class 2606 OID 25488)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2188 (class 2606 OID 25493)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2191 (class 2606 OID 25498)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2192 (class 2606 OID 25503)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2193 (class 2606 OID 25508)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2197 (class 2606 OID 25513)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2198 (class 2606 OID 25518)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2194 (class 2606 OID 25523)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2195 (class 2606 OID 25528)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2196 (class 2606 OID 25533)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2199 (class 2606 OID 25538)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2200 (class 2606 OID 25543)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-05-04 16:48:58

--
-- PostgreSQL database dump complete
--

