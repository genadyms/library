--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-13 02:16:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25285)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 25287)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25290)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25293)
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
-- TOC entry 211 (class 1259 OID 25295)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 25297)
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
-- TOC entry 213 (class 1259 OID 25301)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25304)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25307)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 216 (class 1259 OID 25310)
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
-- TOC entry 217 (class 1259 OID 25312)
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
-- TOC entry 218 (class 1259 OID 25316)
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
-- TOC entry 219 (class 1259 OID 25318)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 25321)
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
-- TOC entry 221 (class 1259 OID 25323)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25326)
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
-- TOC entry 223 (class 1259 OID 25328)
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
-- TOC entry 224 (class 1259 OID 25334)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 25337)
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
-- Dependencies: 225
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 226 (class 1259 OID 25339)
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
-- TOC entry 227 (class 1259 OID 25342)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 25345)
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
-- Dependencies: 228
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 229 (class 1259 OID 25347)
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
-- Dependencies: 229
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 230 (class 1259 OID 25349)
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
-- Dependencies: 230
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 231 (class 1259 OID 25351)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 25354)
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
-- Dependencies: 232
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 233 (class 1259 OID 25356)
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
-- TOC entry 234 (class 1259 OID 25363)
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
-- Dependencies: 234
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2128 (class 2604 OID 25365)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25366)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25367)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25368)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25369)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 25370)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 25371)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 25372)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 25373)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 25374)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2315 (class 0 OID 25287)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2316 (class 0 OID 25290)
-- Dependencies: 209
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


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 249, true);


--
-- TOC entry 2319 (class 0 OID 25297)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1212, NULL, 'Mumu', 234, '2016-05-13 02:14:53.475', 'Manning', '0.745598552904764');


--
-- TOC entry 2320 (class 0 OID 25301)
-- Dependencies: 213
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2321 (class 0 OID 25304)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_comment (comment_id, book_id) VALUES (182, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (183, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (184, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (185, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (186, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (187, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (188, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (189, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (190, 1212);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (191, 1212);


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1212, true);


--
-- TOC entry 2322 (class 0 OID 25307)
-- Dependencies: 215
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4055, true);


--
-- TOC entry 2324 (class 0 OID 25312)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (90, 995, 'comment content 1', '2016-05-13 01:29:47.540775', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (91, 996, 'comment content 1', '2016-05-13 01:36:12.630132', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (92, 997, 'comment content 1', '2016-05-13 01:38:05.686252', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (93, 998, 'comment content 1', '2016-05-13 01:39:58.877521', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (94, 999, 'comment content 1', '2016-05-13 01:43:54.171787', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (95, 1000, 'comment content 1', '2016-05-13 01:46:13.656001', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (96, 1001, 'comment content 1', '2016-05-13 02:10:01.514615', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (97, 1002, 'comment content 1', '2016-05-13 02:10:10.457353', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (98, 1003, 'comment content 1', '2016-05-13 02:12:14.66847', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (99, 1003, 'comment content 1', '2016-05-13 02:12:14.673764', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (100, 1003, 'comment content 1', '2016-05-13 02:12:14.677945', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (101, 1003, 'comment content 1', '2016-05-13 02:12:14.682241', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (102, 1003, 'comment content 1', '2016-05-13 02:12:14.686478', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (103, 1003, 'comment content 1', '2016-05-13 02:12:14.69014', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (104, 1003, 'comment content 1', '2016-05-13 02:12:14.69407', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (105, 1003, 'comment content 1', '2016-05-13 02:12:14.697421', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (106, 1003, 'comment content 1', '2016-05-13 02:12:14.70109', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (107, 1003, 'comment content 1', '2016-05-13 02:12:14.704812', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (108, 1004, 'comment content 1', '2016-05-13 02:12:40.457431', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (109, 1004, 'comment content 1', '2016-05-13 02:12:40.462315', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (110, 1004, 'comment content 1', '2016-05-13 02:12:40.466256', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (111, 1004, 'comment content 1', '2016-05-13 02:12:40.471296', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (112, 1004, 'comment content 1', '2016-05-13 02:12:40.478857', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (113, 1004, 'comment content 1', '2016-05-13 02:12:40.48223', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (114, 1004, 'comment content 1', '2016-05-13 02:12:40.487781', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (115, 1004, 'comment content 1', '2016-05-13 02:12:40.49361', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (116, 1004, 'comment content 1', '2016-05-13 02:12:40.500004', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (117, 1004, 'comment content 1', '2016-05-13 02:12:40.504207', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (118, 1005, 'comment content 1', '2016-05-13 02:12:48.137344', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (119, 1005, 'comment content 1', '2016-05-13 02:12:48.171362', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (120, 1005, 'comment content 1', '2016-05-13 02:12:48.195466', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (121, 1005, 'comment content 1', '2016-05-13 02:12:48.221134', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (122, 1005, 'comment content 1', '2016-05-13 02:12:48.231238', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (123, 1005, 'comment content 1', '2016-05-13 02:12:48.237197', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (124, 1005, 'comment content 1', '2016-05-13 02:12:48.269696', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (125, 1005, 'comment content 1', '2016-05-13 02:12:48.309566', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (126, 1005, 'comment content 1', '2016-05-13 02:12:48.359135', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (127, 1005, 'comment content 1', '2016-05-13 02:12:48.364115', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (128, 1006, 'comment content 1', '2016-05-13 02:12:56.84127', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (129, 1006, 'comment content 1', '2016-05-13 02:12:56.850099', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (130, 1006, 'comment content 1', '2016-05-13 02:12:56.854839', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (131, 1006, 'comment content 1', '2016-05-13 02:12:56.859155', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (132, 1006, 'comment content 1', '2016-05-13 02:12:56.863715', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (133, 1006, 'comment content 1', '2016-05-13 02:12:56.86864', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (134, 1006, 'comment content 1', '2016-05-13 02:12:56.873363', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (135, 1006, 'comment content 1', '2016-05-13 02:12:56.877857', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (136, 1006, 'comment content 1', '2016-05-13 02:12:56.881802', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (137, 1006, 'comment content 1', '2016-05-13 02:12:56.885508', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (138, 1007, 'comment content 1', '2016-05-13 02:13:03.28163', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (139, 1007, 'comment content 1', '2016-05-13 02:13:03.28721', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (140, 1007, 'comment content 1', '2016-05-13 02:13:03.291435', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (141, 1007, 'comment content 1', '2016-05-13 02:13:03.295404', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (142, 1007, 'comment content 1', '2016-05-13 02:13:03.299302', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (143, 1007, 'comment content 1', '2016-05-13 02:13:03.302972', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (144, 1007, 'comment content 1', '2016-05-13 02:13:03.306867', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (145, 1007, 'comment content 1', '2016-05-13 02:13:03.310427', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (146, 1007, 'comment content 1', '2016-05-13 02:13:03.314647', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (147, 1007, 'comment content 1', '2016-05-13 02:13:03.318456', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (148, 1008, 'comment content 1', '2016-05-13 02:13:10.124261', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (149, 1008, 'comment content 1', '2016-05-13 02:13:10.136084', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (150, 1008, 'comment content 1', '2016-05-13 02:13:10.139483', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (151, 1008, 'comment content 1', '2016-05-13 02:13:10.142767', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (152, 1008, 'comment content 1', '2016-05-13 02:13:10.145884', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (153, 1008, 'comment content 1', '2016-05-13 02:13:10.148679', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (154, 1008, 'comment content 1', '2016-05-13 02:13:10.151704', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (155, 1008, 'comment content 1', '2016-05-13 02:13:10.155512', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (156, 1008, 'comment content 1', '2016-05-13 02:13:10.159167', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (157, 1008, 'comment content 1', '2016-05-13 02:13:10.162684', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (158, 1009, 'comment content 1', '2016-05-13 02:13:34.195054', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (159, 1009, 'comment content 1', '2016-05-13 02:13:34.199873', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (160, 1009, 'comment content 1', '2016-05-13 02:13:34.203922', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (161, 1009, 'comment content 1', '2016-05-13 02:13:34.208182', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (162, 1009, 'comment content 1', '2016-05-13 02:13:34.212647', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (163, 1009, 'comment content 1', '2016-05-13 02:13:34.216707', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (164, 1009, 'comment content 1', '2016-05-13 02:13:34.221384', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (165, 1009, 'comment content 1', '2016-05-13 02:13:34.225385', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (166, 1009, 'comment content 1', '2016-05-13 02:13:34.229305', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (167, 1009, 'comment content 1', '2016-05-13 02:13:34.233135', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (169, 1011, 'new comment content', '2016-05-13 02:13:34.715', 2, 234);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (170, 1012, 'comment content 1', '2016-05-13 02:13:58.400981', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (171, 1012, 'comment content 1', '2016-05-13 02:13:58.404352', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (172, 1012, 'comment content 1', '2016-05-13 02:13:58.407369', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (173, 1012, 'comment content 1', '2016-05-13 02:13:58.409726', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (174, 1012, 'comment content 1', '2016-05-13 02:13:58.411842', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (175, 1012, 'comment content 1', '2016-05-13 02:13:58.414228', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (176, 1012, 'comment content 1', '2016-05-13 02:13:58.41722', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (177, 1012, 'comment content 1', '2016-05-13 02:13:58.418896', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (178, 1012, 'comment content 1', '2016-05-13 02:13:58.42065', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (179, 1012, 'comment content 1', '2016-05-13 02:13:58.4229', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (181, 1014, 'new comment content', '2016-05-13 02:13:58.489', 2, 234);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (182, 1015, 'comment content 1', '2016-05-13 02:14:53.420614', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (183, 1015, 'comment content 1', '2016-05-13 02:14:53.424778', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (184, 1015, 'comment content 1', '2016-05-13 02:14:53.430253', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (185, 1015, 'comment content 1', '2016-05-13 02:14:53.434101', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (186, 1015, 'comment content 1', '2016-05-13 02:14:53.438743', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (187, 1015, 'comment content 1', '2016-05-13 02:14:53.442134', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (188, 1015, 'comment content 1', '2016-05-13 02:14:53.44684', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (189, 1015, 'comment content 1', '2016-05-13 02:14:53.451815', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (190, 1015, 'comment content 1', '2016-05-13 02:14:53.457111', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (191, 1015, 'comment content 1', '2016-05-13 02:14:53.464623', 1, 1);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (193, 1017, 'new comment content', '2016-05-13 02:14:53.847', 2, 234);


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 193, true);


--
-- TOC entry 2326 (class 0 OID 25318)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO contact (id, phone, address) VALUES (889, 'new phone phone 1463035412637', 'new test Grodno 1463035412637');


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 889, true);


--
-- TOC entry 2328 (class 0 OID 25323)
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
-- TOC entry 2330 (class 0 OID 25328)
-- Dependencies: 223
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2331 (class 0 OID 25334)
-- Dependencies: 224
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 225
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2333 (class 0 OID 25339)
-- Dependencies: 226
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2334 (class 0 OID 25342)
-- Dependencies: 227
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 230
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2338 (class 0 OID 25351)
-- Dependencies: 231
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
INSERT INTO user_credentials (id, email, password) VALUES (995, '1463092187145test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (996, '1463092572299test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (997, '1463092684394test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (998, '1463092798565test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (999, '1463093033898test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1000, '1463093173403test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1001, '1463094601246test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1002, '1463094610226test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1003, '1463094734315test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1004, '1463094760186test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1005, '1463094767275test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1006, '1463094776589test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1007, '1463094782971test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1008, '1463094789888test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1009, '1463094813924test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1010, '1463094814660test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1011, '1463094814709test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1012, '1463094838385test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1013, '1463094838466test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1014, '1463094838485test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1015, '1463094893165test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1016, '1463094893789test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1017, '1463094893841test@gmail.com', 'pass');


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1017, true);


--
-- TOC entry 2340 (class 0 OID 25356)
-- Dependencies: 233
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1017, 'Ivan', 'Ivanov', '2016-05-13 02:14:53.843667', 2, 0, '1463094893841', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (995, 'Ivan', 'Ivanov', '2016-05-13 01:29:47.37511', 2, 0, '1463092187145', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (996, 'Ivan', 'Ivanov', '2016-05-13 01:36:12.542968', 2, 0, '1463092572298', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (997, 'Ivan', 'Ivanov', '2016-05-13 01:38:04.582721', 2, 0, '1463092684394', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (998, 'Ivan', 'Ivanov', '2016-05-13 01:39:58.777637', 2, 0, '1463092798564', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (999, 'Ivan', 'Ivanov', '2016-05-13 01:43:54.081291', 2, 0, '1463093033898', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1000, 'Ivan', 'Ivanov', '2016-05-13 01:46:13.607978', 2, 0, '1463093173403', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1001, 'Ivan', 'Ivanov', '2016-05-13 02:10:01.395631', 2, 0, '1463094601246', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1002, 'Ivan', 'Ivanov', '2016-05-13 02:10:10.3833', 2, 0, '1463094610226', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1003, 'Ivan', 'Ivanov', '2016-05-13 02:12:14.54705', 2, 0, '1463094734315', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1004, 'Ivan', 'Ivanov', '2016-05-13 02:12:40.389777', 2, 0, '1463094760186', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1005, 'Ivan', 'Ivanov', '2016-05-13 02:12:47.516506', 2, 0, '1463094767275', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1006, 'Ivan', 'Ivanov', '2016-05-13 02:12:56.777234', 2, 0, '1463094776589', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1007, 'Ivan', 'Ivanov', '2016-05-13 02:13:03.161129', 2, 0, '1463094782971', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1008, 'Ivan', 'Ivanov', '2016-05-13 02:13:10.073148', 2, 0, '1463094789888', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1009, 'Ivan', 'Ivanov', '2016-05-13 02:13:34.141387', 2, 0, '1463094813924', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1010, 'Ivan', 'Ivanov', '2016-05-13 02:13:34.662552', 2, 0, '1463094814660', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1011, 'Ivan', 'Ivanov', '2016-05-13 02:13:34.71194', 2, 0, '1463094814709', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1012, 'Ivan', 'Ivanov', '2016-05-13 02:13:58.389563', 2, 0, '1463094838385', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1013, 'Ivan', 'Ivanov', '2016-05-13 02:13:58.468138', 2, 0, '1463094838466', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1014, 'Ivan', 'Ivanov', '2016-05-13 02:13:58.486192', 2, 0, '1463094838485', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1015, 'Ivan', 'Ivanov', '2016-05-13 02:14:53.308039', 2, 0, '1463094893165', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1016, 'Ivan', 'Ivanov', '2016-05-13 02:14:53.791407', 2, 0, '1463094893789', 'Grodno, ul.Gorkogo, 89');


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 234
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2142 (class 2606 OID 25376)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2144 (class 2606 OID 25378)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2146 (class 2606 OID 25380)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 25382)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2154 (class 2606 OID 25386)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2148 (class 2606 OID 25388)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2150 (class 2606 OID 25390)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 25392)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2159 (class 2606 OID 25394)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 25396)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2163 (class 2606 OID 25398)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 25400)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 25402)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile);


--
-- TOC entry 2167 (class 2606 OID 25404)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 25406)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2171 (class 2606 OID 25408)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 25410)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2177 (class 2606 OID 25412)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2179 (class 2606 OID 25414)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 25416)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2183 (class 2606 OID 25418)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2155 (class 1259 OID 25419)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2184 (class 2606 OID 25420)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2186 (class 2606 OID 25425)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2187 (class 2606 OID 25430)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2188 (class 2606 OID 25435)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2189 (class 2606 OID 25440)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2185 (class 2606 OID 25445)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2190 (class 2606 OID 25450)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2191 (class 2606 OID 25455)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2192 (class 2606 OID 25460)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2193 (class 2606 OID 25465)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2194 (class 2606 OID 25470)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile) REFERENCES user_profile(id);


--
-- TOC entry 2198 (class 2606 OID 25475)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2199 (class 2606 OID 25480)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2195 (class 2606 OID 25485)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2196 (class 2606 OID 25490)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2197 (class 2606 OID 25495)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2200 (class 2606 OID 25500)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-05-13 02:16:02

--
-- PostgreSQL database dump complete
--

