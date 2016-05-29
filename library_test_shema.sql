--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-30 01:07:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 25912)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 25913)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 193 (class 1259 OID 25916)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 25919)
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
-- Dependencies: 194
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 195 (class 1259 OID 25921)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 196 (class 1259 OID 25923)
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
-- TOC entry 197 (class 1259 OID 25927)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 25930)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 25933)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 200 (class 1259 OID 25936)
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
-- Dependencies: 200
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 201 (class 1259 OID 25938)
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
-- TOC entry 202 (class 1259 OID 25942)
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
-- Dependencies: 202
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 203 (class 1259 OID 25944)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 25947)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 204
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 205 (class 1259 OID 25949)
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
-- TOC entry 206 (class 1259 OID 25955)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 25958)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 207
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 208 (class 1259 OID 25960)
-- Name: order; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone
);


--
-- TOC entry 209 (class 1259 OID 25963)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25966)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 210
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 211 (class 1259 OID 25968)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 211
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 212 (class 1259 OID 25970)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 212
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 213 (class 1259 OID 25972)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25975)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 215 (class 1259 OID 25977)
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
-- TOC entry 216 (class 1259 OID 25984)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2132 (class 2604 OID 25986)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25987)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 25988)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 25989)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 25990)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 25991)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 25992)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 25993)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 25994)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2317 (class 0 OID 25913)
-- Dependencies: 192
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2318 (class 0 OID 25916)
-- Dependencies: 193
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
INSERT INTO author (id, first_name, second_name) VALUES (318, 'Anton', 'Chehov 1464413374100');
INSERT INTO author (id, first_name, second_name) VALUES (319, 'Anton', 'Chehov 1464413387490');
INSERT INTO author (id, first_name, second_name) VALUES (320, 'Anton', 'Chehov 1464413400381');
INSERT INTO author (id, first_name, second_name) VALUES (321, 'Anton', 'Chehov 1464540883626');
INSERT INTO author (id, first_name, second_name) VALUES (322, 'Anton', 'Chehov 1464540885857');
INSERT INTO author (id, first_name, second_name) VALUES (323, 'new first name', 'new second name 1464540886881');
INSERT INTO author (id, first_name, second_name) VALUES (324, 'Anton', 'Chehov 1464541787286');
INSERT INTO author (id, first_name, second_name) VALUES (326, 'new first name', 'new second name 1464541787760');
INSERT INTO author (id, first_name, second_name) VALUES (327, 'Anton', 'Chehov 1464541857228');
INSERT INTO author (id, first_name, second_name) VALUES (328, 'Anton', 'Chehov 1464541857528');
INSERT INTO author (id, first_name, second_name) VALUES (329, 'Anton', 'Chehov 1464541857534');
INSERT INTO author (id, first_name, second_name) VALUES (330, 'new first name', 'new second name 1464541857726');
INSERT INTO author (id, first_name, second_name) VALUES (331, 'Anton', 'Chehov 1464550831032');
INSERT INTO author (id, first_name, second_name) VALUES (332, 'Anton', 'Chehov 1464550831220');
INSERT INTO author (id, first_name, second_name) VALUES (333, 'Anton', 'Chehov 1464550868502');
INSERT INTO author (id, first_name, second_name) VALUES (334, 'Anton', 'Chehov 1464550868727');
INSERT INTO author (id, first_name, second_name) VALUES (335, 'Anton', 'Chehov 1464550869015');
INSERT INTO author (id, first_name, second_name) VALUES (336, 'Anton', 'Chehov 1464550869027');
INSERT INTO author (id, first_name, second_name) VALUES (337, 'new first name', 'new second name 1464550869062');
INSERT INTO author (id, first_name, second_name) VALUES (338, 'Anton', 'Chehov 1464550881299');
INSERT INTO author (id, first_name, second_name) VALUES (339, 'Anton', 'Chehov 1464550881458');
INSERT INTO author (id, first_name, second_name) VALUES (340, 'Anton', 'Chehov 1464551034773');
INSERT INTO author (id, first_name, second_name) VALUES (341, 'Anton', 'Chehov 1464551034935');
INSERT INTO author (id, first_name, second_name) VALUES (342, 'Anton', 'Chehov 1464551035183');
INSERT INTO author (id, first_name, second_name) VALUES (343, 'Anton', 'Chehov 1464551035228');
INSERT INTO author (id, first_name, second_name) VALUES (344, 'Anton', 'Chehov 1464551035236');
INSERT INTO author (id, first_name, second_name) VALUES (345, 'new first name', 'new second name 1464551035269');
INSERT INTO author (id, first_name, second_name) VALUES (346, 'Anton', 'Chehov 1464551050662');
INSERT INTO author (id, first_name, second_name) VALUES (347, 'Anton', 'Chehov 1464551050844');
INSERT INTO author (id, first_name, second_name) VALUES (348, 'Anton', 'Chehov 1464551051122');


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 194
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 348, true);


--
-- TOC entry 2321 (class 0 OID 25923)
-- Dependencies: 196
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1799, NULL, 'Mumu', 234, '2016-05-29 20:10:57.485', 'Manning', '0.8477768384521938');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1800, NULL, 'Mumu', 234, '2016-05-29 20:10:57.513', 'Manning', '0.8371216967979486');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1801, NULL, 'Mumu', 234, '2016-05-29 20:10:57.517', 'Manning', '0.5047173327988329');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1802, NULL, 'Mumu', 234, '2016-05-29 20:10:57.521', 'Manning', '0.8415427031362619');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1803, NULL, 'Mumu', 234, '2016-05-29 20:10:57.524', 'Manning', '0.017611888282443422');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1804, NULL, 'Mumu', 234, '2016-05-29 22:40:31.224', 'Manning', '0.25680840622561396');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1805, NULL, 'Mumu', 234, '2016-05-29 22:41:08.732', 'Manning', '0.9260945280384324');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1806, NULL, 'Mumu', 234, '2016-05-29 22:41:21.465', 'Manning', '0.28030240240734106');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1807, NULL, 'Mumu', 234, '2016-05-29 22:43:54.938', 'Manning', '0.04634117899970913');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1808, NULL, 'Mumu', 234, '2016-05-29 22:44:10.86', 'Manning', '0.5301718817165163');


--
-- TOC entry 2322 (class 0 OID 25927)
-- Dependencies: 197
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book_2_author (book_id, author_id) VALUES (1799, 327);
INSERT INTO book_2_author (book_id, author_id) VALUES (1800, 327);
INSERT INTO book_2_author (book_id, author_id) VALUES (1801, 327);
INSERT INTO book_2_author (book_id, author_id) VALUES (1802, 327);
INSERT INTO book_2_author (book_id, author_id) VALUES (1803, 327);
INSERT INTO book_2_author (book_id, author_id) VALUES (1804, 331);
INSERT INTO book_2_author (book_id, author_id) VALUES (1804, 332);
INSERT INTO book_2_author (book_id, author_id) VALUES (1805, 333);
INSERT INTO book_2_author (book_id, author_id) VALUES (1805, 334);
INSERT INTO book_2_author (book_id, author_id) VALUES (1806, 338);
INSERT INTO book_2_author (book_id, author_id) VALUES (1806, 339);
INSERT INTO book_2_author (book_id, author_id) VALUES (1807, 341);
INSERT INTO book_2_author (book_id, author_id) VALUES (1807, 340);
INSERT INTO book_2_author (book_id, author_id) VALUES (1807, 342);
INSERT INTO book_2_author (book_id, author_id) VALUES (1808, 346);
INSERT INTO book_2_author (book_id, author_id) VALUES (1808, 347);
INSERT INTO book_2_author (book_id, author_id) VALUES (1808, 348);


--
-- TOC entry 2323 (class 0 OID 25930)
-- Dependencies: 198
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 195
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1808, true);


--
-- TOC entry 2324 (class 0 OID 25933)
-- Dependencies: 199
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 200
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4539, true);


--
-- TOC entry 2326 (class 0 OID 25938)
-- Dependencies: 201
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 202
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 667, true);


--
-- TOC entry 2328 (class 0 OID 25944)
-- Dependencies: 203
-- Data for Name: copy_book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO copy_book (id, book_id, department_id) VALUES (309, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (310, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (311, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (312, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (313, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (314, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (315, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (316, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (317, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (318, 1703, 237);
INSERT INTO copy_book (id, book_id, department_id) VALUES (319, 1721, 238);
INSERT INTO copy_book (id, book_id, department_id) VALUES (320, 1722, 239);
INSERT INTO copy_book (id, book_id, department_id) VALUES (321, 1722, 239);
INSERT INTO copy_book (id, book_id, department_id) VALUES (322, 1722, 239);
INSERT INTO copy_book (id, book_id, department_id) VALUES (323, 1722, 239);
INSERT INTO copy_book (id, book_id, department_id) VALUES (324, 1722, 239);
INSERT INTO copy_book (id, book_id, department_id) VALUES (325, 1723, 240);
INSERT INTO copy_book (id, book_id, department_id) VALUES (327, 1725, 246);
INSERT INTO copy_book (id, book_id, department_id) VALUES (328, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (329, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (330, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (331, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (332, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (333, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (334, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (335, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (336, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (337, 1726, 247);
INSERT INTO copy_book (id, book_id, department_id) VALUES (338, 1727, 248);
INSERT INTO copy_book (id, book_id, department_id) VALUES (339, 1728, 249);
INSERT INTO copy_book (id, book_id, department_id) VALUES (340, 1746, 250);
INSERT INTO copy_book (id, book_id, department_id) VALUES (341, 1747, 251);
INSERT INTO copy_book (id, book_id, department_id) VALUES (342, 1747, 251);
INSERT INTO copy_book (id, book_id, department_id) VALUES (343, 1747, 251);
INSERT INTO copy_book (id, book_id, department_id) VALUES (344, 1747, 251);
INSERT INTO copy_book (id, book_id, department_id) VALUES (345, 1747, 251);
INSERT INTO copy_book (id, book_id, department_id) VALUES (346, 1748, 252);
INSERT INTO copy_book (id, book_id, department_id) VALUES (348, 1750, 258);
INSERT INTO copy_book (id, book_id, department_id) VALUES (349, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (350, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (351, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (352, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (353, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (354, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (355, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (356, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (357, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (358, 1751, 259);
INSERT INTO copy_book (id, book_id, department_id) VALUES (359, 1752, 260);
INSERT INTO copy_book (id, book_id, department_id) VALUES (360, 1753, 261);
INSERT INTO copy_book (id, book_id, department_id) VALUES (361, 1781, 262);
INSERT INTO copy_book (id, book_id, department_id) VALUES (362, 1782, 263);
INSERT INTO copy_book (id, book_id, department_id) VALUES (363, 1782, 263);
INSERT INTO copy_book (id, book_id, department_id) VALUES (364, 1782, 263);
INSERT INTO copy_book (id, book_id, department_id) VALUES (365, 1782, 263);
INSERT INTO copy_book (id, book_id, department_id) VALUES (366, 1782, 263);
INSERT INTO copy_book (id, book_id, department_id) VALUES (367, 1783, 264);
INSERT INTO copy_book (id, book_id, department_id) VALUES (369, 1785, 270);
INSERT INTO copy_book (id, book_id, department_id) VALUES (370, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (371, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (372, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (373, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (374, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (375, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (376, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (377, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (378, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (379, 1786, 271);
INSERT INTO copy_book (id, book_id, department_id) VALUES (380, 1787, 272);
INSERT INTO copy_book (id, book_id, department_id) VALUES (381, 1788, 273);


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 204
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 381, true);


--
-- TOC entry 2330 (class 0 OID 25949)
-- Dependencies: 205
-- Data for Name: department; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO department (id, name, type, phone, address) VALUES (67, 'department name', 0, 'phone 1463147063117', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (68, 'department name', 0, 'phone 1463147477241', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (69, 'department name', 0, 'phone 1463148672428', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (70, 'department name', 0, 'phone 1463148706965', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (71, 'department name', 0, 'phone 1463148874547', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (72, 'department name', 0, 'phone 1463148909784', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (73, 'department name', 0, 'phone 1463148931202', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (74, 'department name', 0, 'phone 1463149214701', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (75, 'department name', 0, 'phone 1463149214772', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (76, 'department name', 0, 'phone 1463149214797', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (77, 'department name', 0, 'phone 1463149214842', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (78, 'department name', 0, 'phone 1463149214868', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (80, 'new name', 1, '23451463149214986', 'grodno 1463149214986');
INSERT INTO department (id, name, type, phone, address) VALUES (81, 'department name', 0, 'phone 1463149215062', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (82, 'department name', 0, 'phone 1463149301692', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (83, 'department name', 0, 'phone 1463202106099', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (84, 'department name', 0, 'phone 1463202203831', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (85, 'department name', 0, 'phone 1463204299924', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (86, 'department name', 0, 'phone 1463204300300', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (87, 'department name', 0, 'phone 1463204320998', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (88, 'department name', 0, 'phone 1463204321117', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (89, 'department name', 0, 'phone 1463204330593', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (90, 'department name', 0, 'phone 1463204330716', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (91, 'department name', 0, 'phone 1463204457151', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (92, 'department name', 0, 'phone 1463204457240', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (93, 'department name', 0, 'phone 1463204457294', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (94, 'department name', 0, 'phone 1463204492232', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (95, 'department name', 0, 'phone 1463204492341', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (96, 'department name', 0, 'phone 1463204492386', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (97, 'department name', 0, 'phone 1463210044246', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (98, 'department name', 0, 'phone 1463210044728', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (99, 'department name', 0, 'phone 1463210044755', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (100, 'department name', 0, 'phone 1463210045625', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (101, 'department name', 0, 'phone 1463210045675', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (102, 'department name', 0, 'phone 1463210045716', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (103, 'department name', 0, 'phone 1463210046836', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (104, 'department name', 0, 'phone 1463210046844', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (106, 'new name', 1, '23451463210046876', 'grodno 1463210046876');
INSERT INTO department (id, name, type, phone, address) VALUES (107, 'department name', 0, 'phone 1463210667004', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (108, 'department name', 0, 'phone 1463210700961', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (109, 'department name', 0, 'phone 1463210701008', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (110, 'department name', 0, 'phone 1463210701036', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (111, 'department name', 0, 'phone 1463214467482', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (112, 'department name', 0, 'phone 1463214467657', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (113, 'department name', 0, 'phone 1463214467682', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (114, 'department name', 0, 'phone 1463214589905', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (115, 'department name', 0, 'phone 1463214590122', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (116, 'department name', 0, 'phone 1463214590160', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (117, 'department name', 0, 'phone 1463214810418', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (118, 'department name', 0, 'phone 1463214810532', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (119, 'department name', 0, 'phone 1463214810590', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (120, 'department name', 0, 'phone 1463215258360', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (121, 'department name', 0, 'phone 1463215258463', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (122, 'department name', 0, 'phone 1463215258503', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (123, 'department name', 0, 'phone 1463217387562', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (124, 'department name', 0, 'phone 1463217388723', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (125, 'department name', 0, 'phone 1463217388875', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (126, 'department name', 0, 'phone 1463217388915', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (127, 'department name', 0, 'phone 1463217388988', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (128, 'department name', 0, 'phone 1463217389022', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (130, 'new name', 1, '23451463217389862', 'grodno 1463217389862');
INSERT INTO department (id, name, type, phone, address) VALUES (131, 'department name', 0, 'phone 1463217390425', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (132, 'department name', 0, 'phone 1463217390519', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (133, 'department name', 0, 'phone 1463217390692', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (134, 'department name', 0, 'phone 1463217532973', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (135, 'department name', 0, 'phone 1463217605873', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (136, 'department name', 0, 'phone 1463217727188', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (137, 'department name', 0, 'phone 1463217774907', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (138, 'department name', 0, 'phone 1463217897809', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (139, 'department name', 0, 'phone 1463217995290', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (140, 'department name', 0, 'phone 1463218221110', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (141, 'department name', 0, 'phone 1463218280000', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (142, 'department name', 0, 'phone 1463218388742', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (143, 'department name', 0, 'phone 1463218460325', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (144, 'department name', 0, 'phone 1463218460534', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (145, 'department name', 0, 'phone 1463218460719', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (146, 'department name', 0, 'phone 1463218495388', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (147, 'department name', 0, 'phone 1463224481522', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (148, 'department name', 0, 'phone 1463224482023', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (149, 'department name', 0, 'phone 1463224482071', 'Grodno, ul. departmentStreet');
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
INSERT INTO department (id, name, type, phone, address) VALUES (262, 'department name', 0, 'phone 1464540915465', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (263, 'department name', 0, 'phone 1464540917338', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (264, 'department name', 0, 'phone 1464540917373', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (265, 'department name', 0, 'phone 1464540917388', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (266, 'department name', 0, 'phone 1464540917414', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (267, 'department name', 0, 'phone 1464540917424', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (269, 'new name', 1, '23451464540917580', 'grodno 1464540917580');
INSERT INTO department (id, name, type, phone, address) VALUES (270, 'department name', 0, 'phone 1464540917609', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (271, 'department name', 0, 'phone 1464540917653', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (272, 'department name', 0, 'phone 1464540917750', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (273, 'department name', 0, 'phone 1464540917786', 'Grodno, ul. departmentStreet');


--
-- TOC entry 2331 (class 0 OID 25955)
-- Dependencies: 206
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1331, 243);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1344, 255);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1357, 267);


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 207
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 273, true);


--
-- TOC entry 2333 (class 0 OID 25960)
-- Dependencies: 208
-- Data for Name: order; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (196, 1327, 319, '2016-05-15 23:45:13.147262', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (197, 1332, 327, '2016-05-15 23:45:44.536322', 1333, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (198, 1334, 328, '2016-05-15 23:45:44.599287', 1335, NULL, '2016-05-15 23:45:44.597');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (199, 1334, 329, '2016-05-15 23:45:44.606165', 1335, NULL, '2016-05-15 23:45:44.603');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (200, 1334, 330, '2016-05-15 23:45:44.614371', 1335, NULL, '2016-05-15 23:45:44.611');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (201, 1334, 331, '2016-05-15 23:45:44.620277', 1335, NULL, '2016-05-15 23:45:44.618');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (202, 1334, 332, '2016-05-15 23:45:44.625117', 1335, NULL, '2016-05-15 23:45:44.623');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (203, 1334, 333, '2016-05-15 23:45:44.62941', 1335, NULL, '2016-05-15 23:45:44.627');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (204, 1334, 334, '2016-05-15 23:45:44.633868', 1335, NULL, '2016-05-15 23:45:44.631');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (205, 1334, 335, '2016-05-15 23:45:44.63872', 1335, NULL, '2016-05-15 23:45:44.636');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (206, 1334, 336, '2016-05-15 23:45:44.643127', 1335, NULL, '2016-05-15 23:45:44.641');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (207, 1334, 337, '2016-05-15 23:45:44.647618', 1335, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (208, 1336, 338, '2016-05-15 23:45:44.852899', 1337, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (210, 1340, 340, '2016-05-25 22:48:31.297363', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (211, 1345, 348, '2016-05-25 22:48:32.242037', 1346, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (212, 1347, 349, '2016-05-25 22:48:32.280169', 1348, NULL, '2016-05-25 22:48:32.277');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (213, 1347, 350, '2016-05-25 22:48:32.290143', 1348, NULL, '2016-05-25 22:48:32.286');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (214, 1347, 351, '2016-05-25 22:48:32.297793', 1348, NULL, '2016-05-25 22:48:32.295');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (215, 1347, 352, '2016-05-25 22:48:32.307376', 1348, NULL, '2016-05-25 22:48:32.304');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (216, 1347, 353, '2016-05-25 22:48:32.314908', 1348, NULL, '2016-05-25 22:48:32.312');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (217, 1347, 354, '2016-05-25 22:48:32.325127', 1348, NULL, '2016-05-25 22:48:32.322');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (218, 1347, 355, '2016-05-25 22:48:32.332691', 1348, NULL, '2016-05-25 22:48:32.33');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (219, 1347, 356, '2016-05-25 22:48:32.340985', 1348, NULL, '2016-05-25 22:48:32.338');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (220, 1347, 357, '2016-05-25 22:48:32.346877', 1348, NULL, '2016-05-25 22:48:32.345');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (221, 1347, 358, '2016-05-25 22:48:32.355766', 1348, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (222, 1349, 359, '2016-05-25 22:48:32.396207', 1350, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (224, 1353, 361, '2016-05-29 19:55:16.850642', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (225, 1358, 369, '2016-05-29 19:55:17.618736', 1359, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (226, 1360, 370, '2016-05-29 19:55:17.664242', 1361, NULL, '2016-05-29 19:55:17.662');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (227, 1360, 371, '2016-05-29 19:55:17.669279', 1361, NULL, '2016-05-29 19:55:17.667');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (228, 1360, 372, '2016-05-29 19:55:17.679972', 1361, NULL, '2016-05-29 19:55:17.677');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (229, 1360, 373, '2016-05-29 19:55:17.685383', 1361, NULL, '2016-05-29 19:55:17.683');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (230, 1360, 374, '2016-05-29 19:55:17.692558', 1361, NULL, '2016-05-29 19:55:17.69');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (231, 1360, 375, '2016-05-29 19:55:17.698893', 1361, NULL, '2016-05-29 19:55:17.697');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (232, 1360, 376, '2016-05-29 19:55:17.704954', 1361, NULL, '2016-05-29 19:55:17.702');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (233, 1360, 377, '2016-05-29 19:55:17.709272', 1361, NULL, '2016-05-29 19:55:17.708');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (234, 1360, 378, '2016-05-29 19:55:17.716127', 1361, NULL, '2016-05-29 19:55:17.715');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (235, 1360, 379, '2016-05-29 19:55:17.721956', 1361, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (236, 1362, 380, '2016-05-29 19:55:17.766078', 1363, NULL, NULL);


--
-- TOC entry 2334 (class 0 OID 25963)
-- Dependencies: 209
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 210
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 211
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 212
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 237, true);


--
-- TOC entry 2338 (class 0 OID 25972)
-- Dependencies: 213
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_credentials (id, email, password) VALUES (1325, '1463345069130test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1327, '1463345113110test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1328, '1463345113379test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1329, '1463345113408test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1330, '1463345113481test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1331, '1463345133493test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1332, '1463345144335test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1333, '1463345144508test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1334, '1463345144580test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1335, '1463345144585test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1336, '1463345144825test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1337, '1463345144845test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1338, '1463345144869test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1339, '1464205707081test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1340, '1464205710908test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1341, '1464205711798test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1342, '1464205711835test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1343, '1464205711873test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1344, '1464205712045test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1345, '1464205712216test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1346, '1464205712223test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1347, '1464205712250test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1348, '1464205712256test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1349, '1464205712372test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1350, '1464205712390test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1351, '1464205712414test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1352, '1464540894979test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1353, '1464540915399test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1354, '1464540917199test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1355, '1464540917239test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1356, '1464540917277test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1357, '1464540917431test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1358, '1464540917595test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1359, '1464540917601test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1360, '1464540917637test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1361, '1464540917641test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1362, '1464540917738test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1363, '1464540917754test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1364, '1464540917780test@gmail.com', 'pass');


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1364, true);


--
-- TOC entry 2340 (class 0 OID 25977)
-- Dependencies: 215
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1327, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.113769', 2, 0, '1463345113110', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1328, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.381243', 2, 0, '1463345113379', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1329, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.410448', 2, 0, '1463345113408', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1330, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.483034', 2, 0, '1463345113481', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1325, 'OtherFirstName', 'OtherLastName', '2016-05-15 23:44:29.131999', 2, 2, '(095)-1234-54321', 'Grodno, ul.NewStreet');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1331, 'Ivan', 'Ivanov', '2016-05-15 23:45:33.494926', 2, 0, '1463345133493', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1332, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.477077', 2, 2, '1463345144335', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1333, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.510374', 2, 1, '1463345144508', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1334, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.582419', 2, 2, '1463345144580', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1335, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.586865', 2, 1, '1463345144585', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1336, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.82832', 2, 2, '1463345144825', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1337, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.847501', 2, 1, '1463345144845', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1338, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.871959', 2, 2, '1463345144869', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1339, 'Ivan', 'Ivanov', '2016-05-25 22:48:27.083766', 2, 0, '1464205707081', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1340, 'Ivan', 'Ivanov', '2016-05-25 22:48:30.911407', 2, 0, '1464205710908', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1341, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.799558', 2, 0, '1464205711798', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1342, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.839979', 2, 0, '1464205711835', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1343, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.875094', 2, 0, '1464205711873', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1344, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.046699', 2, 0, '1464205712045', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1345, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.21797', 2, 2, '1464205712216', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1346, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.225329', 2, 1, '1464205712223', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1347, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.252695', 2, 2, '1464205712250', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1348, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.259604', 2, 1, '1464205712256', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1349, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.374532', 2, 2, '1464205712372', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1350, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.392133', 2, 1, '1464205712390', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1351, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.416024', 2, 2, '1464205712414', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1352, 'Ivan', 'Ivanov', '2016-05-29 19:54:54.9816', 2, 0, '1464540894979', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1353, 'Ivan', 'Ivanov', '2016-05-29 19:55:15.401575', 2, 0, '1464540915399', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1354, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.200854', 2, 0, '1464540917199', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1355, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.241385', 2, 0, '1464540917239', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1356, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.281988', 2, 0, '1464540917277', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1357, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.433016', 2, 0, '1464540917431', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1358, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.598944', 2, 2, '1464540917595', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1359, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.602439', 2, 1, '1464540917601', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1360, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.638313', 2, 2, '1464540917637', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1361, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.647741', 2, 1, '1464540917641', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1362, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.739822', 2, 2, '1464540917738', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1363, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.755837', 2, 1, '1464540917754', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, user_state, role, phone, address) VALUES (1364, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.782079', 2, 2, '1464540917780', 'Grodno, ul.Gorkogo, 89');


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2146 (class 2606 OID 25996)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2148 (class 2606 OID 25998)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2150 (class 2606 OID 26000)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 26002)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2158 (class 2606 OID 26004)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2152 (class 2606 OID 26006)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2154 (class 2606 OID 26008)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 26010)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2163 (class 2606 OID 26012)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 26014)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2171 (class 2606 OID 26016)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);


--
-- TOC entry 2167 (class 2606 OID 26018)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 26020)
-- Name: department_type_phone_address_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);


--
-- TOC entry 2175 (class 2606 OID 26022)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2173 (class 2606 OID 26024)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 26026)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2179 (class 2606 OID 26028)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2181 (class 2606 OID 26030)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 26032)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2185 (class 2606 OID 26034)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2159 (class 1259 OID 26035)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2186 (class 2606 OID 26036)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2188 (class 2606 OID 26041)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2189 (class 2606 OID 26046)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2190 (class 2606 OID 26051)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2191 (class 2606 OID 26056)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2187 (class 2606 OID 26061)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2192 (class 2606 OID 26066)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2193 (class 2606 OID 26071)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2194 (class 2606 OID 26076)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2195 (class 2606 OID 26081)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2196 (class 2606 OID 26086)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2200 (class 2606 OID 26091)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2201 (class 2606 OID 26096)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2197 (class 2606 OID 26101)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2198 (class 2606 OID 26106)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2199 (class 2606 OID 26111)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2202 (class 2606 OID 26116)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-05-30 01:07:08

--
-- PostgreSQL database dump complete
--

