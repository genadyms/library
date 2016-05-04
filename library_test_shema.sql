PGDMP                          t            library    9.5.2    9.5.2 s    (	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            )	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    25352    test    SCHEMA        CREATE SCHEMA test;
    DROP SCHEMA test;
             postgres    false            �            1259    25354 	   abonement    TABLE     �   CREATE TABLE abonement (
    order_id integer NOT NULL,
    date_take timestamp without time zone NOT NULL,
    date_return timestamp without time zone
);
    DROP TABLE test.abonement;
       test         postgres    false    8            �            1259    25357    author    TABLE     �   CREATE TABLE author (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    second_name character varying(100) NOT NULL
);
    DROP TABLE test.author;
       test         postgres    false    8            �            1259    25360    author_id_seq    SEQUENCE     o   CREATE SEQUENCE author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE test.author_id_seq;
       test       postgres    false    209    8            *	           0    0    author_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE author_id_seq OWNED BY author.id;
            test       postgres    false    210            �            1259    25362    book_id_seq    SEQUENCE     m   CREATE SEQUENCE book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE test.book_id_seq;
       test       postgres    false    8            �            1259    25364    book    TABLE     =  CREATE TABLE book (
    id integer DEFAULT nextval('book_id_seq'::regclass) NOT NULL,
    catalog_id integer,
    title character varying(200) NOT NULL,
    pages integer NOT NULL,
    year timestamp without time zone NOT NULL,
    publishing_office character varying(200) NOT NULL,
    isbn character varying(50)
);
    DROP TABLE test.book;
       test         postgres    false    211    8            �            1259    25368    book_2_author    TABLE     ]   CREATE TABLE book_2_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
    DROP TABLE test.book_2_author;
       test         postgres    false    8            �            1259    25371    book_2_comment    TABLE     _   CREATE TABLE book_2_comment (
    comment_id integer NOT NULL,
    book_id integer NOT NULL
);
     DROP TABLE test.book_2_comment;
       test         postgres    false    8            �            1259    25549    catalog    TABLE     g   CREATE TABLE catalog (
    id character varying(250) NOT NULL,
    parent_id character varying(250)
);
    DROP TABLE test.catalog;
       test         postgres    false    8            �            1259    25374    catalog_old    TABLE     �   CREATE TABLE catalog_old (
    id integer NOT NULL,
    path character varying(300) NOT NULL,
    path_parent character varying(300),
    parent character varying(250)
);
    DROP TABLE test.catalog_old;
       test         postgres    false    8            �            1259    25380    catalog_id_seq    SEQUENCE     p   CREATE SEQUENCE catalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.catalog_id_seq;
       test       postgres    false    8    215            +	           0    0    catalog_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE catalog_id_seq OWNED BY catalog_old.id;
            test       postgres    false    216            �            1259    25382    comment    TABLE     �   CREATE TABLE comment (
    id integer NOT NULL,
    user_profile_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    like_count integer,
    dislike_count integer
);
    DROP TABLE test.comment;
       test         postgres    false    8            �            1259    25386    comment_id_seq    SEQUENCE     p   CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.comment_id_seq;
       test       postgres    false    8    217            ,	           0    0    comment_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE comment_id_seq OWNED BY comment.id;
            test       postgres    false    218            �            1259    25388    contact    TABLE     �   CREATE TABLE contact (
    id integer NOT NULL,
    phone character varying(100) NOT NULL,
    address character varying(200) NOT NULL
);
    DROP TABLE test.contact;
       test         postgres    false    8            �            1259    25391    contact_id_seq    SEQUENCE     p   CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE test.contact_id_seq;
       test       postgres    false    219    8            -	           0    0    contact_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE contact_id_seq OWNED BY contact.id;
            test       postgres    false    220            �            1259    25393 	   copy_book    TABLE     v   CREATE TABLE copy_book (
    id integer NOT NULL,
    book_id integer NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE test.copy_book;
       test         postgres    false    8            �            1259    25396    copy_book_id_seq    SEQUENCE     r   CREATE SEQUENCE copy_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE test.copy_book_id_seq;
       test       postgres    false    8    221            .	           0    0    copy_book_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE copy_book_id_seq OWNED BY copy_book.id;
            test       postgres    false    222            �            1259    25398 
   department    TABLE     �   CREATE TABLE department (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(100) NOT NULL,
    department integer NOT NULL
);
    DROP TABLE test.department;
       test         postgres    false    8            �            1259    25401    department_id_seq    SEQUENCE     s   CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE test.department_id_seq;
       test       postgres    false    223    8            /	           0    0    department_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE department_id_seq OWNED BY department.id;
            test       postgres    false    224            �            1259    25403    order    TABLE       CREATE TABLE "order" (
    id integer NOT NULL,
    reader_id integer NOT NULL,
    copy_book_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    librarian_id integer,
    handled timestamp without time zone,
    closed timestamp without time zone
);
    DROP TABLE test."order";
       test         postgres    false    8            �            1259    25406    order_2_comment    TABLE     a   CREATE TABLE order_2_comment (
    comment_id integer NOT NULL,
    order_id integer NOT NULL
);
 !   DROP TABLE test.order_2_comment;
       test         postgres    false    8            �            1259    25409    order_2_comment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE order_2_comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE test.order_2_comment_comment_id_seq;
       test       postgres    false    8    226            0	           0    0    order_2_comment_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE order_2_comment_comment_id_seq OWNED BY order_2_comment.comment_id;
            test       postgres    false    227            �            1259    25411    order_2_comment_order_id_seq    SEQUENCE     ~   CREATE SEQUENCE order_2_comment_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE test.order_2_comment_order_id_seq;
       test       postgres    false    8    226            1	           0    0    order_2_comment_order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE order_2_comment_order_id_seq OWNED BY order_2_comment.order_id;
            test       postgres    false    228            �            1259    25413    order_id_seq    SEQUENCE     n   CREATE SEQUENCE order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE test.order_id_seq;
       test       postgres    false    8    225            2	           0    0    order_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE order_id_seq OWNED BY "order".id;
            test       postgres    false    229            �            1259    25415    user_credentials    TABLE     �   CREATE TABLE user_credentials (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
 "   DROP TABLE test.user_credentials;
       test         postgres    false    8            �            1259    25418    user_credentials_id_seq    SEQUENCE     y   CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE test.user_credentials_id_seq;
       test       postgres    false    8    230            3	           0    0    user_credentials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;
            test       postgres    false    231            �            1259    25420    user_profile    TABLE     3  CREATE TABLE user_profile (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    user_state integer NOT NULL,
    role integer NOT NULL
);
    DROP TABLE test.user_profile;
       test         postgres    false    8            �            1259    25424    user_profile_id_seq    SEQUENCE     u   CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE test.user_profile_id_seq;
       test       postgres    false    8    232            4	           0    0    user_profile_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;
            test       postgres    false    233            P           2604    25426    id    DEFAULT     X   ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);
 6   ALTER TABLE test.author ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    210    209            R           2604    25427    id    DEFAULT     ^   ALTER TABLE ONLY catalog_old ALTER COLUMN id SET DEFAULT nextval('catalog_id_seq'::regclass);
 ;   ALTER TABLE test.catalog_old ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    216    215            T           2604    25428    id    DEFAULT     Z   ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);
 7   ALTER TABLE test.comment ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    218    217            U           2604    25429    id    DEFAULT     Z   ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);
 7   ALTER TABLE test.contact ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    220    219            V           2604    25430    id    DEFAULT     ^   ALTER TABLE ONLY copy_book ALTER COLUMN id SET DEFAULT nextval('copy_book_id_seq'::regclass);
 9   ALTER TABLE test.copy_book ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    222    221            W           2604    25431    id    DEFAULT     `   ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);
 :   ALTER TABLE test.department ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    224    223            X           2604    25432    id    DEFAULT     X   ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);
 7   ALTER TABLE test."order" ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    229    225            Y           2604    25433 
   comment_id    DEFAULT     z   ALTER TABLE ONLY order_2_comment ALTER COLUMN comment_id SET DEFAULT nextval('order_2_comment_comment_id_seq'::regclass);
 G   ALTER TABLE test.order_2_comment ALTER COLUMN comment_id DROP DEFAULT;
       test       postgres    false    227    226            Z           2604    25434    order_id    DEFAULT     v   ALTER TABLE ONLY order_2_comment ALTER COLUMN order_id SET DEFAULT nextval('order_2_comment_order_id_seq'::regclass);
 E   ALTER TABLE test.order_2_comment ALTER COLUMN order_id DROP DEFAULT;
       test       postgres    false    228    226            [           2604    25435    id    DEFAULT     l   ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);
 @   ALTER TABLE test.user_credentials ALTER COLUMN id DROP DEFAULT;
       test       postgres    false    231    230            	          0    25354 	   abonement 
   TABLE DATA                     test       postgres    false    208   �w       	          0    25357    author 
   TABLE DATA                     test       postgres    false    209   �w       5	           0    0    author_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('author_id_seq', 1, false);
            test       postgres    false    210            	          0    25364    book 
   TABLE DATA                     test       postgres    false    212   �w       	          0    25368    book_2_author 
   TABLE DATA                     test       postgres    false    213   _|       	          0    25371    book_2_comment 
   TABLE DATA                     test       postgres    false    214   y|       6	           0    0    book_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('book_id_seq', 356, true);
            test       postgres    false    211            %	          0    25549    catalog 
   TABLE DATA                     test       postgres    false    234   �|       7	           0    0    catalog_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('catalog_id_seq', 515, true);
            test       postgres    false    216            	          0    25374    catalog_old 
   TABLE DATA                     test       postgres    false    215   }       	          0    25382    comment 
   TABLE DATA                     test       postgres    false    217   e�       8	           0    0    comment_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('comment_id_seq', 60, true);
            test       postgres    false    218            	          0    25388    contact 
   TABLE DATA                     test       postgres    false    219   �       9	           0    0    contact_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('contact_id_seq', 760, true);
            test       postgres    false    220            	          0    25393 	   copy_book 
   TABLE DATA                     test       postgres    false    221   ��       :	           0    0    copy_book_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('copy_book_id_seq', 1, false);
            test       postgres    false    222            	          0    25398 
   department 
   TABLE DATA                     test       postgres    false    223   ��       ;	           0    0    department_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('department_id_seq', 1, false);
            test       postgres    false    224            	          0    25403    order 
   TABLE DATA                     test       postgres    false    225   ͈       	          0    25406    order_2_comment 
   TABLE DATA                     test       postgres    false    226   �       <	           0    0    order_2_comment_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('order_2_comment_comment_id_seq', 1, false);
            test       postgres    false    227            =	           0    0    order_2_comment_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('order_2_comment_order_id_seq', 1, false);
            test       postgres    false    228            >	           0    0    order_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('order_id_seq', 1, false);
            test       postgres    false    229            !	          0    25415    user_credentials 
   TABLE DATA                     test       postgres    false    230   �       ?	           0    0    user_credentials_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('user_credentials_id_seq', 788, true);
            test       postgres    false    231            #	          0    25420    user_profile 
   TABLE DATA                     test       postgres    false    232   �       @	           0    0    user_profile_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('user_profile_id_seq', 1, false);
            test       postgres    false    233            ^           2606    25437    abonement_pk 
   CONSTRAINT     S   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_pk PRIMARY KEY (order_id);
 >   ALTER TABLE ONLY test.abonement DROP CONSTRAINT abonement_pk;
       test         postgres    false    208    208            `           2606    25439 !   author_first_name_second_name_key 
   CONSTRAINT     o   ALTER TABLE ONLY author
    ADD CONSTRAINT author_first_name_second_name_key UNIQUE (first_name, second_name);
 P   ALTER TABLE ONLY test.author DROP CONSTRAINT author_first_name_second_name_key;
       test         postgres    false    209    209    209            b           2606    25441 	   author_pk 
   CONSTRAINT     G   ALTER TABLE ONLY author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY test.author DROP CONSTRAINT author_pk;
       test         postgres    false    209    209            h           2606    25443 %   book_2_comment_comment_id_book_id_key 
   CONSTRAINT     w   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_comment_id_book_id_key UNIQUE (comment_id, book_id);
 \   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_comment_id_book_id_key;
       test         postgres    false    214    214    214            j           2606    25445    book_2_comment_pk 
   CONSTRAINT     _   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_pk PRIMARY KEY (comment_id);
 H   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_pk;
       test         postgres    false    214    214            d           2606    25447    book_isbn_key 
   CONSTRAINT     F   ALTER TABLE ONLY book
    ADD CONSTRAINT book_isbn_key UNIQUE (isbn);
 :   ALTER TABLE ONLY test.book DROP CONSTRAINT book_isbn_key;
       test         postgres    false    212    212            f           2606    25449 	   book_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY test.book DROP CONSTRAINT book_pkey;
       test         postgres    false    212    212            l           2606    25451    catalog_path_path_parent_key 
   CONSTRAINT     i   ALTER TABLE ONLY catalog_old
    ADD CONSTRAINT catalog_path_path_parent_key UNIQUE (path, path_parent);
 P   ALTER TABLE ONLY test.catalog_old DROP CONSTRAINT catalog_path_path_parent_key;
       test         postgres    false    215    215    215            n           2606    25453 
   catalog_pk 
   CONSTRAINT     M   ALTER TABLE ONLY catalog_old
    ADD CONSTRAINT catalog_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY test.catalog_old DROP CONSTRAINT catalog_pk;
       test         postgres    false    215    215            �           2606    25553    catalog_test_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_test_id_key UNIQUE (id);
 C   ALTER TABLE ONLY test.catalog DROP CONSTRAINT catalog_test_id_key;
       test         postgres    false    234    234            �           2606    25555    catalog_test_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY catalog
    ADD CONSTRAINT catalog_test_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY test.catalog DROP CONSTRAINT catalog_test_pkey;
       test         postgres    false    234    234            p           2606    25455 
   comment_pk 
   CONSTRAINT     I   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY test.comment DROP CONSTRAINT comment_pk;
       test         postgres    false    217    217            r           2606    25457    contact_phone_key 
   CONSTRAINT     N   ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_phone_key UNIQUE (phone);
 A   ALTER TABLE ONLY test.contact DROP CONSTRAINT contact_phone_key;
       test         postgres    false    219    219            t           2606    25459 
   contact_pk 
   CONSTRAINT     I   ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY test.contact DROP CONSTRAINT contact_pk;
       test         postgres    false    219    219            v           2606    25461    copy_book_pk 
   CONSTRAINT     M   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY test.copy_book DROP CONSTRAINT copy_book_pk;
       test         postgres    false    221    221            x           2606    25463    department_contact_id_name_key 
   CONSTRAINT     i   ALTER TABLE ONLY department
    ADD CONSTRAINT department_contact_id_name_key UNIQUE (contact_id, name);
 Q   ALTER TABLE ONLY test.department DROP CONSTRAINT department_contact_id_name_key;
       test         postgres    false    223    223    223            z           2606    25465    department_pk 
   CONSTRAINT     O   ALTER TABLE ONLY department
    ADD CONSTRAINT department_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY test.department DROP CONSTRAINT department_pk;
       test         postgres    false    223    223            ~           2606    25467    order_2_comment_pk 
   CONSTRAINT     a   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_pk PRIMARY KEY (comment_id);
 J   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_pk;
       test         postgres    false    226    226            |           2606    25469    order_pk 
   CONSTRAINT     G   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_pk;
       test         postgres    false    225    225            �           2606    25471    user_credentials_email_key 
   CONSTRAINT     `   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_key UNIQUE (email);
 S   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_email_key;
       test         postgres    false    230    230            �           2606    25473 #   user_credentials_email_password_key 
   CONSTRAINT     s   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_email_password_key UNIQUE (email, password);
 \   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_email_password_key;
       test         postgres    false    230    230    230            �           2606    25475    user_credentials_pk 
   CONSTRAINT     [   ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY test.user_credentials DROP CONSTRAINT user_credentials_pk;
       test         postgres    false    230    230            �           2606    25477    user_profile_pk 
   CONSTRAINT     S   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_pk;
       test         postgres    false    232    232            �           2606    25478    abonement_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY abonement
    ADD CONSTRAINT abonement_fk0 FOREIGN KEY (order_id) REFERENCES "order"(id);
 ?   ALTER TABLE ONLY test.abonement DROP CONSTRAINT abonement_fk0;
       test       postgres    false    2172    225    208            �           2606    25483    book_2_author_fk1    FK CONSTRAINT     s   ALTER TABLE ONLY book_2_author
    ADD CONSTRAINT book_2_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id);
 G   ALTER TABLE ONLY test.book_2_author DROP CONSTRAINT book_2_author_fk1;
       test       postgres    false    2146    209    213            �           2606    25488    book_2_comment_fk0    FK CONSTRAINT     w   ALTER TABLE ONLY book_2_comment
    ADD CONSTRAINT book_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 I   ALTER TABLE ONLY test.book_2_comment DROP CONSTRAINT book_2_comment_fk0;
       test       postgres    false    214    2160    217            �           2606    25493    book_fk0    FK CONSTRAINT     g   ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk0 FOREIGN KEY (catalog_id) REFERENCES catalog_old(id);
 5   ALTER TABLE ONLY test.book DROP CONSTRAINT book_fk0;
       test       postgres    false    2158    215    212            �           2606    25498    comment_fk0    FK CONSTRAINT     s   ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_fk0 FOREIGN KEY (user_profile_id) REFERENCES user_profile(id);
 ;   ALTER TABLE ONLY test.comment DROP CONSTRAINT comment_fk0;
       test       postgres    false    2182    232    217            �           2606    25503    copy_book_fk1    FK CONSTRAINT     s   ALTER TABLE ONLY copy_book
    ADD CONSTRAINT copy_book_fk1 FOREIGN KEY (department_id) REFERENCES department(id);
 ?   ALTER TABLE ONLY test.copy_book DROP CONSTRAINT copy_book_fk1;
       test       postgres    false    2170    223    221            �           2606    25508    department_fk0    FK CONSTRAINT     o   ALTER TABLE ONLY department
    ADD CONSTRAINT department_fk0 FOREIGN KEY (contact_id) REFERENCES contact(id);
 A   ALTER TABLE ONLY test.department DROP CONSTRAINT department_fk0;
       test       postgres    false    2164    223    219            �           2606    25513    order_2_comment_fk0    FK CONSTRAINT     y   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk0 FOREIGN KEY (comment_id) REFERENCES comment(id);
 K   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_fk0;
       test       postgres    false    2160    226    217            �           2606    25518    order_2_comment_fk1    FK CONSTRAINT     w   ALTER TABLE ONLY order_2_comment
    ADD CONSTRAINT order_2_comment_fk1 FOREIGN KEY (order_id) REFERENCES "order"(id);
 K   ALTER TABLE ONLY test.order_2_comment DROP CONSTRAINT order_2_comment_fk1;
       test       postgres    false    225    226    2172            �           2606    25523 	   order_fk0    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk0 FOREIGN KEY (reader_id) REFERENCES user_profile(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk0;
       test       postgres    false    225    2182    232            �           2606    25528 	   order_fk1    FK CONSTRAINT     k   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk1 FOREIGN KEY (copy_book_id) REFERENCES copy_book(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk1;
       test       postgres    false    2166    225    221            �           2606    25533 	   order_fk2    FK CONSTRAINT     n   ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_fk2 FOREIGN KEY (librarian_id) REFERENCES user_profile(id);
 9   ALTER TABLE ONLY test."order" DROP CONSTRAINT order_fk2;
       test       postgres    false    2182    232    225            �           2606    25538    user_profile_fk0    FK CONSTRAINT     t   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk0 FOREIGN KEY (id) REFERENCES user_credentials(id);
 E   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_fk0;
       test       postgres    false    232    230    2180            �           2606    25543    user_profile_fk1    FK CONSTRAINT     s   ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_fk1 FOREIGN KEY (contact_id) REFERENCES contact(id);
 E   ALTER TABLE ONLY test.user_profile DROP CONSTRAINT user_profile_fk1;
       test       postgres    false    219    232    2164            	   
   x���          	   
   x���          	   \  x���Mo7��ܜ �@I}lN=�`�M�&�5X����k�}迯ޙ�ფa�y� x�Y�j/?~��������_����?�7�?.�o������W��xz�����>�\?\L�^����nO?Nw7_�?}���������O?�����&d���������������!8�9y�hr� ���L���ww�?ğ�c�19�޾?��RF(y_f��S�,�	J�(����Y*�^ɥ��1Ke�+S��%�85R|?��Y*�^��W֘�2@5�4x�Y*k�!�(Á�,�me�"B�J�r����٥N.St�Y*�z�^Q_�>v�eU"f��jep�\"f�Lze}e�Y*�^��d�,j%Qg$�J����{�^U_���U"f�D�!���Os
��%!f�D�^�y���Y2b�J�ګ�2�N%�J�,��W��ψY*E�$�J�,��(��$���\�+y�K��e~��*��g1K%zsY�P/���K)%!f���=<��D.۽�*3b�J�v�e��2Y���^�ۧgQf�Ӄ�R)���̈Y*Y����(�i�ī�V98=b|z�{x�>����z�T���N��ր���#f�Dz	�̎ۧ�*1K%z��|/7eiW�EYL+Qpj��T"(�m%
^��T�Ei[����*;[�Ei�5 ,�����hUZ�� ;�rU׭D������S�M��-+ќ|���)�B�R��W�%�!����d�,�	�~U�l_J�J�K)
Y�䁒m�E���RL����洱)m��۴�V�ِ�Wg�m�~Q��f_�l�Ʊ��<Le��2^vO�:^��8s�*enN�Rj.M��<��_!ŵ�/�1Ke�+�{�Mi���W6'�Mi;Q�+�w�������蕱�cݔ�t���<�}ɾ26o{Ve���at�2�.%�9t��]
��%����t����W"f�D�)���غ�ܔ��K`�2r�ls)zes��)m7X������(M�:'��4�sWe�}�e���?A��=P�����q�\z9����s�'):���R��\�(c��lQF�w3�P����25�JWe��+��W6w���v����V��3�*��c��V���Y	�K���ےMi��,.ō��ev�icQ"V�gg���      	   
   x���          	   
   x���          %	   v   x���v
Q���WHN,I��OW��L�Q(H,J�+��L�Ts�	uV�P/��/1T�Q���Ѵ��$Y�>�4� 5�C��1�(�ɔhB���.l��taÅ��]ج�d �4�U      	   <  x�ŝA�����+�nf`H$U�$�U�023�N�$c�3��)I���o���c/lcl8_wKGUR�޳?��ן����/�x���ͻ����o߽�퇇�_>�k����/߿z�8�2����o~�ˏ?=|W������_�y����_�}x�����Ǐ�_=d�R��i�[�o�O����^��������������g �N ��<�v�w@?�u��s�adKJ"�Β� T;�j.�ad���8�Ѣ�
�luH-��M�YJB5�T oFh�����h��� 4�	0�W�02�.���j��N�*g^��"�S���@ݶ�V�7��j�=K�@Su ��< h���� ��N�J|�T'@��ȕ3���KZ"~h���h��F�vJʩ�K��mG�.J�h
M��U�j��ad�m]�'<��ɐ�1Z��u@�;@��K���P�y�"� ����vX!��@���q��!��d�˓U䶽4Oy)YEn;�`Ft�#Cn;%����@���%���>r[�)�"�] ���T� ��U��o���m�����02�K��/Of�mm��m��X�a��3���$Ë7��m���-�A�m�3�S�q��Av�"pώ@��r�9w�i�@I(�;p��{\�̃�\�p��l�02`�[r�~a2`�KR�'����(Cy�Gx��(�8p���X�%G��{5�� Z��ad����	O]pJގU�^Srf��th)`�4�g���d⫁f7�Y�3����<�BœAtɞ�
z��jģ�-e(��+gـ�K��[�4�	pbB]9�ȠN�*���K������*φ��	`8Q�r�����%�����n�4;	��8��$A��dm�1Ƞ״�2m��-����v�#��K�D[�%M�{|��������˓����j�\^t�	0��^9�Ƞ��dK8N�'C~Wr�5HN��E'9���
u�, ���@�q��!�Zd�KjMY �Wg!�5e���l�W�g�)��&��Pˈi�b��&A�!�TNq�#Cf�Ȉ֎:C@��z	�� ʳ{��*�77�02dvK�È�@�\Ps�>�x����G�����xo u���D�w�#��tw�7 �ӿ@��,�j �<,���j��\�f�e��%h5q|.ƛ��/�,�B<̖՗q}��6�<b,�c�T�tA�5U�!���
��S;�[HPw�YmU�ۣ&
3k)��K�*L��o�@�
`�Ҥg
�Y#~�L͗��[aP����� ��gjUؒ�~��m��[�Vk9�*�Xu$8����úkC�椣�Tk,��բp��>��6���<��
�ͳ]݅��d��Gu���L5+8�,���Y������;ѡճ�f�5�&��l�ϡ��5)X��.��P P/��^�~�M���k��[#��WPw�5w�F�fQ���CRyF�z��&��w�(���W��M�D��>�.�G���7Uj)��>"�h�8��h#~&�{�2fI�V��<��>d�5-Ҫ�w��ԗ�Z�~q�3��Ql�Y����t�֝^���0�a�3�֔��{ir7*�@��d��w�����<��5�!ad�Kw�#C��"�P2vΉ�*JG^2*�HXV��gK��}D4����_��>��V�/ �O�#CV�$<�#�!��Kf��enCg�J��� ���os�#Cܨ�{�J{5����aڈ�H�v~���
�ad`F�d/�X�j�@Ϩ���F��%9����.�����A�'Q�x%�j��K�]�"�f~(Z�Ad�j�$��a�!��<Hi�FQ���7�8�Ȑ�MI���YW��q&���7Ԇ�پ�񄑇�'o��jU�o xJv�#C&�$�+�e�16w/mM֌� �~o�ad�䜞��j����gq�)W_�5�BHE����K��;��� W�g69�짆k0��?�3R@O|�O�Qd��~I6��:Z�����@o��Tr%�ɨ�~=9�#UQ����02lr���L'��J
/�DE��D u�#�&�ʻ�^Wu��Hu�����	�yE����דW�Y	�j� ����ad��䉅'�z��%�u���q�|�#�&7�%���,�;^i���S��= N$�a��j�'���h���g*����59�z��M/�D��o ةy�#�&�sMֻ�fUj>�=�6�OyQT���xؤ�2~�er�#�&���`�Xo��ټ<Յ/ ��i��W2i��6�QZᕌ)��~=x啌)�� ��"8�Ȑ�,Ɏ��d�bZ+]xe��j�'�P^󍮚�cm�������To �������^o��o�ad(�d0%�!����r�����m��z�`�^}�Txw#*��}=93�C��o �q�"C��2��G C&�$�����O|��ϘM�i�[��{$���v��/�s�x��õ��5P���H��^������.�����������-YS���O��'��5A	�Ls��L��.���V�9�3���&+���"CU
2�ܥz�_�6��s�y�����s/�AsnP����Zp��\y�7��	��/����|"��_$Q� �;p��]
t`K֍�6�;��~�6�A��E���`ж��o����ԡK-ݬ�����̘�����#f��L��-�̙M��j
�M&�-��	̦���8�@l��[b�FT�_�i�Q��[�v�n�>�M�>��gG�(2P��ԯAxK88�������������9!�=`����YɨّBv��g�|��촷      	   
   x���          	   
   x���          	   
   x���          	   
   x���          	   
   x���          	   
   x���          !	   
   x���          #	   
   x���         