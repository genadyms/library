PGDMP     )    "                t            library    9.5.2    9.5.2 w    9	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            :	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    58325    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �            1259    58327 	   abonement    TABLE     �   CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);
    DROP TABLE public.abonement;
       public         postgres    false    17            �            1259    58330    author    TABLE     �   CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);
    DROP TABLE public.author;
       public         postgres    false    17            �            1259    58333    author_id_seq    SEQUENCE     o   CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.author_id_seq;
       public       postgres    false    17    193            ;	           0    0    author_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE author_id_seq OWNED BY author.id;
            public       postgres    false    194            �            1259    58335    book_id_seq    SEQUENCE     m   CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public       postgres    false    17            �            1259    58337    book    TABLE     =  CREATE TABLE book (
    id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    catalog_id integer,
    title character varying(200) NOT NULL,
    pages integer NOT NULL,
    year timestamp without time zone NOT NULL,
    publishing_office character varying(200) NOT NULL,
    isbn character varying(50)
);
    DROP TABLE public.book;
       public         postgres    false    195    17            �            1259    58341    book_2_author    TABLE     ]   CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
 !   DROP TABLE public.book_2_author;
       public         postgres    false    17            �            1259    58344    book_2_comment    TABLE     _   CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);
 "   DROP TABLE public.book_2_comment;
       public         postgres    false    17            �            1259    58347    catalog    TABLE     t   CREATE TABLE catalog (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    parent_id integer
);
    DROP TABLE public.catalog;
       public         postgres    false    17            �            1259    58350    catalog_id_seq    SEQUENCE     p   CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.catalog_id_seq;
       public       postgres    false    17    199            <	           0    0    catalog_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE catalog_id_seq OWNED BY catalog.id;
            public       postgres    false    200            �            1259    58352    comment    TABLE     �   CREATE TABLE comment (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    like_count integer,
    dislike_count integer
);
    DROP TABLE public.comment;
       public         postgres    false    17            �            1259    58356    comment_id_seq    SEQUENCE     p   CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public       postgres    false    17    201            =	           0    0    comment_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE comment_id_seq OWNED BY comment.id;
            public       postgres    false    202            �            1259    58358 	   copy_book    TABLE     v   CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE public.copy_book;
       public         postgres    false    17            �            1259    58361    copy_book_id_seq    SEQUENCE     r   CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.copy_book_id_seq;
       public       postgres    false    203    17            >	           0    0    copy_book_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;
            public       postgres    false    204            �            1259    58363 
   department    TABLE     �   CREATE TABLE department (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type integer NOT NULL,
    phone character varying NOT NULL,
    address character varying(250) NOT NULL
);
    DROP TABLE public.department;
       public         postgres    false    17            �            1259    58369    department_2_user_profile    TABLE     u   CREATE TABLE department_2_user_profile (
    user_profile_id integer NOT NULL,
    department_id integer NOT NULL
);
 -   DROP TABLE public.department_2_user_profile;
       public         postgres    false    17            �            1259    58372    department_id_seq    SEQUENCE     s   CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.department_id_seq;
       public       postgres    false    17    205            ?	           0    0    department_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE department_id_seq OWNED BY department.id;
            public       postgres    false    207            �            1259    58374    issue    TABLE       CREATE TABLE issue (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    planned_date_return timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);
    DROP TABLE public.issue;
       public         postgres    false    17            �            1259    58377    issuing_journal_id_seq    SEQUENCE     x   CREATE SEQUENCE issuing_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.issuing_journal_id_seq;
       public       postgres    false    208    17            @	           0    0    issuing_journal_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE issuing_journal_id_seq OWNED BY issue.id;
            public       postgres    false    209            �            1259    58379    order    TABLE     |  CREATE TABLE "order" (
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
    DROP TABLE public."order";
       public         postgres    false    17            �            1259    58382    order_2_comment    TABLE     a   CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);
 #   DROP TABLE public.order_2_comment;
       public         postgres    false    17            �            1259    58385    order_2_comment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.order_2_comment_comment_id_seq;
       public       postgres    false    211    17            A	           0    0    order_2_comment_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;
            public       postgres    false    212            �            1259    58387    order_2_comment_order_id_seq    SEQUENCE     ~   CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.order_2_comment_order_id_seq;
       public       postgres    false    211    17            B	           0    0    order_2_comment_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;
            public       postgres    false    213            �            1259    58389    order_id_seq    SEQUENCE     n   CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public       postgres    false    17    210            C	           0    0    order_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE order_id_seq OWNED BY "order".id;
            public       postgres    false    214            �            1259    58391    user_credentials    TABLE     �   CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
 $   DROP TABLE public.user_credentials;
       public         postgres    false    17            �            1259    58394    user_credentials_id_seq    SEQUENCE     y   CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_credentials_id_seq;
       public       postgres    false    215    17            D	           0    0    user_credentials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;
            public       postgres    false    216            �            1259    58396    user_profile    TABLE     d  CREATE TABLE user_profile (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    state integer NOT NULL,
    role integer NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(250) NOT NULL
);
     DROP TABLE public.user_profile;
       public         postgres    false    17            �            1259    58403    user_profile_id_seq    SEQUENCE     u   CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_profile_id_seq;
       public       postgres    false    217    17            E	           0    0    user_profile_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;
            public       postgres    false    218            _           2604    58405    id    DEFAULT     X   ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);
 8   ALTER TABLE public.author ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193            a           2604    58406    id    DEFAULT     Z   ALTER TABLE ONLY catalog ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);
 9   ALTER TABLE public.catalog ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            c           2604    58407    id    DEFAULT     Z   ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            d           2604    58408    id    DEFAULT     ^   ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);
 ;   ALTER TABLE public.copy_book ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            e           2604    58409    id    DEFAULT     `   ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);
 <   ALTER TABLE public.department ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    205            f           2604    58410    id    DEFAULT     `   ALTER TABLE ONLY issue ALTER COLUMN id SET DEFAULT nextval('issuing_journal_id_seq'::regclass);
 7   ALTER TABLE public.issue ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            g           2604    58411    id    DEFAULT     X   ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    210            h           2604    58412 
   comment_id    DEFAULT     z   ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);
 I   ALTER TABLE public.order_2_comment ALTER COLUMN comment_id DROP DEFAULT;
       public       postgres    false    212    211            i           2604    58413    order_id    DEFAULT     v   ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);
 G   ALTER TABLE public.order_2_comment ALTER COLUMN order_id DROP DEFAULT;
       public       postgres    false    213    211            j           2604    58414    id    DEFAULT     l   ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);
 B   ALTER TABLE public.user_credentials ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215            	          0    58327 	   abonement 
   TABLE DATA                     public       postgres    false    192   %�       	          0    58330    author 
   TABLE DATA                     public       postgres    false    193   ?�       F	           0    0    author_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('author_id_seq', 331, true);
            public       postgres    false    194             	          0    58337    book 
   TABLE DATA                     public       postgres    false    196   Ѓ       !	          0    58341    book_2_author 
   TABLE DATA                     public       postgres    false    197   e�       "	          0    58344    book_2_comment 
   TABLE DATA                     public       postgres    false    198   �       G	           0    0    book_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('book_id_seq', 1767, true);
            public       postgres    false    195            #	          0    58347    catalog 
   TABLE DATA                     public       postgres    false    199   a�       H	           0    0    catalog_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('catalog_id_seq', 4524, true);
            public       postgres    false    200            %	          0    58352    comment 
   TABLE DATA                     public       postgres    false    201   #�       I	           0    0    comment_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('comment_id_seq', 646, true);
            public       postgres    false    202            '	          0    58358 	   copy_book 
   TABLE DATA                     public       postgres    false    203   ه       J	           0    0    copy_book_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('copy_book_id_seq', 381, true);
            public       postgres    false    204            )	          0    58363 
   department 
   TABLE DATA                     public       postgres    false    205   z�       *	          0    58369    department_2_user_profile 
   TABLE DATA                     public       postgres    false    206   ی       K	           0    0    department_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('department_id_seq', 265, true);
            public       postgres    false    207            ,	          0    58374    issue 
   TABLE DATA                     public       postgres    false    208   ��       L	           0    0    issuing_journal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('issuing_journal_id_seq', 3, true);
            public       postgres    false    209            .	          0    58379    order 
   TABLE DATA                     public       postgres    false    210   ��       /	          0    58382    order_2_comment 
   TABLE DATA                     public       postgres    false    211          M	           0    0    order_2_comment_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);
            public       postgres    false    212            N	           0    0    order_2_comment_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);
            public       postgres    false    213            O	           0    0    order_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('order_id_seq', 263, true);
            public       postgres    false    214            3	          0    58391    user_credentials 
   TABLE DATA                     public       postgres    false    215   ܍       P	           0    0    user_credentials_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('user_credentials_id_seq', 1362, true);
            public       postgres    false    216            5	          0    58396    user_profile 
   TABLE DATA                     public       postgres    false    217   ��       Q	           0    0    user_profile_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('user_profile_id_seq', 1, false);
            public       postgres    false    218            m           2606    58416    abonement_pk 
   CONSTRAINT     S   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);
 @   ALTER TABLE ONLY public.abonement DROP CONSTRAINT abonement_pk;
       public         postgres    false    192    192            o           2606    58418 !   author_first_name_second_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);
 R   ALTER TABLE ONLY public.author DROP CONSTRAINT author_first_name_second_name_key;
       public         postgres    false    193    193    193            q           2606    58420 	   author_pk 
   CONSTRAINT     G   ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pk;
       public         postgres    false    193    193            w           2606    58422 #   book_2_author_book_id_author_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_author_id_key UNIQUE (book_id, author_id);
 [   ALTER TABLE ONLY public.book_2_author DROP CONSTRAINT book_2_author_book_id_author_id_key;
       public         postgres    false    197    197    197            y           2606    58424    book_2_comment_pk 
   CONSTRAINT     _   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);
 J   ALTER TABLE ONLY public.book_2_comment DROP CONSTRAINT book_2_comment_pk;
       public         postgres    false    198    198            s           2606    58426    book_isbn_key 
   CONSTRAINT     F   ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);
 <   ALTER TABLE ONLY public.book DROP CONSTRAINT book_isbn_key;
       public         postgres    false    196    196            u           2606    58428 	   book_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public         postgres    false    196    196            |           2606    58430 
   catalog_pk 
   CONSTRAINT     I   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_pk;
       public         postgres    false    199    199            ~           2606    58432 
   comment_pk 
   CONSTRAINT     I   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pk;
       public         postgres    false    201    201            �           2606    58434    copy_book_pk 
   CONSTRAINT     M   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.copy_book DROP CONSTRAINT copy_book_pk;
       public         postgres    false    203    203            �           2606    58436 *   department_2_user_profile_user_profile_key 
   CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_key UNIQUE (user_profile_id);
 n   ALTER TABLE ONLY public.department_2_user_profile DROP CONSTRAINT department_2_user_profile_user_profile_key;
       public         postgres    false    206    206            �           2606    58438    department_pk 
   CONSTRAINT     O   ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pk;
       public         postgres    false    205    205            �           2606    58440 !   department_type_phone_address_key 
   CONSTRAINT     p   ALTER TABLE ONLY department
    ADD CONSTRAINT department_type_phone_address_key UNIQUE (type, phone, address);
 V   ALTER TABLE ONLY public.department DROP CONSTRAINT department_type_phone_address_key;
       public         postgres    false    205    205    205    205            �           2606    58442    issuing_journal_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.issue DROP CONSTRAINT issuing_journal_pkey;
       public         postgres    false    208    208            �           2606    58444    order_2_comment_pk 
   CONSTRAINT     a   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);
 L   ALTER TABLE ONLY public.order_2_comment DROP CONSTRAINT order_2_comment_pk;
       public         postgres    false    211    211            �           2606    58446    order_pk 
   CONSTRAINT     G   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pk;
       public         postgres    false    210    210            �           2606    58448    user_credentials_email_key 
   CONSTRAINT     `   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);
 U   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_email_key;
       public         postgres    false    215    215            �           2606    58450 #   user_credentials_email_password_key 
   CONSTRAINT     s   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);
 ^   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_email_password_key;
       public         postgres    false    215    215    215            �           2606    58452    user_credentials_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_credentials DROP CONSTRAINT user_credentials_pk;
       public         postgres    false    215    215            �           2606    58454    user_profile_phone_key 
   CONSTRAINT     X   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_phone_key;
       public         postgres    false    217    217            �           2606    58456    user_profile_pk 
   CONSTRAINT     S   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_pk;
       public         postgres    false    217    217            z           1259    58457    fki_book_fk1    INDEX     C   CREATE INDEX fki_book_fk1 ON book_2_comment USING btree (book_id);
     DROP INDEX public.fki_book_fk1;
       public         postgres    false    198            �           2606    58458    abonement_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);
 A   ALTER TABLE ONLY public.abonement DROP CONSTRAINT abonement_fk0;
       public       postgres    false    192    2186    210            �           2606    58463    book_2_author_author_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id);
 T   ALTER TABLE ONLY public.book_2_author DROP CONSTRAINT book_2_author_author_id_fkey;
       public       postgres    false    2161    197    193            �           2606    58468    book_2_author_book_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);
 R   ALTER TABLE ONLY public.book_2_author DROP CONSTRAINT book_2_author_book_id_fkey;
       public       postgres    false    197    196    2165            �           2606    58473    book_2_comment_book_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_book_id_fkey FOREIGN KEY (book_id) REFERENCES book(id);
 T   ALTER TABLE ONLY public.book_2_comment DROP CONSTRAINT book_2_comment_book_id_fkey;
       public       postgres    false    198    196    2165            �           2606    58478    book_2_comment_fk0    FK CONSTRAINT     w   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 K   ALTER TABLE ONLY public.book_2_comment DROP CONSTRAINT book_2_comment_fk0;
       public       postgres    false    2174    201    198            �           2606    58483    book_fk0    FK CONSTRAINT     c   ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog(id);
 7   ALTER TABLE ONLY public.book DROP CONSTRAINT book_fk0;
       public       postgres    false    2172    196    199            �           2606    58488    catalog_fk0    FK CONSTRAINT     a   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_fk0 FOREIGN KEY (id) REFERENCES catalog(id);
 =   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_fk0;
       public       postgres    false    2172    199    199            �           2606    58493    comment_fk0    FK CONSTRAINT     s   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);
 =   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_fk0;
       public       postgres    false    2198    201    217            �           2606    58498    copy_book_fk1    FK CONSTRAINT     s   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);
 A   ALTER TABLE ONLY public.copy_book DROP CONSTRAINT copy_book_fk1;
       public       postgres    false    2178    205    203            �           2606    58503 ,   department_2_user_profile_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_department_id_fkey FOREIGN KEY (department_id) REFERENCES department(id);
 p   ALTER TABLE ONLY public.department_2_user_profile DROP CONSTRAINT department_2_user_profile_department_id_fkey;
       public       postgres    false    2178    205    206            �           2606    58508 +   department_2_user_profile_user_profile_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY department_2_user_profile
    ADD CONSTRAINT department_2_user_profile_user_profile_fkey FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);
 o   ALTER TABLE ONLY public.department_2_user_profile DROP CONSTRAINT department_2_user_profile_user_profile_fkey;
       public       postgres    false    2198    217    206            �           2606    58513 !   issuing_journal_copy_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_copy_book_id_fkey FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);
 Q   ALTER TABLE ONLY public.issue DROP CONSTRAINT issuing_journal_copy_book_id_fkey;
       public       postgres    false    2176    203    208            �           2606    58518    issuing_journal_reader_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY issue
    ADD CONSTRAINT issuing_journal_reader_id_fkey FOREIGN KEY (reader_id) REFERENCES user_profile(id);
 N   ALTER TABLE ONLY public.issue DROP CONSTRAINT issuing_journal_reader_id_fkey;
       public       postgres    false    2198    217    208            �           2606    58523    order_2_comment_fk0    FK CONSTRAINT     y   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 M   ALTER TABLE ONLY public.order_2_comment DROP CONSTRAINT order_2_comment_fk0;
       public       postgres    false    2174    201    211            �           2606    58528    order_2_comment_fk1    FK CONSTRAINT     w   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);
 M   ALTER TABLE ONLY public.order_2_comment DROP CONSTRAINT order_2_comment_fk1;
       public       postgres    false    210    2186    211            �           2606    58533 	   order_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);
 ;   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_fk0;
       public       postgres    false    217    2198    210            �           2606    58538 	   order_fk1    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);
 ;   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_fk1;
       public       postgres    false    203    2176    210            �           2606    58543 	   order_fk2    FK CONSTRAINT     n   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);
 ;   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_fk2;
       public       postgres    false    217    2198    210            �           2606    58548    user_profile_fk0    FK CONSTRAINT     t   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);
 G   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_fk0;
       public       postgres    false    215    217    2194            	   
   x���          	   �  x����J�@��}������$��J�`�WY���`M�k+zӻ�� �B�?>�䍜��SAŕ@B&�߷|�Ͷ;��y��;�3�n&�d̪����q:���uTgi�O�P���e����eU��uf�la�|��̢�k>�u��%�aoՎ*��Kx����WF_��R,�%�]_؁x��HQ� ��x��$t2���-�]��ҳ��)_~��/����?0���v�Tt<i�� _��EZa��Ԑ�SP)�K"����|���!�A�G� ��?�d�� ʥ���׃�N���!X{\.�~�K3� ��N��-���\��)�D!hv`���=^��d͂����uC���R
d��~?#z�[���p�(�%�?Vq����p�4p0 d��	�+       	   �  x����N�0 �;O�� �L۵ݦ'HA��@�ű62��@_�W��	~��lG27�fM?������뷯��\�Q�܁f8���g<JfC���,6X�Hm� �RV�(Lo�x6L��p����(n����u��ȣ�E����|e� �D0Dԁ�� ��(���q���.<�>	|�]F1�Y��Fǘ�?�d��;��B�aʘ΀<�P�Jh&���?2tk�}B�Sa�y~ �Bq	�)O5��1ǭ��sݤ�$�$-�JT�K\�6
������ĭ����Ec��J�|�[�!����r�{T�	����+,��F��/UowO�]~ʵz߻�v����ݾ��E$��ŭ��2�c_՜���q")��D?ņW���R�"�F�C��W      !	   �   x���v
Q���WH��ώ7�O,-��/R� s3St @��B��O�k�������������5�'�FX�(�Rj���%F��\aH�F���<bL�+LAF�Sj��irE���:��)s�#K��0�N����.. �i�      "	   L   x���v
Q���WH��ώ7�O���M�+QЀ2�3St r�)�
a�>���
f&�:
��f&��\��b7�� ,+)�      #	   �   x��ѱ�0�ᝧ���t�890�L\M-��Jʍ���08S^��9��ʮ5�e}��k�_�P��Fn�w�p;MV�'a�`�pàl�"8y�"%%��%�v�����]�:��oN���b�8;��jDG-ڒ&�ɕ	��׮ND��R�5�o��.�v�|��k`1a�<�I����}      %	   �   x����
�0Ew��mQ�5�j��X��U��bh4%��7Rh�t�r�����e��k����G��E��:�nZ݄�v����!Rܱ�Ժ�^̟���X4Y6g�~�.A�j$f��;�w>�O�8e�c40W��+����[����R�T���$�[Ͳ��)\�      '	   �   x���v
Q���WH�/��O���V��L�Q ��A��ԂĢ��Լ WS!��'�5XA���\G����H��hZsyRb�%��27@�eD�Y��,(5�d���,CJ�2�˘*f�"�2��,�YFT1�a�~�0��Y��fqq S�      )	   Q  x���]kK���+�.
ˡ�����	�������dE��V��5���&Kz���x��{�����?g�?~������f��_��awq3n���[�{{�����v{7�߿�{��ӛ��ELa3�>x�?t�z���-��Y�P�s��n���7���Ty~�����W'g�a���$8R�$�Zv�#Ko4QK?I��Nr9���W!Hp��N�d��Fs��RҢ��JF�Q9HGʜ�˘'��8H�'�9H�;R����'��~3�|̌^e�3�3f�	I9s>�f���Z	1�J�$�8H�UT����T3NHUǌ1�d��� f\�H1cQ�)?-�$�C聬��B�hh��R?a�H5�F3�!����\A��Z��r$S����)E��+���D�Ҫ�H�����$E�`ƥ|Ќ^eK� ��f4+�p��
��|NR�03V˾�pd�03:�X�Ⱥaf�HI8�k��8!��03NH�#놤�R�Ⱥ��d�I|��M���U03NU��fƎT�2�%�f��(CGdF-U�E� 3�}O��3J��ؑ$p����H��Y$2��K�ƣ#��A)��(��<D�� {k�i����m9q�D������0{W�?gA����ij����ۑrh�1{w$#�;b�����q��k��R6�$��v$1�@{;RʤV�ݑH3N@{�ԂR2I�ގ��q�ۑ�r�%��H�-d��5��9���H�\�w�$$���q]���B��4�0{w$!%M�ٻ#��	N�wGʜCQ��>ݒ5΂���}��do���b��8��b�n��p����$G+{+f��MĊ���5
��
�ۑ�`�m
��=!��� {�H��%1�ގ�*��� {OH�9��|�k")I~=���|Ȍ��H'�b�g$R�o��*�e$1Ԍ�T8H�(��JM9�rjF���q��#R%�`�IB�,i	�k�H�Q�\�:"��M���J,$����ǃ�U 3.UzF�i��G$�2rjAR���P�	GC�k���f�������_��n��ܯSK7��x}�_ꙗ��ΏwG��ã�]�% ���%_b������ �+��      *	   
   x���          ,	   �   x���1�0��_q�r('���kS����7"х8��w���e��ΐ��#4�88�f`Hi2�u���!�}�.K���Zb0�Uב����4�n�����P�Yg�<f����1
/�y�"����?SY����xïw���a�����kYOO1b�      .	   
   x���          /	   
   x���          3	   �   x���v
Q���W(-N-�O.JMI�+�L�)V��L�QH�M���Q(H,..�/J�Ts�	uV�0465�QP/I-.qH)�K��U���kZsyRb��)ФĔ��<�yzI��0��63���T�X�����¡�lC�qE��)�E��T.. ��r      5	   2  x��R�n�0�����j��4�i��P��e��J�ܰ��ܰ� Y�c���%^T���-�͊�z��ݮi���:f�{���b�����z�z���]K�q�:r���~�^�/�5s��1�<�>"8x��"��Jƹ��(��S=U�`{F�(�<��hX(�r���OaE$�_fi/���pń4yn�N��Z닆q��$�B�ʥ�ù9��s1;�i�k� �n�
A��Zll�n��%7Yi�He����NRs�k1s����Q��344�����!�P4bi��BQQ��E8��0^�����N     