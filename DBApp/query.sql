create table tblsawon(
	no			number,
	id			varchar2(20),
	name		varchar2(20),
	pass		varchar2(10),
	age			number(2),
	addr		varchar2(50),
	ext			char(4),
	dept		varchar2(10),
	CONSTRAINT pk_no PRIMARY KEY(no)
);

CREATE SEQUENCE seq_no;	

select * from TBLSAWON;

commit;

--mysql
--mysql -u root -p
--CREATE DATABASE dbL3
--show tables;

create table tblsawon(
	no			int		not null	auto_increment,
	id			varchar(20),
	name		varchar(20),
	pass		varchar(10),
	age			int,
	addr		varchar(50),
	ext			char(4),
	dept		varchar(10),
	CONSTRAINT pk_no PRIMARY KEY(no)
);

INSERT INTO tblsawon values(seq_no.nextVal, 'hong', 'ȫ�浿', '1111', 20
, '����', '3431', '����');
INSERT INTO tblsawon values(seq_no.nextVal, 'lim', '������', '2222', 29
, '����', '3432', '����');
INSERT INTO tblsawon values(seq_no.nextVal, 'lee', '�̼���', '3333', 39
, '�λ�', '3433', '����');
INSERT INTO tblsawon values(seq_no.nextVal, 'shin', '�ŵ���', '4444', 36
, '����', '3434', '���');
INSERT INTO tblsawon values(seq_no.nextVal, 'jang', '�庸��', '5555', 20
, '����', '3435', '���');
INSERT INTO tblsawon values(seq_no.nextVal, 'ahn', '��âȣ', '6666', 34
, '���', '3436', '��ȹ');
INSERT INTO tblsawon values(seq_no.nextVal, 'yun', '������', '7777', 25
, '���', '3437', '��ȹ');


INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept) 
values('hong', 'ȫ�浿', '1111', 20, '����', '3431', '����');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept)  
values('lim', '������', '2222', 29, '����', '3432', '����');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept) 
values('lee', '�̼���', '3333', 39, '�λ�', '3433', '����');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept) 
values('shin', '�ŵ���', '4444', 36, '����', '3434', '���');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept)  
values('jang', '�庸��', '5555', 20, '����', '3435', '���');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept)  
values('ahn', '��âȣ', '6666', 34, '���', '3436', '��ȹ');

INSERT INTO tblsawon(id, name, pass, age, addr, ext, dept) 
values('yun', '������', '7777', 25, '���', '3437', '��ȹ');