--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-06-03 15:33:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 16 (class 2615 OID 28828)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA test;


SET search_path = test, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 215 (class 1259 OID 29039)
-- Name: abonement; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);


--
-- TOC entry 216 (class 1259 OID 29042)
-- Name: author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29045)
-- Name: author_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 217
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- TOC entry 218 (class 1259 OID 29047)
-- Name: book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 219 (class 1259 OID 29049)
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
-- TOC entry 220 (class 1259 OID 29053)
-- Name: book_2_author; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 29056)
-- Name: book_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29059)
-- Name: catalog; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);


--
-- TOC entry 223 (class 1259 OID 29062)
-- Name: catalog_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 223
-- Name: catalog_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;


--
-- TOC entry 224 (class 1259 OID 29064)
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
-- TOC entry 225 (class 1259 OID 29068)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 225
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- TOC entry 226 (class 1259 OID 29070)
-- Name: copy_book; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 29073)
-- Name: copy_book_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 227
-- Name: copy_book_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;


--
-- TOC entry 228 (class 1259 OID 29075)
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
-- TOC entry 229 (class 1259 OID 29081)
-- Name: department_2_user_profile; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 29084)
-- Name: department_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 230
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- TOC entry 231 (class 1259 OID 29086)
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
-- TOC entry 232 (class 1259 OID 29090)
-- Name: order_2_comment; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 29093)
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;


--
-- TOC entry 234 (class 1259 OID 29095)
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;


--
-- TOC entry 235 (class 1259 OID 29097)
-- Name: order_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 235
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE order_id_seq OWNED BY "order".id;


--
-- TOC entry 236 (class 1259 OID 29099)
-- Name: user_credentials; Type: TABLE; Schema: test; Owner: -
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 29102)
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 237
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- TOC entry 238 (class 1259 OID 29104)
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
-- TOC entry 239 (class 1259 OID 29111)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: test; Owner: -
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: test; Owner: -
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 2130 (class 2604 OID 29113)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 29114)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 29115)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 29116)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 29117)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 29118)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 29119)
-- Name: comment_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 29120)
-- Name: order_id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 29121)
-- Name: id; Type: DEFAULT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- TOC entry 2315 (class 0 OID 29039)
-- Dependencies: 215
-- Data for Name: abonement; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2316 (class 0 OID 29042)
-- Dependencies: 216
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
INSERT INTO author (id, first_name, second_name) VALUES (349, 'Anton', 'Chehov 1464615424116');
INSERT INTO author (id, first_name, second_name) VALUES (350, 'Anton', 'Chehov 1464615424923');
INSERT INTO author (id, first_name, second_name) VALUES (351, 'Anton', 'Chehov 1464615425972');
INSERT INTO author (id, first_name, second_name) VALUES (352, 'Anton', 'Chehov 1464615426076');
INSERT INTO author (id, first_name, second_name) VALUES (353, 'Anton', 'Chehov 1464615426086');
INSERT INTO author (id, first_name, second_name) VALUES (354, 'new first name', 'new second name 1464615426143');
INSERT INTO author (id, first_name, second_name) VALUES (355, 'Anton', 'Chehov 1464633306283');
INSERT INTO author (id, first_name, second_name) VALUES (356, 'Anton', 'Chehov 1464633306837');
INSERT INTO author (id, first_name, second_name) VALUES (357, 'Anton', 'Chehov 1464633307260');
INSERT INTO author (id, first_name, second_name) VALUES (358, 'Anton', 'Chehov 1464724891678');
INSERT INTO author (id, first_name, second_name) VALUES (359, 'Anton', 'Chehov 1464724892018');
INSERT INTO author (id, first_name, second_name) VALUES (360, 'Anton', 'Chehov 1464724892407');
INSERT INTO author (id, first_name, second_name) VALUES (361, 'Anton', 'Chehov 1464724892454');
INSERT INTO author (id, first_name, second_name) VALUES (362, 'Anton', 'Chehov 1464724892462');
INSERT INTO author (id, first_name, second_name) VALUES (363, 'new first name', 'new second name 1464724892660');
INSERT INTO author (id, first_name, second_name) VALUES (364, 'Anton', 'Chehov 1464811646067');
INSERT INTO author (id, first_name, second_name) VALUES (365, 'Anton', 'Chehov 1464811646768');
INSERT INTO author (id, first_name, second_name) VALUES (366, 'Anton', 'Chehov 1464811647529');
INSERT INTO author (id, first_name, second_name) VALUES (367, 'Anton', 'Chehov 1464811647629');
INSERT INTO author (id, first_name, second_name) VALUES (368, 'Anton', 'Chehov 1464811647642');
INSERT INTO author (id, first_name, second_name) VALUES (369, 'new first name', 'new second name 1464811647779');
INSERT INTO author (id, first_name, second_name) VALUES (370, 'Anton', 'Chehov 1464813043703');
INSERT INTO author (id, first_name, second_name) VALUES (371, 'Anton', 'Chehov 1464813046085');
INSERT INTO author (id, first_name, second_name) VALUES (372, 'Anton', 'Chehov 1464813046424');
INSERT INTO author (id, first_name, second_name) VALUES (373, 'Anton', 'Chehov 1464813046515');
INSERT INTO author (id, first_name, second_name) VALUES (374, 'Anton', 'Chehov 1464813046570');
INSERT INTO author (id, first_name, second_name) VALUES (375, 'new first name', 'new second name 1464813046628');
INSERT INTO author (id, first_name, second_name) VALUES (376, 'Anton', 'Chehov 1464813500585');
INSERT INTO author (id, first_name, second_name) VALUES (377, 'Anton', 'Chehov 1464813501062');
INSERT INTO author (id, first_name, second_name) VALUES (378, 'Anton', 'Chehov 1464813501364');
INSERT INTO author (id, first_name, second_name) VALUES (379, 'Anton', 'Chehov 1464813501424');
INSERT INTO author (id, first_name, second_name) VALUES (380, 'Anton', 'Chehov 1464813501435');
INSERT INTO author (id, first_name, second_name) VALUES (381, 'new first name', 'new second name 1464813501482');
INSERT INTO author (id, first_name, second_name) VALUES (382, 'Anton', 'Chehov 1464813969740');
INSERT INTO author (id, first_name, second_name) VALUES (383, 'Anton', 'Chehov 1464813970718');
INSERT INTO author (id, first_name, second_name) VALUES (384, 'Anton', 'Chehov 1464813971027');
INSERT INTO author (id, first_name, second_name) VALUES (385, 'Anton', 'Chehov 1464813971530');
INSERT INTO author (id, first_name, second_name) VALUES (386, 'Anton', 'Chehov 1464813971546');
INSERT INTO author (id, first_name, second_name) VALUES (387, 'new first name', 'new second name 1464813971604');
INSERT INTO author (id, first_name, second_name) VALUES (388, 'Anton', 'Chehov 1464869265108');
INSERT INTO author (id, first_name, second_name) VALUES (389, 'Anton', 'Chehov 1464869266120');
INSERT INTO author (id, first_name, second_name) VALUES (390, 'Anton', 'Chehov 1464869267357');
INSERT INTO author (id, first_name, second_name) VALUES (391, 'Anton', 'Chehov 1464869267513');
INSERT INTO author (id, first_name, second_name) VALUES (392, 'Anton', 'Chehov 1464869267523');
INSERT INTO author (id, first_name, second_name) VALUES (393, 'new first name', 'new second name 1464869267611');


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 217
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('author_id_seq', 393, true);


--
-- TOC entry 2319 (class 0 OID 29049)
-- Dependencies: 219
-- Data for Name: book; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1942, NULL, 'Mumu', 234, '2016-06-02 15:07:50.388', 'Manning', '0.6472014444520588');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1943, NULL, 'Mumu', 234, '2016-06-02 15:07:52.05', 'Manning', '0.42524431471365176');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1944, NULL, 'Mumu', 234, '2016-06-02 15:07:53.248', 'Manning', '0.7674060441630206');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1945, NULL, 'Mumu', 234, '2016-06-02 15:07:53.391', 'Manning', '0.12250041992374328');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1946, NULL, 'Mumu', 234, '2016-06-02 15:07:53.445', 'Manning', '0.5881662112397279');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1947, NULL, 'Mumu', 234, '2016-06-02 15:07:53.758', 'Manning', '0.9952708694515455');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1948, NULL, 'Mumu', 234, '2016-06-02 15:07:53.791', 'Manning', '0.5886035896292162');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1949, NULL, 'Mumu', 234, '2016-06-02 15:07:54.008', 'Manning', '0.3470676127623197');
INSERT INTO book (id, catalog_id, title, pages, year, publishing_office, isbn) VALUES (1950, NULL, 'Mumu', 234, '2016-06-02 15:07:54.051', 'Manning', '0.8444575796661354');


--
-- TOC entry 2320 (class 0 OID 29053)
-- Dependencies: 220
-- Data for Name: book_2_author; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2321 (class 0 OID 29056)
-- Dependencies: 221
-- Data for Name: book_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 218
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('book_id_seq', 1950, true);


--
-- TOC entry 2322 (class 0 OID 29059)
-- Dependencies: 222
-- Data for Name: catalog; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 223
-- Name: catalog_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('catalog_id_seq', 4707, true);


--
-- TOC entry 2324 (class 0 OID 29064)
-- Dependencies: 224
-- Data for Name: comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 225
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('comment_id_seq', 805, true);


--
-- TOC entry 2326 (class 0 OID 29070)
-- Dependencies: 226
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
INSERT INTO copy_book (id, book_id, department_id) VALUES (382, 1821, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (383, 1821, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (384, 1821, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (385, 1821, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (386, 1821, 274);
INSERT INTO copy_book (id, book_id, department_id) VALUES (387, 1822, 275);
INSERT INTO copy_book (id, book_id, department_id) VALUES (389, 1838, 281);
INSERT INTO copy_book (id, book_id, department_id) VALUES (390, 1839, 282);
INSERT INTO copy_book (id, book_id, department_id) VALUES (391, 1839, 282);
INSERT INTO copy_book (id, book_id, department_id) VALUES (392, 1839, 282);
INSERT INTO copy_book (id, book_id, department_id) VALUES (393, 1839, 282);
INSERT INTO copy_book (id, book_id, department_id) VALUES (394, 1839, 282);
INSERT INTO copy_book (id, book_id, department_id) VALUES (395, 1840, 283);
INSERT INTO copy_book (id, book_id, department_id) VALUES (397, 1842, 289);
INSERT INTO copy_book (id, book_id, department_id) VALUES (398, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (399, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (400, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (401, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (402, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (403, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (404, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (405, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (406, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (407, 1843, 290);
INSERT INTO copy_book (id, book_id, department_id) VALUES (408, 1844, 291);
INSERT INTO copy_book (id, book_id, department_id) VALUES (409, 1845, 292);
INSERT INTO copy_book (id, book_id, department_id) VALUES (410, 1859, 293);
INSERT INTO copy_book (id, book_id, department_id) VALUES (411, 1860, 294);
INSERT INTO copy_book (id, book_id, department_id) VALUES (412, 1860, 294);
INSERT INTO copy_book (id, book_id, department_id) VALUES (413, 1860, 294);
INSERT INTO copy_book (id, book_id, department_id) VALUES (414, 1860, 294);
INSERT INTO copy_book (id, book_id, department_id) VALUES (415, 1860, 294);
INSERT INTO copy_book (id, book_id, department_id) VALUES (416, 1861, 295);
INSERT INTO copy_book (id, book_id, department_id) VALUES (418, 1863, 301);
INSERT INTO copy_book (id, book_id, department_id) VALUES (419, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (420, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (421, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (422, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (423, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (424, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (425, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (426, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (427, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (428, 1864, 302);
INSERT INTO copy_book (id, book_id, department_id) VALUES (429, 1865, 303);
INSERT INTO copy_book (id, book_id, department_id) VALUES (430, 1866, 304);
INSERT INTO copy_book (id, book_id, department_id) VALUES (431, 1880, 305);
INSERT INTO copy_book (id, book_id, department_id) VALUES (432, 1881, 306);
INSERT INTO copy_book (id, book_id, department_id) VALUES (433, 1881, 306);
INSERT INTO copy_book (id, book_id, department_id) VALUES (434, 1881, 306);
INSERT INTO copy_book (id, book_id, department_id) VALUES (435, 1881, 306);
INSERT INTO copy_book (id, book_id, department_id) VALUES (436, 1881, 306);
INSERT INTO copy_book (id, book_id, department_id) VALUES (437, 1882, 307);
INSERT INTO copy_book (id, book_id, department_id) VALUES (439, 1884, 313);
INSERT INTO copy_book (id, book_id, department_id) VALUES (440, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (441, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (442, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (443, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (444, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (445, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (446, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (447, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (448, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (449, 1885, 314);
INSERT INTO copy_book (id, book_id, department_id) VALUES (450, 1886, 315);
INSERT INTO copy_book (id, book_id, department_id) VALUES (451, 1887, 316);
INSERT INTO copy_book (id, book_id, department_id) VALUES (452, 1901, 317);
INSERT INTO copy_book (id, book_id, department_id) VALUES (453, 1902, 318);
INSERT INTO copy_book (id, book_id, department_id) VALUES (454, 1902, 318);
INSERT INTO copy_book (id, book_id, department_id) VALUES (455, 1902, 318);
INSERT INTO copy_book (id, book_id, department_id) VALUES (456, 1902, 318);
INSERT INTO copy_book (id, book_id, department_id) VALUES (457, 1902, 318);
INSERT INTO copy_book (id, book_id, department_id) VALUES (458, 1903, 319);
INSERT INTO copy_book (id, book_id, department_id) VALUES (460, 1905, 325);
INSERT INTO copy_book (id, book_id, department_id) VALUES (461, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (462, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (463, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (464, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (465, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (466, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (467, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (468, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (469, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (470, 1906, 326);
INSERT INTO copy_book (id, book_id, department_id) VALUES (471, 1907, 327);
INSERT INTO copy_book (id, book_id, department_id) VALUES (472, 1908, 328);
INSERT INTO copy_book (id, book_id, department_id) VALUES (473, 1922, 329);
INSERT INTO copy_book (id, book_id, department_id) VALUES (474, 1923, 330);
INSERT INTO copy_book (id, book_id, department_id) VALUES (475, 1923, 330);
INSERT INTO copy_book (id, book_id, department_id) VALUES (476, 1923, 330);
INSERT INTO copy_book (id, book_id, department_id) VALUES (477, 1923, 330);
INSERT INTO copy_book (id, book_id, department_id) VALUES (478, 1923, 330);
INSERT INTO copy_book (id, book_id, department_id) VALUES (479, 1924, 331);
INSERT INTO copy_book (id, book_id, department_id) VALUES (481, 1926, 337);
INSERT INTO copy_book (id, book_id, department_id) VALUES (482, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (483, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (484, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (485, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (486, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (487, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (488, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (489, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (490, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (491, 1927, 338);
INSERT INTO copy_book (id, book_id, department_id) VALUES (492, 1928, 339);
INSERT INTO copy_book (id, book_id, department_id) VALUES (493, 1929, 340);
INSERT INTO copy_book (id, book_id, department_id) VALUES (494, 1943, 341);
INSERT INTO copy_book (id, book_id, department_id) VALUES (495, 1944, 342);
INSERT INTO copy_book (id, book_id, department_id) VALUES (496, 1944, 342);
INSERT INTO copy_book (id, book_id, department_id) VALUES (497, 1944, 342);
INSERT INTO copy_book (id, book_id, department_id) VALUES (498, 1944, 342);
INSERT INTO copy_book (id, book_id, department_id) VALUES (499, 1944, 342);
INSERT INTO copy_book (id, book_id, department_id) VALUES (500, 1945, 343);
INSERT INTO copy_book (id, book_id, department_id) VALUES (502, 1947, 349);
INSERT INTO copy_book (id, book_id, department_id) VALUES (503, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (504, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (505, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (506, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (507, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (508, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (509, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (510, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (511, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (512, 1948, 350);
INSERT INTO copy_book (id, book_id, department_id) VALUES (513, 1949, 351);
INSERT INTO copy_book (id, book_id, department_id) VALUES (514, 1950, 352);


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 227
-- Name: copy_book_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('copy_book_id_seq', 514, true);


--
-- TOC entry 2328 (class 0 OID 29075)
-- Dependencies: 228
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
INSERT INTO department (id, name, type, phone, address) VALUES (274, 'department name', 0, 'phone 1464615428099', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (275, 'department name', 0, 'phone 1464615428449', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (276, 'department name', 0, 'phone 1464615428490', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (277, 'department name', 0, 'phone 1464615428530', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (278, 'department name', 0, 'phone 1464615428538', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (279, 'department name', 0, 'phone 1464615428552', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (280, 'new name', 1, '23451464615428612', 'grodno 1464615428612');
INSERT INTO department (id, name, type, phone, address) VALUES (281, 'department name', 0, 'phone 1464724934615', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (282, 'department name', 0, 'phone 1464724946074', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (283, 'department name', 0, 'phone 1464724946352', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (284, 'department name', 0, 'phone 1464724946380', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (285, 'department name', 0, 'phone 1464724957889', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (286, 'department name', 0, 'phone 1464724958125', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (288, 'new name', 1, '23451464724958450', 'grodno 1464724958450');
INSERT INTO department (id, name, type, phone, address) VALUES (289, 'department name', 0, 'phone 1464724969316', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (290, 'department name', 0, 'phone 1464724969388', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (291, 'department name', 0, 'phone 1464724969659', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (292, 'department name', 0, 'phone 1464724969709', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (293, 'department name', 0, 'phone 1464811650081', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (294, 'department name', 0, 'phone 1464811650642', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (295, 'department name', 0, 'phone 1464811650693', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (296, 'department name', 0, 'phone 1464811650711', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (297, 'department name', 0, 'phone 1464811650742', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (298, 'department name', 0, 'phone 1464811650760', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (299, 'department name', 0, 'phone 1464811650815', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (300, 'new name', 1, '23451464811650862', 'grodno 1464811650862');
INSERT INTO department (id, name, type, phone, address) VALUES (301, 'department name', 0, 'phone 1464811650938', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (302, 'department name', 0, 'phone 1464811650972', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (303, 'department name', 0, 'phone 1464811651086', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (304, 'department name', 0, 'phone 1464811651118', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (305, 'department name', 0, 'phone 1464813051207', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (306, 'department name', 0, 'phone 1464813052024', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (307, 'department name', 0, 'phone 1464813052203', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (308, 'department name', 0, 'phone 1464813052637', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (309, 'department name', 0, 'phone 1464813052684', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (310, 'department name', 0, 'phone 1464813052700', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (311, 'department name', 0, 'phone 1464813052746', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (312, 'new name', 1, '23451464813052840', 'grodno 1464813052840');
INSERT INTO department (id, name, type, phone, address) VALUES (313, 'department name', 0, 'phone 1464813052886', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (314, 'department name', 0, 'phone 1464813052923', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (315, 'department name', 0, 'phone 1464813053028', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (316, 'department name', 0, 'phone 1464813053068', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (317, 'department name', 0, 'phone 1464813506498', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (318, 'department name', 0, 'phone 1464813507814', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (319, 'department name', 0, 'phone 1464813508573', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (320, 'department name', 0, 'phone 1464813508699', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (321, 'department name', 0, 'phone 1464813508830', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (322, 'department name', 0, 'phone 1464813508865', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (323, 'department name', 0, 'phone 1464813508921', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (324, 'new name', 1, '23451464813509075', 'grodno 1464813509075');
INSERT INTO department (id, name, type, phone, address) VALUES (325, 'department name', 0, 'phone 1464813509205', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (326, 'department name', 0, 'phone 1464813509510', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (327, 'department name', 0, 'phone 1464813510103', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (328, 'department name', 0, 'phone 1464813510241', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (329, 'department name', 0, 'phone 1464813973030', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (330, 'department name', 0, 'phone 1464813973412', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (331, 'department name', 0, 'phone 1464813973475', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (332, 'department name', 0, 'phone 1464813973492', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (333, 'department name', 0, 'phone 1464813973523', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (334, 'department name', 0, 'phone 1464813973533', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (335, 'department name', 0, 'phone 1464813973572', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (336, 'new name', 1, '23451464813973624', 'grodno 1464813973624');
INSERT INTO department (id, name, type, phone, address) VALUES (337, 'department name', 0, 'phone 1464813973670', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (338, 'department name', 0, 'phone 1464813973710', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (339, 'department name', 0, 'phone 1464813973811', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (340, 'department name', 0, 'phone 1464813973847', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (341, 'department name', 0, 'phone 1464869272083', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (342, 'department name', 0, 'phone 1464869273275', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (343, 'department name', 0, 'phone 1464869273417', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (344, 'department name', 0, 'phone 1464869273452', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (345, 'department name', 0, 'phone 1464869273492', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (346, 'department name', 0, 'phone 1464869273501', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (347, 'department name', 0, 'phone 1464869273646', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (348, 'new name', 1, '23451464869273723', 'grodno 1464869273723');
INSERT INTO department (id, name, type, phone, address) VALUES (349, 'department name', 0, 'phone 1464869273762', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (350, 'department name', 0, 'phone 1464869273797', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (351, 'department name', 0, 'phone 1464869274012', 'Grodno, ul. departmentStreet');
INSERT INTO department (id, name, type, phone, address) VALUES (352, 'department name', 0, 'phone 1464869274055', 'Grodno, ul. departmentStreet');


--
-- TOC entry 2329 (class 0 OID 29081)
-- Dependencies: 229
-- Data for Name: department_2_user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1331, 243);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1344, 255);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1357, 267);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1380, 286);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1393, 298);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1406, 310);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1419, 322);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1432, 334);
INSERT INTO department_2_user_profile (user_profile_id, department_id) VALUES (1445, 346);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 230
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('department_id_seq', 352, true);


--
-- TOC entry 2331 (class 0 OID 29086)
-- Dependencies: 231
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
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (238, 1376, 389, '2016-05-31 23:02:14.728306', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (239, 1381, 397, '2016-05-31 23:02:49.33059', 1382, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (240, 1383, 398, '2016-05-31 23:02:49.395809', 1384, NULL, '2016-05-31 23:02:49.393');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (241, 1383, 399, '2016-05-31 23:02:49.404398', 1384, NULL, '2016-05-31 23:02:49.402');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (242, 1383, 400, '2016-05-31 23:02:49.412444', 1384, NULL, '2016-05-31 23:02:49.41');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (243, 1383, 401, '2016-05-31 23:02:49.419029', 1384, NULL, '2016-05-31 23:02:49.417');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (244, 1383, 402, '2016-05-31 23:02:49.425417', 1384, NULL, '2016-05-31 23:02:49.424');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (245, 1383, 403, '2016-05-31 23:02:49.430753', 1384, NULL, '2016-05-31 23:02:49.429');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (246, 1383, 404, '2016-05-31 23:02:49.43631', 1384, NULL, '2016-05-31 23:02:49.434');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (247, 1383, 405, '2016-05-31 23:02:49.442955', 1384, NULL, '2016-05-31 23:02:49.441');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (248, 1383, 406, '2016-05-31 23:02:49.448526', 1384, NULL, '2016-05-31 23:02:49.447');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (249, 1383, 407, '2016-05-31 23:02:49.454329', 1384, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (250, 1385, 408, '2016-05-31 23:02:49.67424', 1386, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (252, 1389, 410, '2016-06-01 23:07:30.186821', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (253, 1394, 418, '2016-06-01 23:07:30.949828', 1395, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (254, 1396, 419, '2016-06-01 23:07:30.98039', 1397, NULL, '2016-06-01 23:07:30.978');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (255, 1396, 420, '2016-06-01 23:07:31.005471', 1397, NULL, '2016-06-01 23:07:31.003');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (256, 1396, 421, '2016-06-01 23:07:31.010746', 1397, NULL, '2016-06-01 23:07:31.008');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (257, 1396, 422, '2016-06-01 23:07:31.019842', 1397, NULL, '2016-06-01 23:07:31.018');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (258, 1396, 423, '2016-06-01 23:07:31.025408', 1397, NULL, '2016-06-01 23:07:31.023');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (259, 1396, 424, '2016-06-01 23:07:31.033918', 1397, NULL, '2016-06-01 23:07:31.032');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (260, 1396, 425, '2016-06-01 23:07:31.039997', 1397, NULL, '2016-06-01 23:07:31.038');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (261, 1396, 426, '2016-06-01 23:07:31.047797', 1397, NULL, '2016-06-01 23:07:31.046');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (262, 1396, 427, '2016-06-01 23:07:31.053759', 1397, NULL, '2016-06-01 23:07:31.052');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (263, 1396, 428, '2016-06-01 23:07:31.058256', 1397, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (264, 1398, 429, '2016-06-01 23:07:31.098595', 1399, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (266, 1402, 431, '2016-06-01 23:30:51.225618', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (267, 1407, 439, '2016-06-01 23:30:52.899462', 1408, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (268, 1409, 440, '2016-06-01 23:30:52.930572', 1410, NULL, '2016-06-01 23:30:52.929');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (269, 1409, 441, '2016-06-01 23:30:52.936283', 1410, NULL, '2016-06-01 23:30:52.934');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (270, 1409, 442, '2016-06-01 23:30:52.944476', 1410, NULL, '2016-06-01 23:30:52.942');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (271, 1409, 443, '2016-06-01 23:30:52.951832', 1410, NULL, '2016-06-01 23:30:52.949');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (272, 1409, 444, '2016-06-01 23:30:52.962615', 1410, NULL, '2016-06-01 23:30:52.959');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (273, 1409, 445, '2016-06-01 23:30:52.970582', 1410, NULL, '2016-06-01 23:30:52.968');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (274, 1409, 446, '2016-06-01 23:30:52.979393', 1410, NULL, '2016-06-01 23:30:52.976');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (275, 1409, 447, '2016-06-01 23:30:52.984666', 1410, NULL, '2016-06-01 23:30:52.983');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (276, 1409, 448, '2016-06-01 23:30:52.991741', 1410, NULL, '2016-06-01 23:30:52.99');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (277, 1409, 449, '2016-06-01 23:30:53.000232', 1410, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (278, 1411, 450, '2016-06-01 23:30:53.043058', 1412, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (280, 1415, 452, '2016-06-01 23:38:26.524547', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (281, 1420, 460, '2016-06-01 23:38:29.322733', 1421, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (282, 1422, 461, '2016-06-01 23:38:29.546101', 1423, NULL, '2016-06-01 23:38:29.542');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (283, 1422, 462, '2016-06-01 23:38:29.586613', 1423, NULL, '2016-06-01 23:38:29.583');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (284, 1422, 463, '2016-06-01 23:38:29.610745', 1423, NULL, '2016-06-01 23:38:29.607');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (285, 1422, 464, '2016-06-01 23:38:29.690321', 1423, NULL, '2016-06-01 23:38:29.688');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (286, 1422, 465, '2016-06-01 23:38:29.71342', 1423, NULL, '2016-06-01 23:38:29.709');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (287, 1422, 466, '2016-06-01 23:38:29.729552', 1423, NULL, '2016-06-01 23:38:29.726');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (288, 1422, 467, '2016-06-01 23:38:29.783505', 1423, NULL, '2016-06-01 23:38:29.78');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (289, 1422, 468, '2016-06-01 23:38:29.864134', 1423, NULL, '2016-06-01 23:38:29.861');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (290, 1422, 469, '2016-06-01 23:38:29.899873', 1423, NULL, '2016-06-01 23:38:29.897');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (291, 1422, 470, '2016-06-01 23:38:29.930552', 1423, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (292, 1424, 471, '2016-06-01 23:38:30.166172', 1425, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (294, 1428, 473, '2016-06-01 23:46:13.043545', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (295, 1433, 481, '2016-06-01 23:46:13.682811', 1434, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (296, 1435, 482, '2016-06-01 23:46:13.716588', 1436, NULL, '2016-06-01 23:46:13.714');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (297, 1435, 483, '2016-06-01 23:46:13.726261', 1436, NULL, '2016-06-01 23:46:13.724');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (298, 1435, 484, '2016-06-01 23:46:13.731793', 1436, NULL, '2016-06-01 23:46:13.73');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (299, 1435, 485, '2016-06-01 23:46:13.74091', 1436, NULL, '2016-06-01 23:46:13.739');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (300, 1435, 486, '2016-06-01 23:46:13.747522', 1436, NULL, '2016-06-01 23:46:13.745');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (301, 1435, 487, '2016-06-01 23:46:13.7575', 1436, NULL, '2016-06-01 23:46:13.755');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (302, 1435, 488, '2016-06-01 23:46:13.764632', 1436, NULL, '2016-06-01 23:46:13.762');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (303, 1435, 489, '2016-06-01 23:46:13.773222', 1436, NULL, '2016-06-01 23:46:13.771');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (304, 1435, 490, '2016-06-01 23:46:13.777703', 1436, NULL, '2016-06-01 23:46:13.776');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (305, 1435, 491, '2016-06-01 23:46:13.784109', 1436, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (306, 1437, 492, '2016-06-01 23:46:13.825366', 1438, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (308, 1441, 494, '2016-06-02 15:07:52.298528', NULL, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (309, 1446, 502, '2016-06-02 15:07:53.774235', 1447, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (310, 1448, 503, '2016-06-02 15:07:53.811353', 1449, NULL, '2016-06-02 15:07:53.809');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (311, 1448, 504, '2016-06-02 15:07:53.842452', 1449, NULL, '2016-06-02 15:07:53.841');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (312, 1448, 505, '2016-06-02 15:07:53.855494', 1449, NULL, '2016-06-02 15:07:53.853');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (313, 1448, 506, '2016-06-02 15:07:53.869539', 1449, NULL, '2016-06-02 15:07:53.867');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (314, 1448, 507, '2016-06-02 15:07:53.896625', 1449, NULL, '2016-06-02 15:07:53.891');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (315, 1448, 508, '2016-06-02 15:07:53.928728', 1449, NULL, '2016-06-02 15:07:53.924');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (316, 1448, 509, '2016-06-02 15:07:53.945782', 1449, NULL, '2016-06-02 15:07:53.944');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (317, 1448, 510, '2016-06-02 15:07:53.956817', 1449, NULL, '2016-06-02 15:07:53.955');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (318, 1448, 511, '2016-06-02 15:07:53.965846', 1449, NULL, '2016-06-02 15:07:53.963');
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (319, 1448, 512, '2016-06-02 15:07:53.973872', 1449, NULL, NULL);
INSERT INTO "order" (id, reader_id, copy_book_id, created, librarian_id, handled, closed) VALUES (320, 1450, 513, '2016-06-02 15:07:54.032057', 1451, NULL, NULL);


--
-- TOC entry 2332 (class 0 OID 29090)
-- Dependencies: 232
-- Data for Name: order_2_comment; Type: TABLE DATA; Schema: test; Owner: -
--



--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 233
-- Name: order_2_comment_comment_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_2_comment_order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 235
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('order_id_seq', 321, true);


--
-- TOC entry 2336 (class 0 OID 29099)
-- Dependencies: 236
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
INSERT INTO user_credentials (id, email, password) VALUES (1375, '1464724933493test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1376, '1464724934602test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1377, '1464724934948test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1378, '1464724934984test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1379, '1464724935007test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1380, '1464724958128test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1381, '1464724969087test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1382, '1464724969289test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1383, '1464724969373test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1384, '1464724969379test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1385, '1464724969648test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1386, '1464724969667test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1387, '1464724969689test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1388, '1464811648925test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1389, '1464811650072test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1390, '1464811650491test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1391, '1464811650529test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1392, '1464811650575test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1393, '1464811650767test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1394, '1464811650888test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1395, '1464811650928test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1396, '1464811650954test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1397, '1464811650962test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1398, '1464811651077test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1399, '1464811651091test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1400, '1464811651110test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1401, '1464813049910test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1402, '1464813051189test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1403, '1464813051707test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1404, '1464813051796test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1405, '1464813051906test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1406, '1464813052707test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1407, '1464813052867test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1408, '1464813052873test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1409, '1464813052906test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1410, '1464813052912test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1411, '1464813053020test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1412, '1464813053036test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1413, '1464813053061test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1414, '1464813504070test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1415, '1464813506388test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1416, '1464813507430test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1417, '1464813507578test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1418, '1464813507635test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1419, '1464813508893test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1420, '1464813509117test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1421, '1464813509142test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1422, '1464813509341test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1423, '1464813509355test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1424, '1464813510010test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1425, '1464813510127test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1426, '1464813510205test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1427, '1464813972724test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1428, '1464813973017test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1429, '1464813973254test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1430, '1464813973303test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1431, '1464813973349test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1432, '1464813973537test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1433, '1464813973655test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1434, '1464813973661test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1435, '1464813973690test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1436, '1464813973698test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1437, '1464813973805test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1438, '1464813973820test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1439, '1464813973840test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1440, '1464869269730test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1441, '1464869272040test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1442, '1464869272894test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1443, '1464869272991test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1444, '1464869273034test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1445, '1464869273504test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1446, '1464869273741test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1447, '1464869273752test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1448, '1464869273780test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1449, '1464869273786test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1450, '1464869274002test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1451, '1464869274024test@gmail.com', 'pass');
INSERT INTO user_credentials (id, email, password) VALUES (1452, '1464869274046test@gmail.com', 'pass');


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 237
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_credentials_id_seq', 1452, true);


--
-- TOC entry 2338 (class 0 OID 29104)
-- Dependencies: 238
-- Data for Name: user_profile; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1327, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.113769', 2, 0, '1463345113110', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1328, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.381243', 2, 0, '1463345113379', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1329, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.410448', 2, 0, '1463345113408', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1330, 'Ivan', 'Ivanov', '2016-05-15 23:45:13.483034', 2, 0, '1463345113481', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1325, 'OtherFirstName', 'OtherLastName', '2016-05-15 23:44:29.131999', 2, 2, '(095)-1234-54321', 'Grodno, ul.NewStreet');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1331, 'Ivan', 'Ivanov', '2016-05-15 23:45:33.494926', 2, 0, '1463345133493', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1332, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.477077', 2, 2, '1463345144335', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1333, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.510374', 2, 1, '1463345144508', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1334, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.582419', 2, 2, '1463345144580', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1335, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.586865', 2, 1, '1463345144585', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1336, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.82832', 2, 2, '1463345144825', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1337, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.847501', 2, 1, '1463345144845', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1338, 'Ivan', 'Ivanov', '2016-05-15 23:45:44.871959', 2, 2, '1463345144869', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1339, 'Ivan', 'Ivanov', '2016-05-25 22:48:27.083766', 2, 0, '1464205707081', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1340, 'Ivan', 'Ivanov', '2016-05-25 22:48:30.911407', 2, 0, '1464205710908', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1341, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.799558', 2, 0, '1464205711798', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1342, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.839979', 2, 0, '1464205711835', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1343, 'Ivan', 'Ivanov', '2016-05-25 22:48:31.875094', 2, 0, '1464205711873', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1344, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.046699', 2, 0, '1464205712045', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1345, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.21797', 2, 2, '1464205712216', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1346, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.225329', 2, 1, '1464205712223', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1347, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.252695', 2, 2, '1464205712250', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1348, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.259604', 2, 1, '1464205712256', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1349, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.374532', 2, 2, '1464205712372', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1350, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.392133', 2, 1, '1464205712390', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1351, 'Ivan', 'Ivanov', '2016-05-25 22:48:32.416024', 2, 2, '1464205712414', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1352, 'Ivan', 'Ivanov', '2016-05-29 19:54:54.9816', 2, 0, '1464540894979', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1353, 'Ivan', 'Ivanov', '2016-05-29 19:55:15.401575', 2, 0, '1464540915399', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1354, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.200854', 2, 0, '1464540917199', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1355, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.241385', 2, 0, '1464540917239', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1356, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.281988', 2, 0, '1464540917277', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1357, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.433016', 2, 0, '1464540917431', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1358, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.598944', 2, 2, '1464540917595', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1359, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.602439', 2, 1, '1464540917601', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1360, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.638313', 2, 2, '1464540917637', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1361, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.647741', 2, 1, '1464540917641', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1362, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.739822', 2, 2, '1464540917738', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1363, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.755837', 2, 1, '1464540917754', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1364, 'Ivan', 'Ivanov', '2016-05-29 19:55:17.782079', 2, 2, '1464540917780', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1375, 'Ivan', 'Ivanov', '2016-05-31 23:02:13.623221', 2, 0, '1464724933493', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1376, 'Ivan', 'Ivanov', '2016-05-31 23:02:14.604569', 2, 0, '1464724934602', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1377, 'Ivan', 'Ivanov', '2016-05-31 23:02:14.949992', 2, 0, '1464724934948', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1378, 'Ivan', 'Ivanov', '2016-05-31 23:02:14.986372', 2, 0, '1464724934984', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1379, 'Ivan', 'Ivanov', '2016-05-31 23:02:15.008552', 2, 0, '1464724935007', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1380, 'Ivan', 'Ivanov', '2016-05-31 23:02:38.131604', 2, 0, '1464724958128', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1381, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.226626', 2, 2, '1464724969086', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1382, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.291506', 2, 1, '1464724969289', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1383, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.375269', 2, 2, '1464724969373', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1384, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.381415', 2, 1, '1464724969379', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1385, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.650613', 2, 2, '1464724969648', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1386, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.66947', 2, 1, '1464724969667', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1387, 'Ivan', 'Ivanov', '2016-05-31 23:02:49.691493', 2, 2, '1464724969689', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1388, 'Ivan', 'Ivanov', '2016-06-01 23:07:28.927913', 2, 0, '1464811648925', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1389, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.073768', 2, 0, '1464811650072', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1390, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.493544', 2, 0, '1464811650491', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1391, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.531984', 2, 0, '1464811650529', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1392, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.57678', 2, 0, '1464811650574', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1393, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.769587', 2, 0, '1464811650767', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1394, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.922736', 2, 2, '1464811650888', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1395, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.93127', 2, 1, '1464811650928', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1396, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.956598', 2, 2, '1464811650954', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1397, 'Ivan', 'Ivanov', '2016-06-01 23:07:30.964167', 2, 1, '1464811650962', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1398, 'Ivan', 'Ivanov', '2016-06-01 23:07:31.079155', 2, 2, '1464811651077', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1399, 'Ivan', 'Ivanov', '2016-06-01 23:07:31.092561', 2, 1, '1464811651091', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1400, 'Ivan', 'Ivanov', '2016-06-01 23:07:31.112688', 2, 2, '1464811651110', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1401, 'Ivan', 'Ivanov', '2016-06-01 23:30:49.912114', 2, 0, '1464813049910', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1402, 'Ivan', 'Ivanov', '2016-06-01 23:30:51.190569', 2, 0, '1464813051189', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1403, 'Ivan', 'Ivanov', '2016-06-01 23:30:51.710336', 2, 0, '1464813051707', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1404, 'Ivan', 'Ivanov', '2016-06-01 23:30:51.799321', 2, 0, '1464813051796', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1405, 'Ivan', 'Ivanov', '2016-06-01 23:30:51.909544', 2, 0, '1464813051906', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1406, 'Ivan', 'Ivanov', '2016-06-01 23:30:52.713594', 2, 0, '1464813052707', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1407, 'Ivan', 'Ivanov', '2016-06-01 23:30:52.869063', 2, 2, '1464813052867', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1408, 'Ivan', 'Ivanov', '2016-06-01 23:30:52.874924', 2, 1, '1464813052873', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1409, 'Ivan', 'Ivanov', '2016-06-01 23:30:52.908672', 2, 2, '1464813052906', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1410, 'Ivan', 'Ivanov', '2016-06-01 23:30:52.914048', 2, 1, '1464813052912', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1411, 'Ivan', 'Ivanov', '2016-06-01 23:30:53.022119', 2, 2, '1464813053020', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1412, 'Ivan', 'Ivanov', '2016-06-01 23:30:53.038285', 2, 1, '1464813053036', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1413, 'Ivan', 'Ivanov', '2016-06-01 23:30:53.063708', 2, 2, '1464813053061', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1414, 'Ivan', 'Ivanov', '2016-06-01 23:38:24.074426', 2, 0, '1464813504069', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1415, 'Ivan', 'Ivanov', '2016-06-01 23:38:26.39078', 2, 0, '1464813506388', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1416, 'Ivan', 'Ivanov', '2016-06-01 23:38:27.434096', 2, 0, '1464813507430', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1417, 'Ivan', 'Ivanov', '2016-06-01 23:38:27.580331', 2, 0, '1464813507578', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1418, 'Ivan', 'Ivanov', '2016-06-01 23:38:27.637249', 2, 0, '1464813507635', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1419, 'Ivan', 'Ivanov', '2016-06-01 23:38:28.895686', 2, 0, '1464813508893', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1420, 'Ivan', 'Ivanov', '2016-06-01 23:38:29.120288', 2, 2, '1464813509117', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1421, 'Ivan', 'Ivanov', '2016-06-01 23:38:29.144471', 2, 1, '1464813509142', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1422, 'Ivan', 'Ivanov', '2016-06-01 23:38:29.343102', 2, 2, '1464813509341', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1423, 'Ivan', 'Ivanov', '2016-06-01 23:38:29.358018', 2, 1, '1464813509355', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1424, 'Ivan', 'Ivanov', '2016-06-01 23:38:30.012737', 2, 2, '1464813510010', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1425, 'Ivan', 'Ivanov', '2016-06-01 23:38:30.130225', 2, 1, '1464813510127', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1426, 'Ivan', 'Ivanov', '2016-06-01 23:38:30.209096', 2, 2, '1464813510205', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1427, 'Ivan', 'Ivanov', '2016-06-01 23:46:12.72684', 2, 0, '1464813972724', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1428, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.020351', 2, 0, '1464813973017', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1429, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.257384', 2, 0, '1464813973254', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1430, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.306873', 2, 0, '1464813973303', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1431, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.352041', 2, 0, '1464813973349', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1432, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.539386', 2, 0, '1464813973537', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1433, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.658103', 2, 2, '1464813973655', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1434, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.663708', 2, 1, '1464813973661', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1435, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.692166', 2, 2, '1464813973690', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1436, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.701627', 2, 1, '1464813973698', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1437, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.80678', 2, 2, '1464813973805', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1438, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.821912', 2, 1, '1464813973820', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1439, 'Ivan', 'Ivanov', '2016-06-01 23:46:13.842463', 2, 2, '1464813973840', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1440, 'Ivan', 'Ivanov', '2016-06-02 15:07:49.758425', 2, 0, '1464869269730', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1441, 'Ivan', 'Ivanov', '2016-06-02 15:07:52.042712', 2, 0, '1464869272040', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1442, 'Ivan', 'Ivanov', '2016-06-02 15:07:52.899444', 2, 0, '1464869272894', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1443, 'Ivan', 'Ivanov', '2016-06-02 15:07:52.999764', 2, 0, '1464869272991', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1444, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.037886', 2, 0, '1464869273034', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1445, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.505377', 2, 0, '1464869273504', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1446, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.742132', 2, 2, '1464869273741', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1447, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.753168', 2, 1, '1464869273752', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1448, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.781257', 2, 2, '1464869273780', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1449, 'Ivan', 'Ivanov', '2016-06-02 15:07:53.787276', 2, 1, '1464869273786', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1450, 'Ivan', 'Ivanov', '2016-06-02 15:07:54.003968', 2, 2, '1464869274002', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1451, 'Ivan', 'Ivanov', '2016-06-02 15:07:54.025035', 2, 1, '1464869274024', 'Grodno, ul.Gorkogo, 89');
INSERT INTO user_profile (id, first_name, last_name, created, state, role, phone, address) VALUES (1452, 'Ivan', 'Ivanov', '2016-06-02 15:07:54.048108', 2, 2, '1464869274046', 'Grodno, ul.Gorkogo, 89');


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: test; Owner: -
--

SELECT pg_catalog.setval('user_profile_id_seq', 1, false);


--
-- TOC entry 2144 (class 2606 OID 29124)
-- Name: abonement_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);


--
-- TOC entry 2146 (class 2606 OID 29126)
-- Name: author_first_name_second_name_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);


--
-- TOC entry 2148 (class 2606 OID 29128)
-- Name: author_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- TOC entry 2154 (class 2606 OID 29130)
-- Name: book_2_author_book_id_author_id_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);


--
-- TOC entry 2156 (class 2606 OID 29132)
-- Name: book_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2150 (class 2606 OID 29134)
-- Name: book_isbn_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);


--
-- TOC entry 2152 (class 2606 OID 29136)
-- Name: book_pkey; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2159 (class 2606 OID 29138)
-- Name: catalog_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);


--
-- TOC entry 2161 (class 2606 OID 29140)
-- Name: comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);


--
-- TOC entry 2163 (class 2606 OID 29142)
-- Name: copy_book_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 29144)
-- Name: department_2_user_profile_user_profile_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);


--
-- TOC entry 2165 (class 2606 OID 29146)
-- Name: department_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 29148)
-- Name: department_type_phone_address_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);


--
-- TOC entry 2173 (class 2606 OID 29150)
-- Name: order_2_comment_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);


--
-- TOC entry 2171 (class 2606 OID 29152)
-- Name: order_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 29154)
-- Name: user_credentials_email_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);


--
-- TOC entry 2177 (class 2606 OID 29156)
-- Name: user_credentials_email_password_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);


--
-- TOC entry 2179 (class 2606 OID 29158)
-- Name: user_credentials_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 29160)
-- Name: user_profile_phone_key; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);


--
-- TOC entry 2183 (class 2606 OID 29162)
-- Name: user_profile_pk; Type: CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);


--
-- TOC entry 2157 (class 1259 OID 29163)
-- Name: fki_book_fk1; Type: INDEX; Schema: test; Owner: -
--

CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);


--
-- TOC entry 2184 (class 2606 OID 29164)
-- Name: abonement_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2186 (class 2606 OID 29169)
-- Name: book_2_author_author_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);


--
-- TOC entry 2187 (class 2606 OID 29174)
-- Name: book_2_author_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2188 (class 2606 OID 29179)
-- Name: book_2_comment_book_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);


--
-- TOC entry 2189 (class 2606 OID 29184)
-- Name: book_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2185 (class 2606 OID 29189)
-- Name: book_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);


--
-- TOC entry 2190 (class 2606 OID 29194)
-- Name: catalog_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);


--
-- TOC entry 2191 (class 2606 OID 29199)
-- Name: comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2192 (class 2606 OID 29204)
-- Name: copy_book_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2193 (class 2606 OID 29209)
-- Name: department_2_user_profile_department_id_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 2194 (class 2606 OID 29214)
-- Name: department_2_user_profile_user_profile_fkey; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);


--
-- TOC entry 2198 (class 2606 OID 29219)
-- Name: order_2_comment_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);


--
-- TOC entry 2199 (class 2606 OID 29224)
-- Name: order_2_comment_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);


--
-- TOC entry 2195 (class 2606 OID 29229)
-- Name: order_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);


--
-- TOC entry 2196 (class 2606 OID 29234)
-- Name: order_fk1; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);


--
-- TOC entry 2197 (class 2606 OID 29239)
-- Name: order_fk2; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);


--
-- TOC entry 2200 (class 2606 OID 29244)
-- Name: user_profile_fk0; Type: FK CONSTRAINT; Schema: test; Owner: -
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);


-- Completed on 2016-06-03 15:33:04

--
-- PostgreSQL database dump complete
--

