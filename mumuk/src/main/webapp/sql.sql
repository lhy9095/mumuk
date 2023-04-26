drop table restaurant cascade constraints;

-- 식당 테이블
create table restaurant (
	rno number primary key,  -- 식당 번호
	rname varchar2(50) not null, -- 식당 이름
	addr varchar2(100) not null, -- 식당 주소
	rtel varchar2(20),           -- 식당 전화번호
	menu1 varchar2(50) not null, -- 대표메뉴1
	menu2 varchar2(50), -- 대표메뉴2
	menu3 varchar2(50), -- 대표메뉴3
	img1 varchar2(100), -- 메뉴사진1
	img2 varchar2(100), -- 메뉴사진2
	img3 varchar2(100), -- 메뉴사진3
	img4 varchar2(100), -- 메뉴사진4
	map_x number not null, -- 좌표x
	map_y number not null, -- 좌표y
	sep_1 varchar2(50) not null, -- 대분류
	sep_2 varchar2(50) not null, -- 중분류
	sep_3 varchar2(50), -- 소분류
	del char(1) default 'n' not null,  -- 삭제 여부
	readcount number default 0 not null           
);

select * from RESTAURANT;

drop table bookmark;

-- 북마크(먹고싶다) 테이블
create table bookmark (
	bm_no number primary key,   -- 북마크 번호
	rno number references restaurant(rno) not null,  -- 식당 번호       
	mno number references member(mno) not null       -- 회원 번호 
);

select * from bookmark;

drop sequence seq_bookmark_bm_no;
create sequence seq_bookmark_bm_no;

drop table review1 cascade constraints;

-- 식당 리뷰 테이블
create table review1 (
	rv_no number primary key,    -- 리뷰 번호
    content varchar2(500) not null,   -- 내용
    reg_date date not null,           -- 작성일
    rno number references restaurant(rno) not null,  -- 식당 번호
    mno number references member(mno) not null,      -- 회원 번호
    del char(1) default 'n'                     -- 삭제 여부 
);

select * from review1;

drop sequence seq_review1_rv_no;
create sequence seq_review1_rv_no;

drop table starRate;

-- 식당 별점 테이블
create table starRate (
	rate_no number primary key,      -- 별점 번호
	star_rate number not null,       -- 별점
	rno number references restaurant(rno) not null,  -- 식당 번호
	mno number references member(mno) not null       -- 회원 번호
);

select * from starRate;

drop sequence seq_starRate_rate_no;
create sequence seq_starRate_rate_no;
