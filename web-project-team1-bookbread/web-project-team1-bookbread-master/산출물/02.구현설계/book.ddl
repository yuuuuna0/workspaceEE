DROP TABLE review_board CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE book_type CASCADE CONSTRAINTS;

CREATE TABLE book_type(
		type_no                       		NUMBER(20)		 NULL ,
		p_type                        		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE book_type_type_no_SEQ;

CREATE SEQUENCE book_type_type_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(200)		 NULL ,
		p_author                      		VARCHAR2(100)		 NULL ,
		p_publisher                   		VARCHAR2(100)		 NULL ,
		p_publish_date                		VARCHAR2(100)		 NULL ,
		p_price                       		NUMBER(20)		 DEFAULT 0		 NULL ,
		p_image                       		VARCHAR2(100)		 DEFAULT 'images/no_image.jpg'		 NULL ,
		p_detail                      		VARCHAR2(2000)		 DEFAULT 0		 NULL ,
		type_no                       		NUMBER(20)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE member(
		userId                        		VARCHAR2(100)		 NULL ,
		password                      		VARCHAR2(100)		 NULL ,
		name                          		VARCHAR2(100)		 NULL ,
		phone                         		VARCHAR2(100)		 NULL ,
		birth                         		VARCHAR2(100)		 NULL ,
		address                       		VARCHAR2(100)		 NULL ,
		email                         		VARCHAR2(100)		 NULL ,
		interest                      		VARCHAR2(200)		 NULL 
);


CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_desc                        		VARCHAR2(100)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE review_board(
		r_no                          		NUMBER(10)		 NULL ,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_title                       		VARCHAR2(200)		 NULL ,
		r_content                     		VARCHAR2(1000)		 NULL ,
		r_count                       		NUMBER(20)		 NULL ,
		userId                        		VARCHAR2(100)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_board_r_no_SEQ;

CREATE SEQUENCE review_board_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE book_type ADD CONSTRAINT IDX_book_type_PK PRIMARY KEY (type_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (type_no) REFERENCES book_type (type_no) ON DELETE CASCADE;

ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (userId);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (userId) REFERENCES member (userId) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) ON DELETE CASCADE;

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (userId) REFERENCES member (userId) ON DELETE CASCADE;

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no) ON DELETE CASCADE;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) ON DELETE CASCADE;

ALTER TABLE review_board ADD CONSTRAINT IDX_review_board_PK PRIMARY KEY (r_no);
ALTER TABLE review_board ADD CONSTRAINT IDX_review_board_FK0 FOREIGN KEY (userId) REFERENCES member (userId) ON DELETE CASCADE;
ALTER TABLE review_board ADD CONSTRAINT IDX_review_board_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) ON DELETE CASCADE;

