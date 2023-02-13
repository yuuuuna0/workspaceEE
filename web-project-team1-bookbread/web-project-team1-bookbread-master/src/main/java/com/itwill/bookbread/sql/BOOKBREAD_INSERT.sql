--회원가입(member, member_detail)
insert into member(userid, password, name, phone, birth, address, email, interest)
                    values(?, ?, ?, ?, ?, ?, ?, ?);

--책 추가
insert into product (p_no, p_name, p_author, p_publisher, p_publish_date, p_price, p_image, p_detail, type_no)
    values(product_p_no_SEQ.nextval, ?, ?, ?, ?, ?, null, ?, ?);

--카트 추가
insert into cart(cart_no, cart_qty, userid, p_no) values(cart_cart_no_SEQ.nextval, ?, ?, ?);

--주문 추가
insert into orders(o_no, o_desc, o_date, o_price, userid) 
    values (orders_o_no_SEQ.nextval, ?, sysdate, ?, ?);

--리뷰 추가
insert into review_board(r_no, r_date, r_title, r_content, r_count, userid, p_no) 
    values (review_board_r_no_SEQ.nextval, sysdate, ?, ?, ?, ?, ?);


