--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.12
-- Dumped by pg_dump version 9.3.12
-- Started on 2016-05-03 16:56:49 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 17287)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 17289)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 199 (class 1259 OID 17292)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17295)
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
-- TOC entry 201 (class 1259 OID 17297)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 202 (class 1259 OID 17299)
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
-- TOC entry 203 (class 1259 OID 17303)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17306)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 17309)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300)
);


--
-- TOC entry 206 (class 1259 OID 17315)
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
-- TOC entry 207 (class 1259 OID 17317)
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
-- TOC entry 208 (class 1259 OID 17321)
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
-- TOC entry 209 (class 1259 OID 17323)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 17326)
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
-- TOC entry 211 (class 1259 OID 17328)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 17331)
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
-- TOC entry 213 (class 1259 OID 17333)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 17336)
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
-- TOC entry 215 (class 1259 OID 17338)
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
-- TOC entry 216 (class 1259 OID 17341)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 17344)
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
-- TOC entry 218 (class 1259 OID 17346)
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
-- TOC entry 219 (class 1259 OID 17348)
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
-- TOC entry 220 (class 1259 OID 17350)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 17353)
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
-- TOC entry 222 (class 1259 OID 17355)
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
-- TOC entry 223 (class 1259 OID 17359)
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
-- TOC entry 2004 (class 2604 OID 17361)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 17362)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 17363)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 17364)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 17365)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 17366)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 17367)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 17368)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 17369)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 17370)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2180 (class 0 OID 17289)
-- Dependencies: 198
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2181 (class 0 OID 17292)
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
-- TOC entry 2184 (class 0 OID 17299)
-- Dependencies: 202
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


--
-- TOC entry 2185 (class 0 OID 17303)
-- Dependencies: 203
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2186 (class 0 OID 17306)
-- Dependencies: 204
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 201
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 324, true);


--
-- TOC entry 2187 (class 0 OID 17309)
-- Dependencies: 205
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (213, 'belorussian litrature 1462254669371', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (214, 'belorussian litrature 1462254672316', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (215, 'belorussian litrature 1462254672396', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (216, 'belorussian litrature 1462254672714', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (217, 'belorussian litrature 1462254672788', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (218, 'belorussian litrature 1462254672844', 'belorussian litrature 1462254672788');
INSERT INTO catalog (id, path, path_parent) VALUES (219, 'belorussian litrature 1462254673016', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (220, 'belorussian litrature 1462254673056', 'belorussian litrature 1462254673016');
INSERT INTO catalog (id, path, path_parent) VALUES (221, 'belorussian litrature 1462254673094', 'belorussian litrature 1462254673016');
INSERT INTO catalog (id, path, path_parent) VALUES (222, 'belorussian litrature 1462254759352', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (223, 'belorussian litrature 1462254760036', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (224, 'belorussian litrature 1462254760138', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (225, 'belorussian litrature 1462254760421', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (226, 'belorussian litrature 1462254760472', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (227, 'belorussian litrature 1462254760497', 'belorussian litrature 1462254760472');
INSERT INTO catalog (id, path, path_parent) VALUES (228, 'belorussian litrature 1462254760600', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (229, 'belorussian litrature 1462254760653', 'belorussian litrature 1462254760600');
INSERT INTO catalog (id, path, path_parent) VALUES (230, 'belorussian litrature 1462254760679', 'belorussian litrature 1462254760600');
INSERT INTO catalog (id, path, path_parent) VALUES (231, 'belorussian litrature 1462254857562', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (232, 'belorussian litrature 1462254858137', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (233, 'belorussian litrature 1462254858226', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (234, 'belorussian litrature 1462254858415', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (235, 'belorussian litrature 1462254858456', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (236, 'belorussian litrature 1462254858476', 'belorussian litrature 1462254858456');
INSERT INTO catalog (id, path, path_parent) VALUES (237, 'belorussian litrature 1462254858605', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (238, 'belorussian litrature 1462254858624', 'belorussian litrature 1462254858605');
INSERT INTO catalog (id, path, path_parent) VALUES (239, 'belorussian litrature 1462254858636', 'belorussian litrature 1462254858605');
INSERT INTO catalog (id, path, path_parent) VALUES (240, 'belorussian litrature 1462254925586', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (241, 'belorussian litrature 1462254925765', 'belorussian litrature 1462254925586');
INSERT INTO catalog (id, path, path_parent) VALUES (242, 'belorussian litrature 1462254925804', 'belorussian litrature 1462254925586');
INSERT INTO catalog (id, path, path_parent) VALUES (243, 'belorussian litrature 1462255997057', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (244, 'belorussian litrature 1462255998394', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (245, 'belorussian litrature 1462255998465', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (246, 'belorussian litrature 1462255998599', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (247, 'belorussian litrature 1462255998625', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (248, 'belorussian litrature 1462255998634', 'belorussian litrature 1462255998625');
INSERT INTO catalog (id, path, path_parent) VALUES (249, 'belorussian litrature 1462255998638', 'belorussian litrature 1462255998625');
INSERT INTO catalog (id, path, path_parent) VALUES (250, 'belorussian litrature 1462258272241', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (251, 'belorussian litrature 1462258272667', 'belorussian litrature 1462258272241');
INSERT INTO catalog (id, path, path_parent) VALUES (252, 'belorussian litrature 1462258272769', 'belorussian litrature 1462258272241');
INSERT INTO catalog (id, path, path_parent) VALUES (253, 'belorussian litrature 1462258274833', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (254, 'belorussian litrature 1462258275009', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (255, 'belorussian litrature 1462258275082', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (256, 'belorussian litrature 1462258275195', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (257, 'belorussian litrature 1462258275234', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (258, 'belorussian litrature 1462258275247', 'belorussian litrature 1462258275234');
INSERT INTO catalog (id, path, path_parent) VALUES (259, 'belorussian litrature 1462258275250', 'belorussian litrature 1462258275234');
INSERT INTO catalog (id, path, path_parent) VALUES (260, 'belorussian litrature 1462258694361', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (261, 'belorussian litrature 1462258694606', 'belorussian litrature 1462258694361');
INSERT INTO catalog (id, path, path_parent) VALUES (262, 'belorussian litrature 1462258694634', 'belorussian litrature 1462258694361');
INSERT INTO catalog (id, path, path_parent) VALUES (263, 'belorussian litrature 1462258740970', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (264, 'belorussian litrature 1462258741194', 'belorussian litrature 1462258740970');
INSERT INTO catalog (id, path, path_parent) VALUES (265, 'belorussian litrature 1462258741233', 'belorussian litrature 1462258740970');
INSERT INTO catalog (id, path, path_parent) VALUES (267, 'belorussian litrature 1462261051183', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (268, 'belorussian litrature 1462261051208', 'belorussian litrature 1462261051183');
INSERT INTO catalog (id, path, path_parent) VALUES (269, 'belorussian litrature 1462261051352', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (270, 'belorussian litrature 1462261051358', 'belorussian litrature 1462261051352');
INSERT INTO catalog (id, path, path_parent) VALUES (271, 'belorussian litrature 1462261051362', 'belorussian litrature 1462261051352');
INSERT INTO catalog (id, path, path_parent) VALUES (272, 'belorussian litrature 1462261051471', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (274, 'belorussian litrature 1462261189948', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (275, 'belorussian litrature 1462261189957', 'belorussian litrature 1462261189948');
INSERT INTO catalog (id, path, path_parent) VALUES (276, 'belorussian litrature 1462261190120', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (277, 'belorussian litrature 1462261190126', 'belorussian litrature 1462261190120');
INSERT INTO catalog (id, path, path_parent) VALUES (278, 'belorussian litrature 1462261190132', 'belorussian litrature 1462261190120');
INSERT INTO catalog (id, path, path_parent) VALUES (279, 'belorussian litrature 1462261190197', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (281, 'belorussian litrature 1462261211599', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (282, 'belorussian litrature 1462261211621', 'belorussian litrature 1462261211599');
INSERT INTO catalog (id, path, path_parent) VALUES (283, 'belorussian litrature 1462261211739', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (284, 'belorussian litrature 1462261211753', 'belorussian litrature 1462261211739');
INSERT INTO catalog (id, path, path_parent) VALUES (285, 'belorussian litrature 1462261211762', 'belorussian litrature 1462261211739');
INSERT INTO catalog (id, path, path_parent) VALUES (286, 'belorussian litrature 1462261211807', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (288, 'belorussian litrature 1462261355626', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (289, 'belorussian litrature 1462261355646', 'belorussian litrature 1462261355626');
INSERT INTO catalog (id, path, path_parent) VALUES (290, 'belorussian litrature 1462261355728', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (291, 'belorussian litrature 1462261355753', 'belorussian litrature 1462261355728');
INSERT INTO catalog (id, path, path_parent) VALUES (292, 'belorussian litrature 1462261355762', 'belorussian litrature 1462261355728');
INSERT INTO catalog (id, path, path_parent) VALUES (293, 'belorussian litrature 1462261355801', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (295, 'belorussian litrature 1462261437759', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (296, 'belorussian litrature 1462261437768', 'belorussian litrature 1462261437759');
INSERT INTO catalog (id, path, path_parent) VALUES (297, 'belorussian litrature 1462261437863', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (298, 'belorussian litrature 1462261437895', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (299, 'belorussian litrature 1462261437905', 'belorussian litrature 1462261437895');
INSERT INTO catalog (id, path, path_parent) VALUES (300, 'belorussian litrature 1462261437910', 'belorussian litrature 1462261437895');
INSERT INTO catalog (id, path, path_parent) VALUES (302, 'belorussian litrature 1462261707397', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (303, 'belorussian litrature 1462261707425', 'belorussian litrature 1462261707397');
INSERT INTO catalog (id, path, path_parent) VALUES (304, 'belorussian litrature 1462261707506', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (305, 'test new path', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (306, 'belorussian litrature 1462261707671', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (307, 'belorussian litrature 1462261707698', 'belorussian litrature 1462261707671');
INSERT INTO catalog (id, path, path_parent) VALUES (308, 'belorussian litrature 1462261707703', 'belorussian litrature 1462261707671');
INSERT INTO catalog (id, path, path_parent) VALUES (309, 'belorussian litrature 1462262153496', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (310, 'test new path 2', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (312, 'belorussian litrature 1462263938577', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (313, 'belorussian litrature 1462263938611', 'belorussian litrature 1462263938577');
INSERT INTO catalog (id, path, path_parent) VALUES (314, 'belorussian litrature 1462263938678', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (315, 'belorussian litrature 1462263938725', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (316, 'belorussian litrature 1462263938771', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (317, 'belorussian litrature 1462263938790', 'belorussian litrature 1462263938771');
INSERT INTO catalog (id, path, path_parent) VALUES (318, 'belorussian litrature 1462263938802', 'belorussian litrature 1462263938771');
INSERT INTO catalog (id, path, path_parent) VALUES (320, 'belorussian litrature 1462264042699', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (321, 'belorussian litrature 1462264042729', 'belorussian litrature 1462264042699');
INSERT INTO catalog (id, path, path_parent) VALUES (322, 'belorussian litrature 1462264042796', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (323, 'belorussian litrature 1462264042814', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (324, 'belorussian litrature 1462264042847', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (325, 'belorussian litrature 1462264042852', 'belorussian litrature 1462264042847');
INSERT INTO catalog (id, path, path_parent) VALUES (326, 'belorussian litrature 1462264042883', 'belorussian litrature 1462264042847');
INSERT INTO catalog (id, path, path_parent) VALUES (327, 'belorussian litrature 1462264155323', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (328, 'belorussian litrature 1462264245287', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (329, 'belorussian litrature 1462264297803', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (330, 'belorussian litrature 1462264791020', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (331, 'belorussian litrature 1462264924283', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (332, 'belorussian litrature 1462264978228', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (333, 'test new path 4', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (334, 'test new path 5', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (335, 'test new path 6', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (336, 'test new path 7', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (337, 'belorussian litrature 1462266072471', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (338, 'new path 0.7135887923822253', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (339, 'belorussian litrature 1462266226507', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (340, 'belorussian litrature 1462266394856', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (341, 'belorussian litrature 1462266575491', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (342, 'belorussian litrature 1462266670086', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (344, 'belorussian litrature 1462266701890', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (345, 'belorussian litrature 1462266701908', 'belorussian litrature 1462266701890');
INSERT INTO catalog (id, path, path_parent) VALUES (346, 'belorussian litrature 1462266701976', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (347, 'belorussian litrature 1462266702004', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (348, 'belorussian litrature 1462266702030', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (349, 'belorussian litrature 1462266702038', 'belorussian litrature 1462266702030');
INSERT INTO catalog (id, path, path_parent) VALUES (350, 'belorussian litrature 1462266702060', 'belorussian litrature 1462266702030');
INSERT INTO catalog (id, path, path_parent) VALUES (351, 'belorussian litrature 1462267036669', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (352, 'belorussian litrature 1462267101535', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (353, 'belorussian litrature 1462267169232', 'new path 0.6947410498805514');
INSERT INTO catalog (id, path, path_parent) VALUES (354, 'new path 0.3898967275116143', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (355, 'belorussian litrature 1462267325434', 'new path 0.06444225095519507');
INSERT INTO catalog (id, path, path_parent) VALUES (356, 'belorussian litrature 1462267358748', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (357, 'belorussian litrature 1462267398959', 'new path 0.4945782769776189');
INSERT INTO catalog (id, path, path_parent) VALUES (358, 'belorussian litrature 1462267444487', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (359, 'belorussian litrature 1462267556844', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (360, 'belorussian litrature 1462267586258', 'new path 0.37291525607629905');
INSERT INTO catalog (id, path, path_parent) VALUES (361, 'belorussian litrature 1462267670783', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (362, 'belorussian litrature 1462267894549', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (363, 'belorussian litrature 1462267984667', 'new path 0.16599185314104237');
INSERT INTO catalog (id, path, path_parent) VALUES (364, 'belorussian litrature 1462268323594', 'new path 0.39945252201988934');
INSERT INTO catalog (id, path, path_parent) VALUES (365, 'belorussian litrature 1462268350979', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (366, 'new path 0.13937914567085663', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (367, 'new path 0.46538533274049554', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (368, 'new path 0.24922892696789445', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (370, 'belorussian litrature 1462268979869', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (371, 'belorussian litrature 1462268979891', 'belorussian litrature 1462268979869');
INSERT INTO catalog (id, path, path_parent) VALUES (372, 'belorussian litrature 1462268979957', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (373, 'new path 0.20355038431791272', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (374, 'belorussian litrature 1462268980088', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (375, 'belorussian litrature 1462268980106', 'belorussian litrature 1462268980088');
INSERT INTO catalog (id, path, path_parent) VALUES (376, 'belorussian litrature 1462268980110', 'belorussian litrature 1462268980088');
INSERT INTO catalog (id, path, path_parent) VALUES (378, 'belorussian litrature 1462269161396', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (380, 'belorussian litrature 1462269161526', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (381, 'new path 0.1388053341200397', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (382, 'belorussian litrature 1462269161657', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (383, 'belorussian litrature 1462269161669', 'belorussian litrature 1462269161657');
INSERT INTO catalog (id, path, path_parent) VALUES (384, 'belorussian litrature 1462269161673', 'belorussian litrature 1462269161657');
INSERT INTO catalog (id, path, path_parent) VALUES (385, 'belorussian litrature 1462269254164', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (387, 'belorussian litrature 1462269419504', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (388, 'belorussian litrature 1462269419675', 'belorussian litrature 1462269419504');
INSERT INTO catalog (id, path, path_parent) VALUES (389, 'belorussian litrature 1462269518618', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (391, 'belorussian litrature 1462275964778', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (392, 'belorussian litrature 1462275964978', 'belorussian litrature 1462275964778');
INSERT INTO catalog (id, path, path_parent) VALUES (394, 'belorussian litrature 1462275982799', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (395, 'belorussian litrature 1462275982812', 'belorussian litrature 1462275982799');
INSERT INTO catalog (id, path, path_parent) VALUES (396, 'belorussian litrature 1462275982903', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (397, 'new path 0.9767873713933095', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (398, 'belorussian litrature 1462275983033', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (399, 'belorussian litrature 1462275983049', 'belorussian litrature 1462275983033');
INSERT INTO catalog (id, path, path_parent) VALUES (400, 'belorussian litrature 1462275983053', 'belorussian litrature 1462275983033');
INSERT INTO catalog (id, path, path_parent) VALUES (402, 'belorussian litrature 1462276101325', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (403, 'belorussian litrature 1462276101336', 'belorussian litrature 1462276101325');
INSERT INTO catalog (id, path, path_parent) VALUES (404, 'belorussian litrature 1462276101484', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (405, 'new path 0.9023959469380951', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (406, 'belorussian litrature 1462276101700', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (407, 'belorussian litrature 1462276101738', 'belorussian litrature 1462276101700');
INSERT INTO catalog (id, path, path_parent) VALUES (408, 'belorussian litrature 1462276101748', 'belorussian litrature 1462276101700');
INSERT INTO catalog (id, path, path_parent) VALUES (410, 'belorussian litrature 1462276141029', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (411, 'belorussian litrature 1462276141039', 'belorussian litrature 1462276141029');
INSERT INTO catalog (id, path, path_parent) VALUES (412, 'belorussian litrature 1462276141126', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (413, 'new path 0.9894678015737408', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (414, 'belorussian litrature 1462276141255', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (415, 'belorussian litrature 1462276141263', 'belorussian litrature 1462276141255');
INSERT INTO catalog (id, path, path_parent) VALUES (416, 'belorussian litrature 1462276141289', 'belorussian litrature 1462276141255');
INSERT INTO catalog (id, path, path_parent) VALUES (418, 'belorussian litrature 1462276164629', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (419, 'belorussian litrature 1462276164643', 'belorussian litrature 1462276164629');
INSERT INTO catalog (id, path, path_parent) VALUES (420, 'belorussian litrature 1462276164752', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (421, 'new path 0.1416487280021551', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (422, 'belorussian litrature 1462276164895', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (423, 'belorussian litrature 1462276164905', 'belorussian litrature 1462276164895');
INSERT INTO catalog (id, path, path_parent) VALUES (424, 'belorussian litrature 1462276164909', 'belorussian litrature 1462276164895');
INSERT INTO catalog (id, path, path_parent) VALUES (426, 'belorussian litrature 1462276421324', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (427, 'belorussian litrature 1462276421338', 'belorussian litrature 1462276421324');
INSERT INTO catalog (id, path, path_parent) VALUES (428, 'belorussian litrature 1462276421437', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (429, 'new path 0.7994645741648853', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (430, 'belorussian litrature 1462276421531', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (431, 'belorussian litrature 1462276421537', 'belorussian litrature 1462276421531');
INSERT INTO catalog (id, path, path_parent) VALUES (432, 'belorussian litrature 1462276421543', 'belorussian litrature 1462276421531');
INSERT INTO catalog (id, path, path_parent) VALUES (434, 'belorussian litrature 1462276912103', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (435, 'belorussian litrature 1462276912186', 'belorussian litrature 1462276912103');
INSERT INTO catalog (id, path, path_parent) VALUES (436, 'belorussian litrature 1462276912337', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (437, 'new path 0.9058018026817521', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (438, 'belorussian litrature 1462276912467', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (439, 'belorussian litrature 1462276912474', 'belorussian litrature 1462276912467');
INSERT INTO catalog (id, path, path_parent) VALUES (440, 'belorussian litrature 1462276912479', 'belorussian litrature 1462276912467');
INSERT INTO catalog (id, path, path_parent) VALUES (442, 'belorussian litrature 1462276987302', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (443, 'belorussian litrature 1462276987329', 'belorussian litrature 1462276987302');
INSERT INTO catalog (id, path, path_parent) VALUES (444, 'belorussian litrature 1462276987437', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (445, 'new path 0.7653529521487615', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (446, 'belorussian litrature 1462276987618', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (447, 'belorussian litrature 1462276987624', 'belorussian litrature 1462276987618');
INSERT INTO catalog (id, path, path_parent) VALUES (448, 'belorussian litrature 1462276987634', 'belorussian litrature 1462276987618');
INSERT INTO catalog (id, path, path_parent) VALUES (450, 'belorussian litrature 1462277675249', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (452, 'belorussian litrature 1462277675399', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (453, 'new path 0.637674408927245', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (454, 'belorussian litrature 1462277675569', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (455, 'belorussian litrature 1462277675576', 'belorussian litrature 1462277675569');
INSERT INTO catalog (id, path, path_parent) VALUES (456, 'belorussian litrature 1462277675580', 'belorussian litrature 1462277675569');
INSERT INTO catalog (id, path, path_parent) VALUES (457, 'belorussian litrature 1462277728379', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (459, 'belorussian litrature 1462277729430', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (460, 'new path 0.31589799207019575', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (461, 'belorussian litrature 1462277729618', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (462, 'belorussian litrature 1462277729622', 'belorussian litrature 1462277729618');
INSERT INTO catalog (id, path, path_parent) VALUES (463, 'belorussian litrature 1462277729627', 'belorussian litrature 1462277729618');
INSERT INTO catalog (id, path, path_parent) VALUES (464, 'belorussian litrature 1462278141069', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (466, 'belorussian litrature 1462278142343', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (467, 'new path 0.9814738545460201', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (468, 'belorussian litrature 1462278142521', 'liturature');
INSERT INTO catalog (id, path, path_parent) VALUES (469, 'belorussian litrature 1462278142543', 'belorussian litrature 1462278142521');
INSERT INTO catalog (id, path, path_parent) VALUES (470, 'belorussian litrature 1462278142548', 'belorussian litrature 1462278142521');
INSERT INTO catalog (id, path, path_parent) VALUES (471, 'belorussian litrature 1462278142557', 'belorussian litrature 1462278142521');


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 206
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 471, true);


--
-- TOC entry 2189 (class 0 OID 17317)
-- Dependencies: 207
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 60, true);


--
-- TOC entry 2191 (class 0 OID 17323)
-- Dependencies: 209
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 210
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 760, true);


--
-- TOC entry 2193 (class 0 OID 17328)
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
-- TOC entry 2195 (class 0 OID 17333)
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
-- TOC entry 2197 (class 0 OID 17338)
-- Dependencies: 215
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2198 (class 0 OID 17341)
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
-- TOC entry 2202 (class 0 OID 17350)
-- Dependencies: 220
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 788, true);


--
-- TOC entry 2204 (class 0 OID 17355)
-- Dependencies: 222
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 223
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2018 (class 2606 OID 17372)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2020 (class 2606 OID 17374)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2022 (class 2606 OID 17376)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2028 (class 2606 OID 17378)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2030 (class 2606 OID 17380)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2024 (class 2606 OID 17382)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2026 (class 2606 OID 17384)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 17386)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2034 (class 2606 OID 17388)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 17390)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 17392)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2040 (class 2606 OID 17394)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 17396)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 17398)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2046 (class 2606 OID 17400)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2050 (class 2606 OID 17402)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2048 (class 2606 OID 17404)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 17406)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2054 (class 2606 OID 17408)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2056 (class 2606 OID 17410)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2058 (class 2606 OID 17412)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 17413)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2061 (class 2606 OID 17418)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2062 (class 2606 OID 17423)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2060 (class 2606 OID 17428)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2063 (class 2606 OID 17433)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2064 (class 2606 OID 17438)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2065 (class 2606 OID 17443)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2069 (class 2606 OID 17448)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2070 (class 2606 OID 17453)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2066 (class 2606 OID 17458)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2067 (class 2606 OID 17463)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2068 (class 2606 OID 17468)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2071 (class 2606 OID 17473)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2072 (class 2606 OID 17478)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-05-03 16:56:49 MSK

--
-- PostgreSQL database dump complete
--

