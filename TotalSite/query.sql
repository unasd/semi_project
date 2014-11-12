CREATE TABLE tblBoard(
	num			number,					-- 글번호(기본키)
	name		varchar2(20),			--작성자
	email		varchar2(50),			
	homepage	varchar2(50),
	subject		varchar2(50),
	content		varchar2(4000),
	pass		varchar2(10),
	count		number,					--조회수
	ip			varchar2(30),
	regdate		date,					--등록일
	pos			number,					--답변글의 위치
	depth		number,					--답변글의 레벨
	filename	varchar2(100),
	ofilename	varchat2(20)
	CONSTRAINT pk_num	PRIMARY KEY(num)
);

CREATE SEQUENCE seq_num;

INSERT INTO tblboard VALUES(seq_num.nextVal, 'aaa', 'aaa',
'aaa', 'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

INSERT INTO tblboard VALUES(seq_num.nextVal, 'bbb', 'bbb',
'bbb', 'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

SELECT * from tblboard;

delete from tblboard;