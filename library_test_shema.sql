--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-23 09:58:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 18 (class 2615 OID 58605)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 219 (class 1259 OID 58606)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 220 (class 1259 OID 58609)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 58612)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 221
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 222 (class 1259 OID 58614)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 223 (class 1259 OID 58616)
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
-- TOC entry 224 (class 1259 OID 58620)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 58623)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 58626)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 227 (class 1259 OID 58629)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 227
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 228 (class 1259 OID 58631)
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
-- TOC entry 229 (class 1259 OID 58635)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 229
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 230 (class 1259 OID 58637)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 58640)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 231
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 232 (class 1259 OID 58642)
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
-- TOC entry 233 (class 1259 OID 58648)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 58651)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 234
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 235 (class 1259 OID 58653)
-- Name: issue; Type: TABLE; Schema: test; Owner: -
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
-- TOC entry 236 (class 1259 OID 58656)
-- Name: issuing_journal_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE issuing_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 236
-- Name: issuing_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE issuing_journal_id_seq OWNED BY issue.id;


--
-- TOC entry 237 (class 1259 OID 58658)
-- Name: order; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone,
    date_reserve timestamp without time zone NOT NULL,
    date_return timestamp with time zone NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 58661)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 58664)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 239
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 240 (class 1259 OID 58666)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 240
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 241 (class 1259 OID 58668)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 241
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 242 (class 1259 OID 58670)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 58673)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 244 (class 1259 OID 58675)
-- Name: user_profile; Type: TABLE; Schema: test; Owner: -
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
-- TOC entry 245 (class 1259 OID 58682)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 245
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2143 (class 2604 OID 58684)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 58685)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 58686)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 58687)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 58688)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 58689)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY issue ALTER COLUMN id SET DEFAULT nextval('issuing_journal_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 58690)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 58691)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 58692)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 58693)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2332 (class 0 OID 58606)
-- Dependencies: 219
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2333 (class 0 OID 58609)
-- Dependencies: 220
-- Data for Name: author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO author (id, first_name, second_name) VALUES (201, 'Алексей', 'Пришвин');
INSERT INTO author (id, first_name, second_name) VALUES (205, 'new first name', 'new second name 1463084859531');
INSERT INTO author (id, first_name, second_name) VALUES (318, 'Anton', 'Chehov 1464541950671');
INSERT INTO author (id, first_name, second_name) VALUES (319, 'Anton', 'Chehov 1464541951063');
INSERT INTO author (id, first_name, second_name) VALUES (320, 'Anton', 'Chehov 1464541951068');
INSERT INTO author (id, first_name, second_name) VALUES (321, 'new first name', 'new second name 1464541951259');
INSERT INTO author (id, first_name, second_name) VALUES (322, 'asasasas', 'dsads');
INSERT INTO author (id, first_name, second_name) VALUES (326, 'лев', 'толстой');
INSERT INTO author (id, first_name, second_name) VALUES (327, 'яков', 'файн');
INSERT INTO author (id, first_name, second_name) VALUES (328, 'конан', 'дойл');
INSERT INTO author (id, first_name, second_name) VALUES (329, 'федор', 'достоевский');
INSERT INTO author (id, first_name, second_name) VALUES (195, 'Anton', 'Chehov');
INSERT INTO author (id, first_name, second_name) VALUES (198, 'aName', 'Chehov');
INSERT INTO author (id, first_name, second_name) VALUES (330, 'михаил', 'шолохов');
INSERT INTO author (id, first_name, second_name) VALUES (331, 'Михайло', 'Ломоносов');
INSERT INTO author (id, first_name, second_name) VALUES (197, 'Antoio', 'Banderas');
INSERT INTO author (id, first_name, second_name) VALUES (196, 'Anton', 'Chehoff');
INSERT INTO author (id, first_name, second_name) VALUES (332, 'Anton', 'Chehov 1466582565027');
INSERT INTO author (id, first_name, second_name) VALUES (333, 'Anton', 'Chehov 1466582565036');
INSERT INTO author (id, first_name, second_name) VALUES (334, 'Anton', 'Chehov 1466582565232');
INSERT INTO author (id, first_name, second_name) VALUES (335, 'Anton', 'Chehov 1466582565302');
INSERT INTO author (id, first_name, second_name) VALUES (337, 'new first name', 'new second name 1466582565349');
INSERT INTO author (id, first_name, second_name) VALUES (338, 'Anton', 'Chehov 1466582675410');
INSERT INTO author (id, first_name, second_name) VALUES (339, 'new first name', 'new second name 1466582697404');
INSERT INTO author (id, first_name, second_name) VALUES (341, 'Anton', 'Chehov 1466582739410');
INSERT INTO author (id, first_name, second_name) VALUES (342, 'Anton', 'Chehov 1466582739954');
INSERT INTO author (id, first_name, second_name) VALUES (343, 'Anton', 'Chehov 1466582740549');
INSERT INTO author (id, first_name, second_name) VALUES (344, 'Anton', 'Chehov 1466582791837');
INSERT INTO author (id, first_name, second_name) VALUES (345, 'Anton', 'Chehov 1466582792094');
INSERT INTO author (id, first_name, second_name) VALUES (346, 'Anton', 'Chehov 1466582792528');
INSERT INTO author (id, first_name, second_name) VALUES (347, 'Anton', 'Chehov 1466582792611');
INSERT INTO author (id, first_name, second_name) VALUES (349, 'new first name', 'new second name 1466582792753');
INSERT INTO author (id, first_name, second_name) VALUES (350, 'Anton', 'Chehov 1466585024200');
INSERT INTO author (id, first_name, second_name) VALUES (351, 'Anton', 'Chehov 1466585024634');
INSERT INTO author (id, first_name, second_name) VALUES (352, 'Anton', 'Chehov 1466585025494');
INSERT INTO author (id, first_name, second_name) VALUES (353, 'Anton', 'Chehov 1466585025652');
INSERT INTO author (id, first_name, second_name) VALUES (355, 'new first name', 'new second name 1466585025771');
INSERT INTO author (id, first_name, second_name) VALUES (356, 'Anton', 'Chehov 1466592308071');
INSERT INTO author (id, first_name, second_name) VALUES (357, 'Anton', 'Chehov 1466592436562');
INSERT INTO author (id, first_name, second_name) VALUES (358, 'Anton', 'Chehov 1466595482405');
INSERT INTO author (id, first_name, second_name) VALUES (359, 'Anton', 'Chehov 1466595482769');
INSERT INTO author (id, first_name, second_name) VALUES (360, 'Anton', 'Chehov 1466595483462');
INSERT INTO author (id, first_name, second_name) VALUES (361, 'Anton', 'Chehov 1466595483554');
INSERT INTO author (id, first_name, second_name) VALUES (363, 'new first name', 'new second name 1466595483719');
INSERT INTO author (id, first_name, second_name) VALUES (364, 'Anton', 'Chehov 1466595583272');
INSERT INTO author (id, first_name, second_name) VALUES (365, 'Anton', 'Chehov 1466595583604');
INSERT INTO author (id, first_name, second_name) VALUES (366, 'Anton', 'Chehov 1466595584455');
INSERT INTO author (id, first_name, second_name) VALUES (367, 'Anton', 'Chehov 1466595584551');
INSERT INTO author (id, first_name, second_name) VALUES (369, 'new first name', 'new second name 1466595584675');
INSERT INTO author (id, first_name, second_name) VALUES (370, 'Anton', 'Chehov 1466595671614');
INSERT INTO author (id, first_name, second_name) VALUES (371, 'Anton', 'Chehov 1466595671977');
INSERT INTO author (id, first_name, second_name) VALUES (372, 'Anton', 'Chehov 1466595672653');
INSERT INTO author (id, first_name, second_name) VALUES (373, 'Anton', 'Chehov 1466595673019');
INSERT INTO author (id, first_name, second_name) VALUES (375, 'new first name', 'new second name 1466595673232');


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 221
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 375, true);


--
-- TOC entry 2336 (class 0 OID 58616)
-- Dependencies: 223
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1764, 4520, 'sdsdsd', 434, '2016-06-10 00:00:00', 'wewe', NULL);
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1768, NULL, 'Mumu', 234, '2016-06-22 11:02:42.841', 'Manning', '0.9483857726117393');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1769, NULL, 'Mumu', 234, '2016-06-22 11:02:44.267', 'Manning', '0.5035189395438393');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1770, 4525, 'Mumu', 234, '2016-06-22 11:02:44.392', 'Manning', '0.3624489856061853');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1771, 4525, 'Mumu', 234, '2016-06-22 11:02:44.412', 'Manning', '0.7210440766040498');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1772, 4525, 'Mumu', 234, '2016-06-22 11:02:44.418', 'Manning', '0.9911665658823094');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1773, 4525, 'Mumu', 234, '2016-06-22 11:02:44.423', 'Manning', '0.2622987329676223');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1774, 4525, 'Mumu', 234, '2016-06-22 11:02:44.427', 'Manning', '0.46174579984357467');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1775, NULL, 'Mumu', 234, '2016-06-22 11:02:44.523', 'Manning', '0.894543978903896');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1776, NULL, 'Mumu', 234, '2016-06-22 11:02:44.7', 'Manning', '0.9426100800187782');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1778, NULL, 'Mumu', 234, '2016-06-22 11:02:45.046', 'Manning', '0.9042974987579347');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1780, NULL, 'Mumu', 234, '2016-06-22 11:02:46.15', 'Manning', '0.2488437890156957');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1781, NULL, 'Mumu', 234, '2016-06-22 11:02:46.247', 'Manning', '0.41714535479534554');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1782, NULL, 'Mumu', 234, '2016-06-22 11:02:46.271', 'Manning', '0.4797710588961652');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1783, NULL, 'Mumu', 234, '2016-06-22 11:02:47.045', 'Manning', '0.66743121501379');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1784, NULL, 'Mumu', 234, '2016-06-22 11:02:47.469', 'Manning', '0.2891396345982823');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1785, NULL, 'Mumu', 234, '2016-06-22 11:02:47.684', 'Manning', '0.9361842158603477');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1786, NULL, 'Mumu', 234, '2016-06-22 11:02:47.713', 'Manning', '0.320980877458548');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1787, NULL, 'Mumu', 234, '2016-06-22 11:02:47.737', 'Manning', '0.0800212365284062');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1788, NULL, 'Mumu', 234, '2016-06-22 11:02:47.774', 'Manning', '0.5851403734117506');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1789, NULL, 'Mumu', 234, '2016-06-22 11:05:39.976', 'Manning', '0.21023115109478396');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1790, NULL, 'Mumu', 234, '2016-06-22 11:06:32.099', 'Manning', '0.5999987769839483');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1791, NULL, 'Mumu', 234, '2016-06-22 11:43:44.726', 'Manning', '0.1288990244170466');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1792, NULL, 'Mumu', 234, '2016-06-22 14:38:02.802', 'Manning', '0.8052254293196401');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1793, NULL, 'Mumu', 234, '2016-06-22 14:39:43.628', 'Manning', '0.08617884126304842');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1794, NULL, 'Mumu', 234, '2016-06-22 14:41:11.985', 'Manning', '0.10062678929426538');


--
-- TOC entry 2337 (class 0 OID 58620)
-- Dependencies: 224
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_author (book_id, author_id) VALUES (1764, 319);
INSERT INTO book_2_author (book_id, author_id) VALUES (1764, 198);
INSERT INTO book_2_author (book_id, author_id) VALUES (1778, 333);
INSERT INTO book_2_author (book_id, author_id) VALUES (1778, 332);
INSERT INTO book_2_author (book_id, author_id) VALUES (1778, 334);
INSERT INTO book_2_author (book_id, author_id) VALUES (1789, 341);
INSERT INTO book_2_author (book_id, author_id) VALUES (1789, 342);
INSERT INTO book_2_author (book_id, author_id) VALUES (1789, 343);
INSERT INTO book_2_author (book_id, author_id) VALUES (1790, 345);
INSERT INTO book_2_author (book_id, author_id) VALUES (1790, 344);
INSERT INTO book_2_author (book_id, author_id) VALUES (1790, 346);
INSERT INTO book_2_author (book_id, author_id) VALUES (1791, 350);
INSERT INTO book_2_author (book_id, author_id) VALUES (1791, 351);
INSERT INTO book_2_author (book_id, author_id) VALUES (1791, 352);
INSERT INTO book_2_author (book_id, author_id) VALUES (1792, 358);
INSERT INTO book_2_author (book_id, author_id) VALUES (1792, 359);
INSERT INTO book_2_author (book_id, author_id) VALUES (1792, 360);
INSERT INTO book_2_author (book_id, author_id) VALUES (1793, 365);
INSERT INTO book_2_author (book_id, author_id) VALUES (1793, 364);
INSERT INTO book_2_author (book_id, author_id) VALUES (1793, 366);
INSERT INTO book_2_author (book_id, author_id) VALUES (1794, 371);
INSERT INTO book_2_author (book_id, author_id) VALUES (1794, 370);
INSERT INTO book_2_author (book_id, author_id) VALUES (1794, 372);


--
-- TOC entry 2338 (class 0 OID 58623)
-- Dependencies: 225
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 222
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1794, true);


--
-- TOC entry 2339 (class 0 OID 58626)
-- Dependencies: 226
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
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
INSERT INTO catalog (id, title, parent_id) VALUES (4525, 'root1466582564386', NULL);


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 227
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4548, true);


--
-- TOC entry 2341 (class 0 OID 58631)
-- Dependencies: 228
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 229
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 659, true);


--
-- TOC entry 2343 (class 0 OID 58637)
-- Dependencies: 230
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO copy_book (id, book_id, department_id) VALUES (367, 1764, 154);
INSERT INTO copy_book (id, book_id, department_id) VALUES (369, 1764, 154);
INSERT INTO copy_book (id, book_id, department_id) VALUES (370, 1764, 152);
INSERT INTO copy_book (id, book_id, department_id) VALUES (371, 1764, 158);
INSERT INTO copy_book (id, book_id, department_id) VALUES (373, 1758, 151);
INSERT INTO copy_book (id, book_id, department_id) VALUES (374, 1763, 151);
INSERT INTO copy_book (id, book_id, department_id) VALUES (375, 1763, 150);
INSERT INTO copy_book (id, book_id, department_id) VALUES (378, 1762, 150);
INSERT INTO copy_book (id, book_id, department_id) VALUES (379, 1762, 151);
INSERT INTO copy_book (id, book_id, department_id) VALUES (380, 1762, 151);
INSERT INTO copy_book (id, book_id, department_id) VALUES (381, 1762, 151);
INSERT INTO copy_book (id, book_id, department_id) VALUES (382, 1780, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (383, 1780, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (384, 1780, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (385, 1780, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (386, 1780, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (387, 1781, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (389, 1784, 273);
INSERT INTO copy_book (id, book_id, department_id) VALUES (390, 1785, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (391, 1786, 275);
INSERT INTO copy_book (id, book_id, department_id) VALUES (392, 1787, 276);
INSERT INTO copy_book (id, book_id, department_id) VALUES (393, 1788, 277);


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 231
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 393, true);


--
-- TOC entry 2345 (class 0 OID 58642)
-- Dependencies: 232
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
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
INSERT INTO department (id, name, type, phone, address) VALUES (266, 'department name', 0, 'phone 1466582565925', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (267, 'department name', 0, 'phone 1466582566004', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (268, 'department name', 0, 'phone 1466582566096', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (269, 'new name', 1, '23451466582566132', 'grodno 1466582566132');
INSERT INTO department (id, name, type, phone, address) VALUES (270, 'department name', 0, 'phone 1466582566153', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (271, 'department name', 0, 'phone 1466582566250', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (272, 'department name', 0, 'phone 1466582566276', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (273, 'department name', 0, 'phone 1466582567475', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (274, 'department name', 0, 'phone 1466582567687', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (275, 'department name', 0, 'phone 1466582567716', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (276, 'department name', 0, 'phone 1466582567741', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (277, 'department name', 0, 'phone 1466582567777', 'Grodno, ul. departmentStreet');


--
-- TOC entry 2346 (class 0 OID 58648)
-- Dependencies: 233
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 234
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 277, true);


--
-- TOC entry 2348 (class 0 OID 58653)
-- Dependencies: 235
-- Data for Name: issue; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO issue (id, reader_id, copy_book_id, date_take, planned_date_return, date_return) VALUES (2, 1325, 367, '2016-06-15 02:06:07.607', '2016-06-15 02:06:07.607', NULL);
INSERT INTO issue (id, reader_id, copy_book_id, date_take, planned_date_return, date_return) VALUES (3, 1325, 369, '2016-06-15 02:06:24.405', '2016-06-15 02:06:24.405', NULL);


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 236
-- Name: issuing_journal_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('issuing_journal_id_seq', 3, true);


--
-- TOC entry 2350 (class 0 OID 58658)
-- Dependencies: 237
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2351 (class 0 OID 58661)
-- Dependencies: 238
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 239
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 240
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 241
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 268, true);


--
-- TOC entry 2355 (class 0 OID 58670)
-- Dependencies: 242
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (1357, 'test@gmail.com', 'test');
INSERT INTO user_credentials (id, email, password) VALUES (1325, 'admin@test.by', 'admin');
INSERT INTO user_credentials (id, email, password) VALUES (1362, 'librarian', 'librarian');
INSERT INTO user_credentials (id, email, password) VALUES (1367, '1466582566899test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1368, '1466582566991test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1369, '1466582567464test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1370, '1466582567495test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1371, '1466582567572test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1372, '1466582567632test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1373, '1466582567676test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1374, '1466582567680test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1375, '1466582567703test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1376, '1466582567709test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1377, '1466582567729test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1378, '1466582567749test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1379, '1466582567770test@gmail.com', 'pass');


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1379, true);


--
-- TOC entry 2357 (class 0 OID 58675)
-- Dependencies: 244
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1357, 'tets', 'erer', '2016-06-08 11:33:59.879726', 0, 0, 'ererer', 'erere');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1325, 'OtherFirstName', 'OtherLastName', '2016-05-15 23:44:29.131999', 0, 0, '(095)-1234-54321', 'Grodno, ul.NewStreet');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1362, 'librarian', 'librarian', '2016-06-08 14:08:22.305296', 0, 1, '123123123', 'Grodno, Gorkogo street');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1367, 'Ivan', 'Ivanov', '2016-06-22 11:02:46.901354', 2, 0, '1466582566899', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1368, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.014715', 2, 0, '1466582566991', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1369, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.466155', 2, 0, '1466582567464', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1370, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.499261', 2, 0, '1466582567495', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1371, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.574501', 2, 0, '1466582567572', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1372, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.63369', 2, 0, '1466582567632', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1373, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.67783', 2, 2, '1466582567676', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1374, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.681843', 2, 1, '1466582567680', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1375, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.70592', 2, 2, '1466582567703', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1376, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.710936', 2, 1, '1466582567709', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1377, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.732003', 2, 2, '1466582567729', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1378, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.755077', 2, 1, '1466582567749', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1379, 'Ivan', 'Ivanov', '2016-06-22 11:02:47.771128', 2, 2, '1466582567770', 'Grodno, ul.Gorkogo, 89');


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 245
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2157 (class 2606 OID 58695)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2159 (class 2606 OID 58697)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2161 (class 2606 OID 58699)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 58701)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2169 (class 2606 OID 58703)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2163 (class 2606 OID 58705)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2165 (class 2606 OID 58707)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 58709)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 58711)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 58713)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 58715)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);


--
-- TOC entry 2178 (class 2606 OID 58717)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 58719)
-- Name: department_type_phone_address_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);


--
-- TOC entry 2184 (class 2606 OID 58721)
-- Name: issuing_journal_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_pkey PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 58723)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2186 (class 2606 OID 58725)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 58727)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2192 (class 2606 OID 58729)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2194 (class 2606 OID 58731)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 58733)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2198 (class 2606 OID 58735)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2170 (class 1259 OID 58736)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2199 (class 2606 OID 58737)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2201 (class 2606 OID 58742)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2202 (class 2606 OID 58747)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2203 (class 2606 OID 58752)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2204 (class 2606 OID 58757)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2200 (class 2606 OID 58762)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2205 (class 2606 OID 58767)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2206 (class 2606 OID 58772)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2207 (class 2606 OID 58777)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2208 (class 2606 OID 58782)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2209 (class 2606 OID 58787)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2210 (class 2606 OID 58792)
-- Name: issuing_journal_copy_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_copy_book_id_fkey FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2211 (class 2606 OID 58797)
-- Name: issuing_journal_reader_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2215 (class 2606 OID 58802)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2216 (class 2606 OID 58807)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2212 (class 2606 OID 58812)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2213 (class 2606 OID 58817)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2214 (class 2606 OID 58822)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2217 (class 2606 OID 58827)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-06-23 09:58:17

--
-- PostgreSQL database dump complete
--

