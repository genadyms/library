--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-12 00:30:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 25089)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 25090)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25093)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25096)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 211 (class 1259 OID 25098)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 212 (class 1259 OID 25100)
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
-- TOC entry 213 (class 1259 OID 25104)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25107)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25110)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 216 (class 1259 OID 25113)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 217 (class 1259 OID 25115)
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
-- TOC entry 218 (class 1259 OID 25119)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 219 (class 1259 OID 25121)
-- Name: contact; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 25124)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 221 (class 1259 OID 25126)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25129)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 223 (class 1259 OID 25131)
-- Name: department; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 25134)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 225 (class 1259 OID 25136)
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
-- TOC entry 226 (class 1259 OID 25139)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 25142)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 228 (class 1259 OID 25144)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 229 (class 1259 OID 25146)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 230 (class 1259 OID 25148)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 25151)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 232 (class 1259 OID 25153)
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
-- TOC entry 233 (class 1259 OID 25157)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2122 (class 2604 OID 25159)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2124 (class 2604 OID 25160)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 25161)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 25162)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 25163)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 25164)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25165)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 25166)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25167)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25168)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2303 (class 0 OID 25090)
-- Dependencies: 208
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2304 (class 0 OID 25093)
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
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 210
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 87, true);


--
-- TOC entry 2307 (class 0 OID 25100)
-- Dependencies: 212
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2308 (class 0 OID 25104)
-- Dependencies: 213
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
-- TOC entry 2309 (class 0 OID 25107)
-- Dependencies: 214
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 211
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 702, true);


--
-- TOC entry 2310 (class 0 OID 25110)
-- Dependencies: 215
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 216
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 3743, true);


--
-- TOC entry 2312 (class 0 OID 25115)
-- Dependencies: 217
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 218
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 60, true);


--
-- TOC entry 2314 (class 0 OID 25121)
-- Dependencies: 219
-- Data for Name: contact; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO contact (id, phone, address) VALUES (886, 'phone 1463001899323', 'Grodno 1463001899323');
INSERT INTO contact (id, phone, address) VALUES (783, 'new phone phone 1462994178700', 'new test Grodno 1462994178700');


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('contact_id_seq', 886, true);


--
-- TOC entry 2316 (class 0 OID 25126)
-- Dependencies: 221
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 222
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 1, false);


--
-- TOC entry 2318 (class 0 OID 25131)
-- Dependencies: 223
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 224
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- TOC entry 2320 (class 0 OID 25136)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2321 (class 0 OID 25139)
-- Dependencies: 226
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 227
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 1, false);


--
-- TOC entry 2325 (class 0 OID 25148)
-- Dependencies: 230
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (891, '1463001899323test@gmail.com', 'pass');


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 891, true);


--
-- TOC entry 2327 (class 0 OID 25153)
-- Dependencies: 232
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, contact_id, first_name, last_name, created, user_state, role) VALUES (891, 886, 'OtherFirstName', 'OtherLastName', '2016-05-12 00:24:59.325155', 1, 0);


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2136 (class 2606 OID 25170)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2138 (class 2606 OID 25172)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2140 (class 2606 OID 25174)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2146 (class 2606 OID 25176)
-- Name: book_2_comment_comment_id_book_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);


--
-- TOC entry 2148 (class 2606 OID 25178)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2142 (class 2606 OID 25180)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2144 (class 2606 OID 25182)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 25184)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 25186)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2154 (class 2606 OID 25188)
-- Name: contact_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);


--
-- TOC entry 2156 (class 2606 OID 25190)
-- Name: contact_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 25192)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2160 (class 2606 OID 25194)
-- Name: department_contact_id_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);


--
-- TOC entry 2162 (class 2606 OID 25196)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 25198)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2164 (class 2606 OID 25200)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 25202)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2170 (class 2606 OID 25204)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2172 (class 2606 OID 25206)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 25208)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 25209)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2177 (class 2606 OID 25214)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2176 (class 2606 OID 25219)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2178 (class 2606 OID 25224)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2179 (class 2606 OID 25229)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2180 (class 2606 OID 25234)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2181 (class 2606 OID 25239)
-- Name: department_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2185 (class 2606 OID 25244)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2186 (class 2606 OID 25249)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2182 (class 2606 OID 25254)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2183 (class 2606 OID 25259)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2184 (class 2606 OID 25264)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2187 (class 2606 OID 25269)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


--
-- TOC entry 2188 (class 2606 OID 25274)
-- Name: user_profile_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);


-- Completed on 2016-05-12 00:30:13

--
-- PostgreSQL database dump complete
--

