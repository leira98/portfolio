
--후기게시판

drop table board;
create table board (
	num  int  not  null,
	writer   varchar(50),
	email   varchar(30),	
	subject   varchar(100),	
	passwd   varchar(10),
	reg_date   DATE,
	readcount  int,
	ref   int,
	re_step   int,
	re_level  int,
	content    varchar(3000)
	
);

ALTER TABLE board
       ADD   PRIMARY KEY (num)  ;

drop Sequence seq_log;
Create Sequence seq_log
start with 1
increment by 1
maxvalue 10000000;

/*insert into board values(seq_log.nextval,'3','add','5','8');
commit;
*/
--고객문의
drop table qnaBoard;
create table qnaBoard (
	num  int  not  null,
	writer   varchar(50),
	email   varchar(30),	
	subject   varchar(100),	
	passwd   varchar(10),
	reg_date   DATE,
	readcount  int,
	ref   int,
	re_step   int,
	re_level  int,
	content    varchar(3000),
	ip   varchar(15)
);

ALTER TABLE qnaBoard
       ADD   PRIMARY KEY (num)  ;

drop Sequence seq_qna;
Create Sequence seq_qna
start with 1
increment by 1
maxvalue 10000000;

select * from qnaBoard;


--회원
DROP TABLE Member ;
CREATE TABLE Member (
       MemID                VARCHAR(15) NOT NULL,
       password             VARCHAR(10) NOT NULL,
       Name                 VARCHAR(30) NOT NULL,
       Email                VARCHAR(60) ,
       Tel                  VARCHAR(20) ,
       Zipcode              VARCHAR(10) ,
       Address              VARCHAR(200) ,
       Point                int ,
       memberDate           DATE
);

ALTER TABLE Member
       ADD   PRIMARY KEY (MemID)  ;

commit;

select * from member;








