create table bf (
	num number primary key, 			-- key : 글쓸때마다 1씩 증가
	writer varchar2(20) not null, 		-- 작성자
	subject varchar2(50) not null, 		-- 제목
	content varchar2(500) not null, 	-- 본문
	readcount number default 0, 		-- 읽은 횟수
	password varchar2(12) not null, 	-- 암호
	ref number not null, 				-- 답변글끼리 그룹
	re_step number not null, 			-- ref내의 순서
	re_level number not null, 			-- 들여쓰기
	ip varchar2(20) not null, 			-- 작성자 ip
	reg_date date not null, 			-- 작성일
	del char(1) default 'n'
);

