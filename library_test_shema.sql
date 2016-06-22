PGDMP         "                t            library    9.5.2    9.5.2 w    9	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            :	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    58605    test    SCHEMA        CREATE SCHEMA test;
    DROP SCHEMA test;
             postgres    false            �            1259    58606 	   abonement    TABLE     �   CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);
    DROP TABLE test.abonement;
       test         postgres    false    18            �            1259    58609    author    TABLE     �   CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);
    DROP TABLE test.author;
       test         postgres    false    18            �            1259    58612    author_id_seq    SEQUENCE     o   CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE test.author_id_seq;
       test       postgres    false    220    18            ;	           0    0    author_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE author_id_seq OWNED BY author.id;
            test       postgres    false    221            �            1259    58614    book_id_seq    SEQUENCE     m   CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE test.book_id_seq;
       test       postgres    false    18            �            1259    58616    book    TABLE     =  CREATE TABLE book (
    id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    catalog_id integer,
    title character varying(200) NOT NULL,
    pages integer NOT NULL,
    year timestamp without time zone NOT NULL,
    publishing_office character varying(200) NOT NULL,
    isbn character varying(50)
);
    DROP TABLE test.book;
       test         postgres    false    222    18            �            1259    58620    book_2_author    TABLE     ]   CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE test.book_2_author;
       test         postgres    false    18            �            1259    58623    book_2_comment    TABLE     _   CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);
     DROP TABLE test.book_2_comment;
       test         postgres    false    18            �            1259    58626    catalog    TABLE     t   CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);
    DROP TABLE test.catalog;
       test         postgres    false    18            �            1259    58629    catalog_id_seq    SEQUENCE     p   CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.catalog_id_seq;
       test       postgres    false    18    226            <	           0    0    catalog_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;
            test       postgres    false    227            �            1259    58631    comment    TABLE     �   CREATE TABLE comment (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    like_count integer,
    dislike_count integer
);
    DROP TABLE test.comment;
       test         postgres    false    18            �            1259    58635    comment_id_seq    SEQUENCE     p   CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.comment_id_seq;
       test       postgres    false    228    18            =	           0    0    comment_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE comment_id_seq OWNED BY comment.id;
            test       postgres    false    229            �            1259    58637 	   copy_book    TABLE     v   CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE test.copy_book;
       test         postgres    false    18            �            1259    58640    copy_book_id_seq    SEQUENCE     r   CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE test.copy_book_id_seq;
       test       postgres    false    230    18            >	           0    0    copy_book_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;
            test       postgres    false    231            �            1259    58642 
   department    TABLE     �   CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type integer NOT NULL,
    phone character varying NOT NULL,
    address character varying(250) NOT NULL
);
    DROP TABLE test.department;
       test         postgres    false    18            �            1259    58648    department_2_user_profile    TABLE     u   CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);
 +   DROP TABLE test.department_2_user_profile;
       test         postgres    false    18            �            1259    58651    department_id_seq    SEQUENCE     s   CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE test.department_id_seq;
       test       postgres    false    232    18            ?	           0    0    department_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE department_id_seq OWNED BY department.id;
            test       postgres    false    234            �            1259    58653    issue    TABLE       CREATE TABLE issue (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    planned_date_return timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);
    DROP TABLE test.issue;
       test         postgres    false    18            �            1259    58656    issuing_journal_id_seq    SEQUENCE     x   CREATE SEQUENCE issuing_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE test.issuing_journal_id_seq;
       test       postgres    false    235    18            @	           0    0    issuing_journal_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE issuing_journal_id_seq OWNED BY issue.id;
            test       postgres    false    236            �            1259    58658    order    TABLE     |  CREATE TABLE "order" (
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
    DROP TABLE test."order";
       test         postgres    false    18            �            1259    58661    order_2_comment    TABLE     a   CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);
 !   DROP TABLE test.order_2_comment;
       test         postgres    false    18            �            1259    58664    order_2_comment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE test.order_2_comment_comment_id_seq;
       test       postgres    false    238    18            A	           0    0    order_2_comment_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;
            test       postgres    false    239            �            1259    58666    order_2_comment_order_id_seq    SEQUENCE     ~   CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE test.order_2_comment_order_id_seq;
       test       postgres    false    18    238            B	           0    0    order_2_comment_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;
            test       postgres    false    240            �            1259    58668    order_id_seq    SEQUENCE     n   CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE test.order_id_seq;
       test       postgres    false    18    237            C	           0    0    order_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE order_id_seq OWNED BY "order".id;
            test       postgres    false    241            �            1259    58670    user_credentials    TABLE     �   CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
 "   DROP TABLE test.user_credentials;
       test         postgres    false    18            �            1259    58673    user_credentials_id_seq    SEQUENCE     y   CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE test.user_credentials_id_seq;
       test       postgres    false    242    18            D	           0    0    user_credentials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;
            test       postgres    false    243            �            1259    58675    user_profile    TABLE     d  CREATE TABLE user_profile (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    state integer NOT NULL,
    role integer NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(250) NOT NULL
);
    DROP TABLE test.user_profile;
       test         postgres    false    18            �            1259    58682    user_profile_id_seq    SEQUENCE     u   CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE test.user_profile_id_seq;
       test       postgres    false    18    244            E	           0    0    user_profile_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;
            test       postgres    false    245            _           2604    58684    id    DEFAULT     X   ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);
 6   ALTER TABLE test.author ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    221    220            a           2604    58685    id    DEFAULT     Z   ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);
 7   ALTER TABLE test.catalog ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    227    226            c           2604    58686    id    DEFAULT     Z   ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);
 7   ALTER TABLE test.comment ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    229    228            d           2604    58687    id    DEFAULT     ^   ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);
 9   ALTER TABLE test.copy_book ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    231    230            e           2604    58688    id    DEFAULT     `   ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);
 :   ALTER TABLE test.department ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    234    232            f           2604    58689    id    DEFAULT     `   ALTER TABLE ONLY issue ALTER COLUMN id SET DEFAULT nextval('issuing_journal_id_seq'::regclass);
 5   ALTER TABLE test.issue ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    236    235            g           2604    58690    id    DEFAULT     X   ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);
 7   ALTER TABLE test."order" ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    241    237            h           2604    58691 
   comment_id    DEFAULT     z   ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);
 G   ALTER TABLE test.order_2_comment ALTER COLUMN comment_id DROP DEFAULT;
       test       postgres    false    239    238            i           2604    58692    order_id    DEFAULT     v   ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);
 E   ALTER TABLE test.order_2_comment ALTER COLUMN order_id DROP DEFAULT;
       test       postgres    false    240    238            j           2604    58693    id    DEFAULT     l   ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);
 @   ALTER TABLE test.user_credentials ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    243    242            	          0    58606 	   abonement 
   TABLE DATA                     test       postgres    false    219   ��       	          0    58609    author 
   TABLE DATA                     test       postgres    false    220   ��       F	           0    0    author_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('author_id_seq', 375, true);
            test       postgres    false    221             	          0    58616    book 
   TABLE DATA                     test       postgres    false    223   ��       !	          0    58620    book_2_author 
   TABLE DATA                     test       postgres    false    224   5�       "	          0    58623    book_2_comment 
   TABLE DATA                     test       postgres    false    225   ��       G	           0    0    book_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('book_id_seq', 1794, true);
            test       postgres    false    222            #	          0    58626    catalog 
   TABLE DATA                     test       postgres    false    226   �       H	           0    0    catalog_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('catalog_id_seq', 4548, true);
            test       postgres    false    227            %	          0    58631    comment 
   TABLE DATA                     test       postgres    false    228   �       I	           0    0    comment_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('comment_id_seq', 659, true);
            test       postgres    false    229            '	          0    58637 	   copy_book 
   TABLE DATA                     test       postgres    false    230   ��       J	           0    0    copy_book_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('copy_book_id_seq', 393, true);
            test       postgres    false    231            )	          0    58642 
   department 
   TABLE DATA                     test       postgres    false    232   �       *	          0    58648    department_2_user_profile 
   TABLE DATA                     test       postgres    false    233   ��       K	           0    0    department_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('department_id_seq', 277, true);
            test       postgres    false    234            ,	          0    58653    issue 
   TABLE DATA                     test       postgres    false    235   ͍       L	           0    0    issuing_journal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('issuing_journal_id_seq', 3, true);
            test       postgres    false    236            .	          0    58658    order 
   TABLE DATA                     test       postgres    false    237   ��       /	          0    58661    order_2_comment 
   TABLE DATA                     test       postgres    false    238   ��       M	           0    0    order_2_comment_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);
            test       postgres    false    239            N	           0    0    order_2_comment_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);
            test       postgres    false    240            O	           0    0    order_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('order_id_seq', 268, true);
            test       postgres    false    241            3	          0    58670    user_credentials 
   TABLE DATA                     test       postgres    false    242   ��       P	           0    0    user_credentials_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('user_credentials_id_seq', 1379, true);
            test       postgres    false    243            5	          0    58675    user_profile 
   TABLE DATA                     test       postgres    false    244   ��       Q	           0    0    user_profile_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('user_profile_id_seq', 1, false);
            test       postgres    false    245            m           2606    58695    abonement_pk 
   CONSTRAINT     S   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);
 >   ALTER TABLE ONLY test.abonement DROP CONSTRAINT abonement_pk;
       test         postgres    false    219    219            o           2606    58697 !   author_first_name_second_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);
 P   ALTER TABLE ONLY test.author DROP CONSTRAINT author_first_name_second_name_key;
       test         postgres    false    220    220    220            q           2606    58699 	   author_pk 
   CONSTRAINT     G   ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY test.author DROP CONSTRAINT author_pk;
       test         postgres    false    220    220            w           2606    58701 #   book_2_author_book_id_author_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);
 Y   ALTER TABLE ONLY test.book_2_author DROP CONSTRAINT book_2_author_book_id_author_id_key;
       test         postgres    false    224    224    224            y           2606    58703    book_2_comment_pk 
   CONSTRAINT     _   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);
 H   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_pk;
       test         postgres    false    225    225            s           2606    58705    book_isbn_key 
   CONSTRAINT     F   ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);
 :   ALTER TABLE ONLY test.book DROP CONSTRAINT book_isbn_key;
       test         postgres    false    223    223            u           2606    58707 	   book_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY test.book DROP CONSTRAINT book_pkey;
       test         postgres    false    223    223            |           2606    58709 
   catalog_pk 
   CONSTRAINT     I   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY test.catalog DROP CONSTRAINT catalog_pk;
       test         postgres    false    226    226            ~           2606    58711 
   comment_pk 
   CONSTRAINT     I   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY test.comment DROP CONSTRAINT comment_pk;
       test         postgres    false    228    228            �           2606    58713    copy_book_pk 
   CONSTRAINT     M   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY test.copy_book DROP CONSTRAINT copy_book_pk;
       test         postgres    false    230    230            �           2606    58715 *   department_2_user_profile_user_profile_key 
   CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);
 l   ALTER TABLE ONLY test.department_2_user_profile DROP CONSTRAINT department_2_user_profile_user_profile_key;
       test         postgres    false    233    233            �           2606    58717    department_pk 
   CONSTRAINT     O   ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY test.department DROP CONSTRAINT department_pk;
       test         postgres    false    232    232            �           2606    58719 !   department_type_phone_address_key 
   CONSTRAINT     p   ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);
 T   ALTER TABLE ONLY test.department DROP CONSTRAINT department_type_phone_address_key;
       test         postgres    false    232    232    232    232            �           2606    58721    issuing_journal_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY test.issue DROP CONSTRAINT issuing_journal_pkey;
       test         postgres    false    235    235            �           2606    58723    order_2_comment_pk 
   CONSTRAINT     a   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);
 J   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_pk;
       test         postgres    false    238    238            �           2606    58725    order_pk 
   CONSTRAINT     G   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_pk;
       test         postgres    false    237    237            �           2606    58727    user_credentials_email_key 
   CONSTRAINT     `   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);
 S   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_email_key;
       test         postgres    false    242    242            �           2606    58729 #   user_credentials_email_password_key 
   CONSTRAINT     s   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);
 \   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_email_password_key;
       test         postgres    false    242    242    242            �           2606    58731    user_credentials_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_pk;
       test         postgres    false    242    242            �           2606    58733    user_profile_phone_key 
   CONSTRAINT     X   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);
 K   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_phone_key;
       test         postgres    false    244    244            �           2606    58735    user_profile_pk 
   CONSTRAINT     S   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_pk;
       test         postgres    false    244    244            z           1259    58736    fki_book_fk1    INDEX     C   CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);
    DROP INDEX test.fki_book_fk1;
       test         postgres    false    225            �           2606    58737    abonement_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);
 ?   ALTER TABLE ONLY test.abonement DROP CONSTRAINT abonement_fk0;
       test       postgres    false    2186    219    237            �           2606    58742    book_2_author_author_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);
 R   ALTER TABLE ONLY test.book_2_author DROP CONSTRAINT book_2_author_author_id_fkey;
       test       postgres    false    220    2161    224            �           2606    58747    book_2_author_book_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);
 P   ALTER TABLE ONLY test.book_2_author DROP CONSTRAINT book_2_author_book_id_fkey;
       test       postgres    false    2165    224    223            �           2606    58752    book_2_comment_book_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);
 R   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_book_id_fkey;
       test       postgres    false    2165    223    225            �           2606    58757    book_2_comment_fk0    FK CONSTRAINT     w   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 I   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_fk0;
       test       postgres    false    228    2174    225            �           2606    58762    book_fk0    FK CONSTRAINT     c   ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);
 5   ALTER TABLE ONLY test.book DROP CONSTRAINT book_fk0;
       test       postgres    false    223    226    2172            �           2606    58767    catalog_fk0    FK CONSTRAINT     a   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);
 ;   ALTER TABLE ONLY test.catalog DROP CONSTRAINT catalog_fk0;
       test       postgres    false    2172    226    226            �           2606    58772    comment_fk0    FK CONSTRAINT     s   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);
 ;   ALTER TABLE ONLY test.comment DROP CONSTRAINT comment_fk0;
       test       postgres    false    228    2198    244            �           2606    58777    copy_book_fk1    FK CONSTRAINT     s   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);
 ?   ALTER TABLE ONLY test.copy_book DROP CONSTRAINT copy_book_fk1;
       test       postgres    false    232    230    2178            �           2606    58782 ,   department_2_user_profile_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);
 n   ALTER TABLE ONLY test.department_2_user_profile DROP CONSTRAINT department_2_user_profile_department_id_fkey;
       test       postgres    false    233    2178    232            �           2606    58787 +   department_2_user_profile_user_profile_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);
 m   ALTER TABLE ONLY test.department_2_user_profile DROP CONSTRAINT department_2_user_profile_user_profile_fkey;
       test       postgres    false    244    2198    233            �           2606    58792 !   issuing_journal_copy_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_copy_book_id_fkey FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);
 O   ALTER TABLE ONLY test.issue DROP CONSTRAINT issuing_journal_copy_book_id_fkey;
       test       postgres    false    235    2176    230            �           2606    58797    issuing_journal_reader_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES user_profile(id);
 L   ALTER TABLE ONLY test.issue DROP CONSTRAINT issuing_journal_reader_id_fkey;
       test       postgres    false    244    2198    235            �           2606    58802    order_2_comment_fk0    FK CONSTRAINT     y   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 K   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_fk0;
       test       postgres    false    228    238    2174            �           2606    58807    order_2_comment_fk1    FK CONSTRAINT     w   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);
 K   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_fk1;
       test       postgres    false    2186    237    238            �           2606    58812 	   order_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk0;
       test       postgres    false    244    237    2198            �           2606    58817 	   order_fk1    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk1;
       test       postgres    false    237    2176    230            �           2606    58822 	   order_fk2    FK CONSTRAINT     n   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk2;
       test       postgres    false    244    2198    237            �           2606    58827    user_profile_fk0    FK CONSTRAINT     t   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);
 E   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_fk0;
       test       postgres    false    242    244    2194            	   
   x���          	   �  x����jSA��}��K]��3wpU���T�խ\LJ�0�����^�W�b���a�F�3��B;��O
)�I~߽ߜ�ݽ��������y4�V��fu0:��7���t�v2��7��篶��u��f�K_�u�HW�~���ʏ�q�����t�n{O�v�]�3p<���j%���+��K�vdU�j�Ր��5��G��=���w������Z���F��_�|�슴��GP�0��.�D�?m�S�IR�R��B�J����$���� �/�Q���3��$X#u������A�%w��Ap\�����w��6��}�I�l�JxX� Qiv��Dk%;醛�){|�Ί5gRl�i^PL w���L���o���K˾�2:����D�O�qp�`�ё,��h�y�W���'�L ���o	�N���?��{|�P~X���):����t>
��U��bp�a�N��(�?����G�##�GW�ud$D][0�##!Q���|o����|��~ӭ�V܁�����ҝQ`"|9q�'��/'���_N��yn����L�b@�4���h�\�`~1#�8K�PǊS��km�����{,'|na�?TL\�{t�]�b�bШcũ����:V�J�O讃ʉc�s�X*'N�ރ���RV��!�:2BA�W$td��1���P�J�7�N�P�J·
M\Xa*e��������e       	   �  x����NQ�{�b;�dV�g6U

$ R��Ȁ!V�� ���ة�Kq]\ےw����sfί�Ͼ��W7_�����p�z�������nw��z}Y·_���v>�Y.~�����j�}�~��<=���j{�>�}��=�����Q��0�>�޳<��qF�v
v�0 L�O^��/ߗ�}u{qq�����{F>����[>���"'�Iht���b��[�aqv-��p�+l���HV*XV��Pa�[`��k,U�l$��j`���ak�B"P�@@����!�^k6��ԝB�����,Qxa
+y�Yrl�`bXDK�k�l����n�Ai=$� ����e�vֺ�!� �^�S_��H��jX��&PR	,}5��
k#j�]�)՝P-�3+���|�]XP�UJ(�j_�r:��ԓARf�@�l��լs+lI��:0+�H��\�/����E-Y�@8y�@�f�-���^�9�H���
:�W�ǖ�`�Li����w��r +�^��B�l,���՜	[jd9Q�K.	
}��ۖ�8�(u|�$K����a�J� ���&��v�|�d-5w���M&�b�.-R�A@�5Xrr�\ن���=u;:�+��i�2�a��!�6���Q�ҀۮMs53I��K�a2	N�c.�� ˲Si7�*����/6��x      !	   �   x��Ի
�0�=Oq�:4�悓C��T�յ(�@��or���d�H��O�4����\��wU��wli����wG� /[z�/�q�F:k:�2�'B���[h�
'B��	#qzH%�r��N@嬄�����	�����T!�1�4�LX���X�������w:,L`�d�DK�?�3М      "	   
   x���          #	   �   x��ұ�0Н�x��0����@B0u5�4RS�)/~�Oc�N���{soմ��Us܃�(��Al�Р�)<��#^L��yW��b�3����"��T��6�f)�Ԫ��6[6��TA�]>%9﮳��י�7��%ij�B������h�zG�}c����3���?0F�wW���H3&/r.ت�E�&�`      %	   
   x���          '	   �   x��Խ�0��(	��6N$AW��`�B�o/W�>���\�_�w��n��܉��N�1Ϳ�>M/�{����b��wy��e���z8^�V촃BHpf=���YM��e�Ւ��TK�e=Z�j�ؗf�l�J�壥X��,�}�hIF��P��5�e-�h9F+�_�M�=Ƭ��h�bVqj
�a�Yũ)�Tk�*��֖U��V���=�6      )	   �  x���Mk$7���}�.A�*}�SK0�ě����c���S��x�6/�y/,ӣ��Q��嫏�~�4\}���nO���4��k�7��n8���?>�q��?�OO�?~����û��n�<��_t�z�t�-��Y�P��������p�_�~8����8����?^\�o�#� $��b� ��r�^Y���Z�J�u�ۉdx޾	A�E5p%�H�4����m�Q�0R��Aj8R�ܸ��qB*����qBj�����#��9Ho�q"��;3��`f�.k�g>cf�����g،5T�(!fT	>�$	1��Jr3r�
b�	�j☱ f���3Č)f,�#Y� ��e=��y
���k�&���.K!�'LC�f�l5d��4�+�!��(UPC�d�y�*�!GJ�#�
j�#���j8R�G�m3:I�̸�oB �ѻl��UЌf%N4Ta3z��I�f�jٗ��fFG�Y7̌)	'um�'$#�f�	)qdݐ�zA*Y��;����zm߄ 3��%i��af�HE(�YlF)�2u$@f�RU�Qd-2c���g�bF	�;���)q6�$@f��Xs	�xt�5(%�� ŵZ���\Vdo�Q#M�����-"'���[ݔ!f�=��,(�w5M���0{;R���E���H����'$#�8��5Gu)ZA{;�I��)e�(���H�'N@{�ԂR2I�ގ�s���#Y��K�ۑH[�"��k��sh#�ۑH	�h��IH��;R���ٻ���7i.a��HBJ��wGJ��(f9������qK�8�b��.D���w��J��ފٻ�ʣ�	N�w��p쭘��+P�ޖb�({+doGr���)���dJB��=#q�� {;������=!�(W��򵳮��$�����M 3v"#�܊Af��Hѿ�f4�����P3:R� !P&!��rb� jF��t����F	0�$!p��ĵ+�"J�"��tn�^Wb!�-?_?��7! ̸t�gP 3�H�-d� jAR����Ʉ���5t{�`X��~�_���p�=n�K7������3/Eq�/�8�O�g�-��K@���%_b�i}Ej�r�zȩ	'�Ej�f�H��H-Ԋ�8A�T��ʱ�D�&�8k߂ )}Z�$�?��>-H�yK[�ҧ�p�R�4#�T�J��)s��� Z\�J$�8X֥������	�_����r�      *	   
   x���          ,	   �   x���1�0��_q�r('���kS����7"х8��w���e��ΐ��#4�88�f`Hi2�u���!�}�.K���Zb0�Uב����4�n�����P�Yg�<f����1
/�y�"����?SY����xïw���a�����kYOO1b�      .	   
   x���          /	   
   x���          3	   �   x��Աj�0��O�M	�`��I�K2d0���kQbQ�$�ҷ�	�Z:�uH�?���a�?�zw|a����s������ə�\hsvu)}]b�do����-�J����a�1]Z�/�M��)��d5&���z�[���}0;�ՆSt1�����쩓R(#���oAӻ��A��%d!-AA���UTP� �$TaH$1d
*H!H� ���C�2�d�������@+��      5	   �  x���_k�0 ��|
�%��NN��Е@Iai�Z�E]ͼ��n��'�ٚ���
�϶d�~��7ۋ�7l���fϽ�wO�{hZ�ͮ`�}������~��\���6��}�n�]�/ٷ�W�[� ��`���<D�#r�+�a ����!K��,?���i��l��4[�#aT��ã�_�n�K��\կ7&�Z�b(*)+�%�־ܪ�
Pȕ�a|��w�}W��ܸ���;7��1d�6���M����8�����K��c] �	�i�b.;���х4���k�2%?��唁8��J���Ћ2��T�Z+�Jks��i]���{>�I�P�A����-�!�L	���QHj��x:�Z��X��)���Q�"́��-B;�$Zd!�"#&	����A"�%�<R�-��(*�B\Y����A��%��б��a�ԭ>Pr�U���o��'�VEfAI�� �D�B���g�?큡     