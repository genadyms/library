--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-10 17:38:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 28830)
-- Name: abonement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 193 (class 1259 OID 28833)
-- Name: author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 28836)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 194
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 195 (class 1259 OID 28838)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 196 (class 1259 OID 28840)
-- Name: book; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 197 (class 1259 OID 28844)
-- Name: book_2_author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 28847)
-- Name: book_2_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 28850)
-- Name: catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 200 (class 1259 OID 28853)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 200
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 201 (class 1259 OID 28855)
-- Name: comment; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 202 (class 1259 OID 28859)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 202
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 203 (class 1259 OID 28861)
-- Name: copy_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 28864)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 204
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 205 (class 1259 OID 28866)
-- Name: department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type integer NOT NULL,
    phone character varying NOT NULL,
    address character varying(250) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 28872)
-- Name: department_2_user_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 28875)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 207
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 243 (class 1259 OID 49930)
-- Name: issue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE issue (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    planned_date_return timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 242 (class 1259 OID 49928)
-- Name: issuing_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE issuing_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 242
-- Name: issuing_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE issuing_journal_id_seq OWNED BY issue.id;


--
-- TOC entry 208 (class 1259 OID 28877)
-- Name: order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone,
    reserved timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 28881)
-- Name: order_2_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 28884)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 210
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 211 (class 1259 OID 28886)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 211
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 212 (class 1259 OID 28888)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 212
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 213 (class 1259 OID 28890)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 28893)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 215 (class 1259 OID 28895)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    state integer NOT NULL,
    role integer NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(250) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 28902)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2138 (class 2604 OID 28904)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 28905)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 28906)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 28907)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 28908)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 49933)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY issue ALTER COLUMN id SET DEFAULT nextval('issuing_journal_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 28909)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 28910)
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 28911)
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 28912)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2327 (class 0 OID 28830)
-- Dependencies: 192
-- Data for Name: abonement; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2328 (class 0 OID 28833)
-- Dependencies: 193
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: -
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
INSERT INTO author (id, first_name, second_name) VALUES (294, 'Anton', 'Chehov 1463323246082');
INSERT INTO author (id, first_name, second_name) VALUES (295, 'Anton', 'Chehov 1463323247143');
INSERT INTO author (id, first_name, second_name) VALUES (297, 'new first name', 'new second name 1463323247250');
INSERT INTO author (id, first_name, second_name) VALUES (298, 'Anton', 'Chehov 1463323437843');
INSERT INTO author (id, first_name, second_name) VALUES (299, 'Anton', 'Chehov 1463323438397');
INSERT INTO author (id, first_name, second_name) VALUES (301, 'new first name', 'new second name 1463323438433');
INSERT INTO author (id, first_name, second_name) VALUES (302, 'Anton', 'Chehov 1463324823125');
INSERT INTO author (id, first_name, second_name) VALUES (303, 'Anton', 'Chehov 1463324824106');
INSERT INTO author (id, first_name, second_name) VALUES (305, 'new first name', 'new second name 1463324824253');
INSERT INTO author (id, first_name, second_name) VALUES (306, 'Anton', 'Chehov 1463328457169');
INSERT INTO author (id, first_name, second_name) VALUES (307, 'Anton', 'Chehov 1463328458553');
INSERT INTO author (id, first_name, second_name) VALUES (309, 'new first name', 'new second name 1463328458644');
INSERT INTO author (id, first_name, second_name) VALUES (310, 'Anton', 'Chehov 1463345092631');
INSERT INTO author (id, first_name, second_name) VALUES (311, 'Anton', 'Chehov 1463345093236');
INSERT INTO author (id, first_name, second_name) VALUES (313, 'new first name', 'new second name 1463345093279');
INSERT INTO author (id, first_name, second_name) VALUES (314, 'Anton', 'Chehov 1464205687632');
INSERT INTO author (id, first_name, second_name) VALUES (315, 'Anton', 'Chehov 1464205698412');
INSERT INTO author (id, first_name, second_name) VALUES (317, 'new first name', 'new second name 1464205699086');
INSERT INTO author (id, first_name, second_name) VALUES (318, 'Anton', 'Chehov 1464541950671');
INSERT INTO author (id, first_name, second_name) VALUES (319, 'Anton', 'Chehov 1464541951063');
INSERT INTO author (id, first_name, second_name) VALUES (320, 'Anton', 'Chehov 1464541951068');
INSERT INTO author (id, first_name, second_name) VALUES (321, 'new first name', 'new second name 1464541951259');


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 194
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 321, true);


--
-- TOC entry 2331 (class 0 OID 28840)
-- Dependencies: 196
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1757, 4518, 'Mumu', 234, '2015-09-10 00:00:00', 'Manning', '0.084984236520521');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1758, 4518, 'Mumu', 234, '2016-05-29 00:00:00', 'Manning', '0.4330072566451817');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1761, 4518, 'test test test', 234, '2016-05-03 00:00:00', 'office', '234567890');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1762, 4518, 'asas', 2, '2016-06-30 00:00:00', 'eww', 'sd');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1763, 4518, 're', 34, '2016-06-02 00:00:00', 're', 're');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1765, 4520, 'tre', 43, '2016-06-14 00:00:00', 'tre', 'tre');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1764, 4518, 'anton', 32, '2016-06-10 00:00:00', 'wewe', 'erw');


--
-- TOC entry 2332 (class 0 OID 28844)
-- Dependencies: 197
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO book_2_author (book_id, author_id) VALUES (1757, 196);
INSERT INTO book_2_author (book_id, author_id) VALUES (1758, 205);
INSERT INTO book_2_author (book_id, author_id) VALUES (1758, 318);
INSERT INTO book_2_author (book_id, author_id) VALUES (1761, 201);
INSERT INTO book_2_author (book_id, author_id) VALUES (1762, 196);
INSERT INTO book_2_author (book_id, author_id) VALUES (1762, 198);
INSERT INTO book_2_author (book_id, author_id) VALUES (1763, 196);
INSERT INTO book_2_author (book_id, author_id) VALUES (1765, 197);
INSERT INTO book_2_author (book_id, author_id) VALUES (1765, 201);
INSERT INTO book_2_author (book_id, author_id) VALUES (1764, 198);


--
-- TOC entry 2333 (class 0 OID 28847)
-- Dependencies: 198
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO book_2_comment (comment_id, book_id) VALUES (645, 1764);
INSERT INTO book_2_comment (comment_id, book_id) VALUES (646, 1764);


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 195
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1765, true);


--
-- TOC entry 2334 (class 0 OID 28850)
-- Dependencies: 199
-- Data for Name: catalog; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO catalog (id, title, parent_id) VALUES (4515, 'it', NULL);
INSERT INTO catalog (id, title, parent_id) VALUES (4516, 'technical', NULL);
INSERT INTO catalog (id, title, parent_id) VALUES (4517, 'medical', NULL);
INSERT INTO catalog (id, title, parent_id) VALUES (4518, 'java', 4515);
INSERT INTO catalog (id, title, parent_id) VALUES (4519, 'javascript', 4515);
INSERT INTO catalog (id, title, parent_id) VALUES (4520, 'css', 4515);
INSERT INTO catalog (id, title, parent_id) VALUES (4521, 'html', 4515);
INSERT INTO catalog (id, title, parent_id) VALUES (4522, 'electronics', 4516);
INSERT INTO catalog (id, title, parent_id) VALUES (4523, 'mechanics', 4516);
INSERT INTO catalog (id, title, parent_id) VALUES (4524, 'robots', 4516);


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 200
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4524, true);


--
-- TOC entry 2336 (class 0 OID 28855)
-- Dependencies: 201
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (645, 1357, 'i''m here', '2016-06-10 08:37:44.402', NULL, NULL);
INSERT INTO comment (id, user_profile_id, content, created, like_count, dislike_count) VALUES (646, 1357, 'hello', '2016-06-10 08:37:54.996', NULL, NULL);


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 202
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 646, true);


--
-- TOC entry 2338 (class 0 OID 28861)
-- Dependencies: 203
-- Data for Name: copy_book; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO copy_book (id, book_id, department_id) VALUES (361, 1758, 150);
INSERT INTO copy_book (id, book_id, department_id) VALUES (362, 1758, 150);
INSERT INTO copy_book (id, book_id, department_id) VALUES (363, 1761, 161);
INSERT INTO copy_book (id, book_id, department_id) VALUES (1761, 1761, 161);
INSERT INTO copy_book (id, book_id, department_id) VALUES (364, 1758, 150);
INSERT INTO copy_book (id, book_id, department_id) VALUES (365, 1758, 161);
INSERT INTO copy_book (id, book_id, department_id) VALUES (366, 1758, 160);
INSERT INTO copy_book (id, book_id, department_id) VALUES (367, 1764, 154);
INSERT INTO copy_book (id, book_id, department_id) VALUES (368, 1764, 159);
INSERT INTO copy_book (id, book_id, department_id) VALUES (369, 1764, 154);
INSERT INTO copy_book (id, book_id, department_id) VALUES (370, 1764, 152);
INSERT INTO copy_book (id, book_id, department_id) VALUES (371, 1764, 158);


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 204
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 371, true);


--
-- TOC entry 2340 (class 0 OID 28866)
-- Dependencies: 205
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: -
--

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
INSERT INTO department (id, name, type, phone, address) VALUES (168, 'department name', 0, 'phone 1463320514204', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (169, 'department name', 0, 'phone 1463323257864', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (170, 'department name', 0, 'phone 1463323258355', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (171, 'department name', 0, 'phone 1463323258402', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (172, 'department name', 0, 'phone 1463323258418', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (173, 'department name', 0, 'phone 1463323258449', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (176, 'new name', 1, '23451463323258655', 'grodno 1463323258655');
INSERT INTO department (id, name, type, phone, address) VALUES (177, 'department name', 0, 'phone 1463323258778', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (178, 'department name', 0, 'phone 1463323258862', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (179, 'department name', 0, 'phone 1463323445318', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (180, 'department name', 0, 'phone 1463323446362', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (181, 'department name', 0, 'phone 1463323446439', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (182, 'department name', 0, 'phone 1463323446515', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (183, 'department name', 0, 'phone 1463323446577', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (184, 'department name', 0, 'phone 1463323446593', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (186, 'new name', 1, '23451463323446725', 'grodno 1463323446725');
INSERT INTO department (id, name, type, phone, address) VALUES (187, 'department name', 0, 'phone 1463323446950', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (188, 'department name', 0, 'phone 1463323447174', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (189, 'department name', 0, 'phone 1463323447391', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (190, 'department name', 0, 'phone 1463328461788', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (191, 'department name', 0, 'phone 1463328462482', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (192, 'department name', 0, 'phone 1463328462526', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (193, 'department name', 0, 'phone 1463328462542', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (194, 'department name', 0, 'phone 1463328462557', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (195, 'department name', 0, 'phone 1463328462573', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (197, 'new name', 1, '23451463328462659', 'grodno 1463328462659');
INSERT INTO department (id, name, type, phone, address) VALUES (198, 'department name', 0, 'phone 1463328462690', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (199, 'department name', 0, 'phone 1463328462722', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (200, 'department name', 0, 'phone 1463328462753', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (201, 'department name', 0, 'phone 1463337833848', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (202, 'department name', 0, 'phone 1463337871956', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (203, 'department name', 0, 'phone 1463337872042', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (204, 'department name', 0, 'phone 1463337872504', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (205, 'department name', 0, 'phone 1463337872548', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (206, 'department name', 0, 'phone 1463337913035', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (207, 'department name', 0, 'phone 1463338019218', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (208, 'department name', 0, 'phone 1463338131722', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (209, 'department name', 0, 'phone 1463338202191', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (210, 'department name', 0, 'phone 1463338330171', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (211, 'department name', 0, 'phone 1463338346433', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (212, 'department name', 0, 'phone 1463338435983', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (213, 'department name', 0, 'phone 1463338436098', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (214, 'department name', 0, 'phone 1463338436404', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (215, 'department name', 0, 'phone 1463338436443', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (216, 'department name', 0, 'phone 1463338615149', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (217, 'department name', 0, 'phone 1463338615241', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (218, 'department name', 0, 'phone 1463338615569', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (219, 'department name', 0, 'phone 1463338615598', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (220, 'department name', 0, 'phone 1463338759037', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (221, 'department name', 0, 'phone 1463338759129', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (222, 'department name', 0, 'phone 1463338759485', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (223, 'department name', 0, 'phone 1463338759515', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (224, 'department name', 0, 'phone 1463338868578', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (225, 'department name', 0, 'phone 1463338868690', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (226, 'department name', 0, 'phone 1463338869060', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (227, 'department name', 0, 'phone 1463338869092', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (228, 'department name', 0, 'phone 1463339008138', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (229, 'department name', 0, 'phone 1463339008235', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (230, 'department name', 0, 'phone 1463339008563', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (231, 'department name', 0, 'phone 1463339008602', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (232, 'department name', 0, 'phone 1463339065499', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (233, 'department name', 0, 'phone 1463339120115', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (234, 'department name', 0, 'phone 1463339158254', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (235, 'department name', 0, 'phone 1463339224327', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (236, 'department name', 0, 'phone 1463339261470', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (237, 'department name', 0, 'phone 1463339327515', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (238, 'department name', 0, 'phone 1463345113128', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (239, 'department name', 0, 'phone 1463345123171', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (240, 'department name', 0, 'phone 1463345123431', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (241, 'department name', 0, 'phone 1463345123457', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (242, 'department name', 0, 'phone 1463345133292', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (243, 'department name', 0, 'phone 1463345133488', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (245, 'new name', 1, '23451463345133752', 'grodno 1463345133752');
INSERT INTO department (id, name, type, phone, address) VALUES (246, 'department name', 0, 'phone 1463345144526', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (247, 'department name', 0, 'phone 1463345144590', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (248, 'department name', 0, 'phone 1463345144839', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (249, 'department name', 0, 'phone 1463345144879', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (250, 'department name', 0, 'phone 1464205710934', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (251, 'department name', 0, 'phone 1464205711939', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (252, 'department name', 0, 'phone 1464205711984', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (253, 'department name', 0, 'phone 1464205712001', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (254, 'department name', 0, 'phone 1464205712030', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (255, 'department name', 0, 'phone 1464205712042', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (257, 'new name', 1, '23451464205712196', 'grodno 1464205712196');
INSERT INTO department (id, name, type, phone, address) VALUES (258, 'department name', 0, 'phone 1464205712232', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (259, 'department name', 0, 'phone 1464205712269', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (260, 'department name', 0, 'phone 1464205712379', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (261, 'department name', 0, 'phone 1464205712424', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (263, 'mgm', 0, '45678', 'budennogo');
INSERT INTO department (id, name, type, phone, address) VALUES (264, 'hello', 0, '34', '1');
INSERT INTO department (id, name, type, phone, address) VALUES (265, 'test', 0, '34', '23');
INSERT INTO department (id, name, type, phone, address) VALUES (144, 'department name', 1, 'phone 1463218460534', 'Grodno, ul. departmentStreet');


--
-- TOC entry 2341 (class 0 OID 28872)
-- Dependencies: 206
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 207
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 265, true);


--
-- TOC entry 2353 (class 0 OID 49930)
-- Dependencies: 243
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 242
-- Name: issuing_journal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('issuing_journal_id_seq', 1, false);


--
-- TOC entry 2343 (class 0 OID 28877)
-- Dependencies: 208
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed, reserved) VALUES (227, 1357, 371, '2016-06-10 15:44:01.49', NULL, NULL, '2016-06-10 17:18:37.946', NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed, reserved) VALUES (226, 1357, 367, '2016-06-10 15:43:24.418', NULL, '2016-06-01 00:00:00', '2016-06-10 17:06:38.432', '2016-06-01 00:00:00');


--
-- TOC entry 2344 (class 0 OID 28881)
-- Dependencies: 209
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 210
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 211
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 212
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 227, true);


--
-- TOC entry 2348 (class 0 OID 28890)
-- Dependencies: 213
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (1325, '1463345069130test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1357, 'test@gmail.com', 'test');
INSERT INTO user_credentials (id, email, password) VALUES (1361, 'emaol23', 'pass34');
INSERT INTO user_credentials (id, email, password) VALUES (1362, 'a', 'a');


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1362, true);


--
-- TOC entry 2350 (class 0 OID 28895)
-- Dependencies: 215
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1325, 'OtherFirstName', 'OtherLastName', '2016-05-15 23:44:29.131999', 0, 1, '(095)-1234-54321', 'Grodno, ul.NewStreet');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1357, 'tets', 'erer', '2016-06-08 11:33:59.879726', 0, 0, 'ererer', 'erere');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1362, 'a', 'a', '2016-06-08 14:08:22.305296', 0, 1, 'a', 'a');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1361, 'user1', 'user11', '2016-06-08 12:25:33.41865', 2, 2, 'phone', 'remove');


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2152 (class 2606 OID 28914)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2154 (class 2606 OID 28916)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2156 (class 2606 OID 28918)
-- Name: author_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 28920)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2164 (class 2606 OID 28922)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2158 (class 2606 OID 28924)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2160 (class 2606 OID 28926)
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 28928)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 28930)
-- Name: comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2171 (class 2606 OID 28932)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 28934)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);


--
-- TOC entry 2173 (class 2606 OID 28936)
-- Name: department_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 28938)
-- Name: department_type_phone_address_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);


--
-- TOC entry 2193 (class 2606 OID 49935)
-- Name: issuing_journal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_pkey PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 28940)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2179 (class 2606 OID 28942)
-- Name: order_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 28944)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2185 (class 2606 OID 28946)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2187 (class 2606 OID 28948)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2189 (class 2606 OID 28950)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2191 (class 2606 OID 28952)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2165 (class 1259 OID 28953)
-- Name: fki_book_fk1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2194 (class 2606 OID 28954)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2196 (class 2606 OID 28959)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2197 (class 2606 OID 28964)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2198 (class 2606 OID 28969)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2199 (class 2606 OID 28974)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2195 (class 2606 OID 28979)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2200 (class 2606 OID 28984)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2201 (class 2606 OID 28989)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2202 (class 2606 OID 28994)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2203 (class 2606 OID 28999)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2204 (class 2606 OID 29004)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2211 (class 2606 OID 49936)
-- Name: issuing_journal_copy_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_copy_book_id_fkey FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2212 (class 2606 OID 49941)
-- Name: issuing_journal_reader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2208 (class 2606 OID 29009)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2209 (class 2606 OID 29014)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2205 (class 2606 OID 29019)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2206 (class 2606 OID 29024)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2207 (class 2606 OID 29029)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2210 (class 2606 OID 29034)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-06-10 17:38:04

--
-- PostgreSQL database dump complete
--

