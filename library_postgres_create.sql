CREATE TABLE "book" (
	"isbn" int NOT NULL UNIQUE,
	"catalog_id" int NOT NULL,
	"title" character varying(200) NOT NULL,
	"pages" int NOT NULL,
	"year" TIMESTAMP NOT NULL,
	CONSTRAINT book_pk PRIMARY KEY ("isbn")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "catalog" (
	"id" serial NOT NULL,
	"parent_id" int,
	"title" character varying(200) NOT NULL,
	CONSTRAINT catalog_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_profile" (
	"id" serial NOT NULL,
	"contact_id" int NOT NULL,
	"first_name" character varying(100) NOT NULL,
	"last_name" character varying(100) NOT NULL,
	"created" TIMESTAMP NOT NULL,
	"user_state" int NOT NULL,
	CONSTRAINT user_profile_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_credentials" (
	"id" serial NOT NULL,
	"role" int NOT NULL,
	"email" character varying(100) NOT NULL UNIQUE,
	"password" character varying(100) NOT NULL,
	CONSTRAINT user_credentials_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "book_2_author" (
	"book_isbn" int NOT NULL,
	"author_id" int NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "author" (
	"id" serial NOT NULL,
	"first_name" character varying(100) NOT NULL,
	"second_name" character varying(100) NOT NULL,
	CONSTRAINT author_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "copy_book" (
	"id" serial NOT NULL,
	"book_isbn" int NOT NULL,
	"department_id" int NOT NULL,
	"state_book" int NOT NULL,
	CONSTRAINT copy_book_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "order" (
	"id" serial NOT NULL,
	"reader_id" int NOT NULL,
	"copy_book_id" int NOT NULL,
	"type_order" int NOT NULL,
	"created" TIMESTAMP NOT NULL,
	"librarian_id" int,
	"handled" TIMESTAMP,
	"closed" TIMESTAMP,
	CONSTRAINT order_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "abonement" (
	"order_id" int NOT NULL,
	"issue" TIMESTAMP NOT NULL,
	"return_date" TIMESTAMP,
	"return_date_fact" TIMESTAMP,
	CONSTRAINT abonement_pk PRIMARY KEY ("order_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "department" (
	"id" serial NOT NULL,
	"contact_id" int NOT NULL,
	"name" character varying(100) NOT NULL,
	CONSTRAINT department_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "keyword" (
	"id" serial NOT NULL,
	"value" character varying(200) NOT NULL,
	"weight" int NOT NULL,
	CONSTRAINT keyword_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "book_2_keyword" (
	"book_isbn" int NOT NULL,
	"keyword_id" int NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "contact" (
	"id" serial NOT NULL,
	"phone" int NOT NULL,
	"address" character varying(100) NOT NULL,
	CONSTRAINT contact_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "comment" (
	"id" serial NOT NULL,
	"user_profile_id" int NOT NULL,
	"content" character varying(300) NOT NULL,
	"created" TIMESTAMP NOT NULL,
	CONSTRAINT comment_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "book_comment" (
	"comment_id" int NOT NULL,
	"book_isbn" int NOT NULL,
	"like" int,
	"dislike" int,
	CONSTRAINT book_comment_pk PRIMARY KEY ("comment_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "order_comment" (
	"comment_id" serial NOT NULL,
	"order_id" serial NOT NULL,
	CONSTRAINT order_comment_pk PRIMARY KEY ("comment_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "book" ADD CONSTRAINT "book_fk0" FOREIGN KEY ("catalog_id") REFERENCES "catalog"("id");

ALTER TABLE "catalog" ADD CONSTRAINT "catalog_fk0" FOREIGN KEY ("parent_id") REFERENCES "catalog"("id");

ALTER TABLE "user_profile" ADD CONSTRAINT "user_profile_fk0" FOREIGN KEY ("id") REFERENCES "user_credentials"("id");
ALTER TABLE "user_profile" ADD CONSTRAINT "user_profile_fk1" FOREIGN KEY ("contact_id") REFERENCES "contact"("id");

ALTER TABLE "user_credentials" ADD CONSTRAINT "user_credentials_fk0" FOREIGN KEY ("id") REFERENCES "user_profile"("id");

ALTER TABLE "book_2_author" ADD CONSTRAINT "book_2_author_fk0" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");
ALTER TABLE "book_2_author" ADD CONSTRAINT "book_2_author_fk1" FOREIGN KEY ("author_id") REFERENCES "author"("id");


ALTER TABLE "copy_book" ADD CONSTRAINT "copy_book_fk0" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");
ALTER TABLE "copy_book" ADD CONSTRAINT "copy_book_fk1" FOREIGN KEY ("department_id") REFERENCES "department"("id");

ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("reader_id") REFERENCES "user_profile"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("copy_book_id") REFERENCES "copy_book"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk2" FOREIGN KEY ("librarian_id") REFERENCES "user_profile"("id");

ALTER TABLE "abonement" ADD CONSTRAINT "abonement_fk0" FOREIGN KEY ("order_id") REFERENCES "order"("id");

ALTER TABLE "department" ADD CONSTRAINT "department_fk0" FOREIGN KEY ("contact_id") REFERENCES "contact"("id");


ALTER TABLE "book_2_keyword" ADD CONSTRAINT "book_2_keyword_fk0" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");
ALTER TABLE "book_2_keyword" ADD CONSTRAINT "book_2_keyword_fk1" FOREIGN KEY ("keyword_id") REFERENCES "keyword"("id");


ALTER TABLE "comment" ADD CONSTRAINT "comment_fk0" FOREIGN KEY ("user_profile_id") REFERENCES "user_profile"("id");

ALTER TABLE "book_comment" ADD CONSTRAINT "book_comment_fk0" FOREIGN KEY ("comment_id") REFERENCES "comment"("id");
ALTER TABLE "book_comment" ADD CONSTRAINT "book_comment_fk1" FOREIGN KEY ("book_isbn") REFERENCES "book"("isbn");

ALTER TABLE "order_comment" ADD CONSTRAINT "order_comment_fk0" FOREIGN KEY ("comment_id") REFERENCES "comment"("id");
ALTER TABLE "order_comment" ADD CONSTRAINT "order_comment_fk1" FOREIGN KEY ("order_id") REFERENCES "order"("id");

