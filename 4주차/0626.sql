use madang;

select * from book;
select * from customer;
select * from orders;

# 도서번호가 1인 도서의 이름
select bookname from book where bookid = 1;

# 가격이 20000원 이상인 도서의 이름
select count(bookname) as count from book where price >= 20000;

# 박지성의 총 구매액
select name , sum(saleprice) as sum from customer as cus , orders as ord where cus.custid = ord.custid and cus.name ='박지성';

# 박지성의 구매한 도서의 갯수
select name , count(saleprice) from customer as cus , orders as ord where cus.custid = ord.custid and cus.name ='박지성';

# 박지성이 구매한 도서의 출판사 갯수
select count(distinct(publisher)) as buyPublisher from customer as cus , orders as ord , book where cus.custid = ord.custid and ord.bookid = book.bookid and cus.name = '박지성';

# 2014년 7월 4일부터 7월 7일 사이에 주문받은 도서의 주문번호를 출력
select orderid as id from orders where orderdate <= '2014-07-07' and orderdate >= '2014-07-04';
select orderid as id from orders where orderdate between '2014-07-04' and '2014-07-07';

# 2014년 7월 4일부터 7월 7일 사이에 주문받은 도서 제외한 주문번호를 출력
select orderid as id from orders where orderdate not between '2014-07-04' and '2014-07-07';

# 성이 김씨인 고객의 이름과 주소 출력
select name , address from customer where name like '박%';

# 주문 금액이 총액과 주문의 평균 금액을 출력
select sum(saleprice) as sum , round(avg(saleprice) , 0) as average from orders;

# 고객의 이름과 고객별 구매액을 출력
select name , sum(saleprice) from orders as ord , customer as cus where cus.custid = ord.custid group by name;

# 박지성이 구매한 도서의 이름과, 가격 , 정가와 판매가격의 차이를 출력하시오.
select book.bookname , book.price , book.price - ord.saleprice as 가격차이 from customer as cus , orders as ord , book where cus.custid = ord.custid and ord.bookid = book.bookid and cus.name = '박지성';
