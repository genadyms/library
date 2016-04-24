--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-04-25 01:01:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 17675)
-- Name: abonement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    issue timestamp without time zone NOT NULL,
    return_date timestamp without time zone,
    return_date_fact timestamp without time zone
);


--
-- TOC entry 182 (class 1259 OID 17678)
-- Name: author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 17681)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 183
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 185 (class 1259 OID 17686)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 184 (class 1259 OID 17683)
-- Name: book; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 186 (class 1259 OID 17688)
-- Name: book_2_author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 17691)
-- Name: book_2_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 17694)
-- Name: catalog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 17700)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 189
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 190 (class 1259 OID 17702)
-- Name: comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comment (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created timestamp without time zone NOT NULL,
    "like" integer NOT NULL,
    dislike integer NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 17705)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 191
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 192 (class 1259 OID 17707)
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 17710)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 193
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 194 (class 1259 OID 17712)
-- Name: copy_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL,
    state_book integer NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 17715)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 195
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 196 (class 1259 OID 17717)
-- Name: department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 17720)
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 197
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 198 (class 1259 OID 17722)
-- Name: order; Type: TABLE; Schema: public; Owner: -
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
-- TOC entry 199 (class 1259 OID 17725)
-- Name: order_2_comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 17728)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 200
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 201 (class 1259 OID 17730)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 201
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 202 (class 1259 OID 17732)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 202
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 203 (class 1259 OID 17734)
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 17737)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 205 (class 1259 OID 17739)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone NOT NULL,
    user_state integer NOT NULL,
    role integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 17742)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2056 (class 2604 OID 17744)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 17745)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 17746)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 17747)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 17748)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 17749)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 17750)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 17751)
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 17752)
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 17753)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2235 (class 0 OID 17675)
-- Dependencies: 181
-- Data for Name: abonement; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2236 (class 0 OID 17678)
-- Dependencies: 182
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 183
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 1, false);


--
-- TOC entry 2238 (class 0 OID 17683)
-- Dependencies: 184
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (12, 1, 'wwww', 4, '2005-05-06 23:09:45', 'of3', NULL);
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (13, 1, 'eder', 5, '2010-04-05 23:34:12', 'of2', NULL);
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (6, 1, 'test', 23, '2016-05-05 20:30:00', 'office1', 'null');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (9, 1, 'test2', 32, '2005-05-05 00:00:00', 'off2', 'n ull');


--
-- TOC entry 2240 (class 0 OID 17688)
-- Dependencies: 186
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2241 (class 0 OID 17691)
-- Dependencies: 187
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 185
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 13, true);


--
-- TOC entry 2242 (class 0 OID 17694)
-- Dependencies: 188
-- Data for Name: catalog; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO catalog (id, path, path_parent) VALUES (1, 'null', 'home');


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 189
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 1, true);


--
-- TOC entry 2244 (class 0 OID 17702)
-- Dependencies: 190
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 191
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 1, false);


--
-- TOC entry 2246 (class 0 OID 17707)
-- Dependencies: 192
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO contact (id, phone, address) VALUES (1, '456-7890', 'grodno');


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 193
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 1, true);


--
-- TOC entry 2248 (class 0 OID 17712)
-- Dependencies: 194
-- Data for Name: copy_book; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 195
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2250 (class 0 OID 17717)
-- Dependencies: 196
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 197
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2252 (class 0 OID 17722)
-- Dependencies: 198
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2253 (class 0 OID 17725)
-- Dependencies: 199
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 200
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 201
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 202
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2257 (class 0 OID 17734)
-- Dependencies: 203
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (7, 'email1', 'pass1');
INSERT INTO user_credentials (id, email, password) VALUES (8, 'email2', 'pass2');
INSERT INTO user_credentials (id, email, password) VALUES (11, '1461527867151mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (12, '1461527898542mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (13, '1461528570066mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (14, '1461528599593mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (15, '1461529335509mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (16, '1461530657830mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (17, '1461530983039mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (18, '1461531457008mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (19, '1461531579342mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (20, '1461531665335mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (21, '1461532167335mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (22, '1461532581611mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (23, '1461532635869mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (24, '1461533043339mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (25, '1461533115496mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (26, '1461534867494mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (27, '1461534899352mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (28, '1461534915574mail@test.by', 'pswd');
INSERT INTO user_credentials (id, email, password) VALUES (29, '1461535196759mail@test.by', 'pswd');


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 29, true);


--
-- TOC entry 2259 (class 0 OID 17739)
-- Dependencies: 205
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (7, 1, 'first_nam1', 'last_name1', '2016-04-05 00:00:00', 1, 1);


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2068 (class 2606 OID 17756)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2070 (class 2606 OID 17758)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2072 (class 2606 OID 17760)
-- Name: author_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 17762)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2080 (class 2606 OID 17764)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2074 (class 2606 OID 17871)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2076 (class 2606 OID 17868)
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 2606 OID 17766)
-- Name: catalog_path_path_parent_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);


--
-- TOC entry 2084 (class 2606 OID 17768)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 17770)
-- Name: comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 17772)
-- Name: contact_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 17774)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2092 (class 2606 OID 17776)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2094 (class 2606 OID 17778)
-- Name: department_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 17780)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2096 (class 2606 OID 17782)
-- Name: order_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 17784)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2102 (class 2606 OID 17786)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2104 (class 2606 OID 17788)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2106 (class 2606 OID 17790)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2107 (class 2606 OID 17791)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2109 (class 2606 OID 17796)
-- Name: book_2_author_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2110 (class 2606 OID 17801)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2108 (class 2606 OID 17806)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2111 (class 2606 OID 17811)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2112 (class 2606 OID 17816)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2113 (class 2606 OID 17821)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2117 (class 2606 OID 17826)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2118 (class 2606 OID 17831)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2114 (class 2606 OID 17836)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2115 (class 2606 OID 17841)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2116 (class 2606 OID 17846)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2119 (class 2606 OID 17856)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2120 (class 2606 OID 17861)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-04-25 01:01:17

--
-- PostgreSQL database dump complete
--

