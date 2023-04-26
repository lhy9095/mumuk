create table member (
	mno           NUMBER       primary key,   -- 회원번호
    id	          VARCHAR2(20) not null,      -- 아이디
    password      VARCHAR2(20) not null,      -- 비밀번호
    name	      VARCHAR2(20) not null,      -- 이름
    email_id	  VARCHAR2(20) not null,      -- 이메일 @ 앞 부분
    email_domain  VARCHAR2(20) not null,	  -- 이메일 @ 뒷 부분
	tel	          VARCHAR2(20) not null,	  -- 전화번호
	nickName	  VARCHAR2(20) not null,	  -- 별명
	reg_date	  DATE         not null,      -- 가입일
	profile	      VARCHAR2(20),               -- 프로필
	del	          CHAR(1)	  default 'N'     -- 삭제여부
);

select * from MEMBER;
drop table member cascade constraints;

create sequence seq_member_mno;

drop table MEMBER;

insert into member values(seq_member_mno.NEXTVAL,'master',12345678,'마스터','master','master.com','010-1111-1111','마스크아님',sysdate,'profile','N');

select id,nickName, name, tel, email_id, email_domain from member where id='kkj';

drop table restaurant;

