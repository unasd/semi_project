CREATE TABLE tblBoard(
	num			number,					-- �۹�ȣ(�⺻Ű)
	name		varchar2(20),			--�ۼ���
	email		varchar2(50),			
	homepage	varchar2(50),
	subject		varchar2(50),
	content		varchar2(4000),
	pass		varchar2(10),
	count		number,					--��ȸ��
	ip			varchar2(30),
	regdate		date,					--�����
	pos			number,					--�亯���� ��ġ
	depth		number,					--�亯���� ����
	CONSTRAINT pk_num	PRIMARY KEY(num)
);

CREATE SEQUENCE seq_num;

INSERT INTO tblboard VALUES(seq_num.nextVal, 'aaa', 'aaa',
'aaa', 'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

INSERT INTO tblboard VALUES(seq_num.nextVal, 'bbb', 'bbb',
'bbb', 'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

SELECT * from tblboard;

delete from tblboard;