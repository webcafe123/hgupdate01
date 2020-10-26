--user
create table user_info (
  user_id               varchar2(100) primary key, --pk
  user_nickname         varchar2(100) not null,
  user_name             VARCHAR2(100) not null,
  user_age              NUMBER not null,
  user_email            varchar2(200) not null,
  user_ip               VARCHAR2(20) not null,
  user_level            NUMBER default 1,
  user_del              char(1) default 'n',
  user_regdate          date default sysdate,
  user_update           date default sysdate,
  user_pwd              VARCHAR2(100) not null
);

CREATE SEQUENCE AA START WITH 1 INCREMENT BY 1 MAXVALUE 300 CYCLE NOCACHE;
--카테고리분류메뉴
create table cate (
    c_num               NUMBER,                 --pk  key
    c_subject           VARCHAR2(100) not null,  -- 카테고리명
    c_id                varchar2(100),          --fk  생성자
    c_intro             VARCHAR2(100),          -- 카테고리 설명        
    c_regdate           DATE default sysdate,   -- 작성일
    c_del               CHAR(1) default 'n',    -- 삭제여부
      ref                 NUMBER not null,        -- 카테끼리 그룹
   c_step              NUMBER not null,        -- ref 내의 순서
   c_level             NUMBER not null,        -- 들여쓰기
    CONSTRAINT c_nm_pk PRIMARY KEY (c_num),
    CONSTRAINT c_id_fk FOREIGN KEY (c_id) REFERENCES user_info (user_id) 
); 

--게시판
create table board (
    b_num               NUMBER,                 --pk
    b_c_num             NUMBER not null,        --fk
    b_subject           VARCHAR2(50) not null,
    b_id                VARCHAR2(100) not null, --fk
    b_nick              VARCHAR2(100) not null,
    b_content           VARCHAR2(1000),
    b_read_cnt          NUMBER,
    b_reply_cnt         NUMBER,
    b_like_cnt          NUMBER,
    b_regdate           DATE default sysdate,
    b_update            DATE default sysdate,
    b_ip                VARCHAR2(20) not null,
    b_notice            CHAR(1) default 'n', 
    b_del               CHAR(1) default 'n',
    CONSTRAINT b_num_pk PRIMARY KEY (b_num),
    FOREIGN KEY (b_c_num) REFERENCES cate (c_num),
    FOREIGN KEY (b_id) REFERENCES user_info (user_id)
);
ALTER TABLE board DROP COLUMN b_filename;
alter table board add (b_filename varchar2(100)); 
--업로드 파일
create table file_upload (
    f_num               NUMBER,                 --pk
    f_b_num             NUMBER not null,        --fk
    f_filename          VARCHAR2(50) not null,
    f_del               CHAR(1) default 'n',
    CONSTRAINT f_num_pk PRIMARY KEY (f_num),
    FOREIGN KEY (f_b_num) REFERENCES board (b_num)
);


create sequence file_upload_seq;

create or replace function get_seq
    return number
is
begin
    return file_upload_seq.nextval;
end;
-- 로그인 ip 기록
CREATE table login_ip_history (
    i_num               NUMBER,                  --pk
    i_id                VARCHAR2(100) not null,  --fk
    i_ip                VARCHAR2(20) not null,
    i_logdate           DATE default sysdate,
    CONSTRAINT i_num_pk PRIMARY KEY (i_num),
    FOREIGN KEY (i_id) REFERENCES user_info (user_id) 
);
CREATE SEQUENCE seq_loginip
START WITH 1
INCREMENT BY 1;
-- 쪽지
CREATE table message (
    m_num               NUMBER,                 --pk
    m_sender_id         VARCHAR2(100) not null,  --fk
    m_sender_nick       VARCHAR2(100) not null,
    m_sender_ip         VARCHAR2(20) not null,
    m_sender_del        CHAR(1) default 'n',
    m_receiver_id       VARCHAR2(100) not null,  --fk
    m_receiver_nick     VARCHAR2(100) not null,
    m_receiver_del      CHAR(1) default 'n',
    m_subject           VARCHAR2(100) not null,
    m_content           VARCHAR2(500) not null,    
    m_send_date         DATE default sysdate,
    CONSTRAINT m_num_pk PRIMARY KEY (m_num),
    FOREIGN KEY (m_sender_id) REFERENCES user_info (user_id), 
    FOREIGN KEY (m_receiver_id) REFERENCES user_info (user_id) 
);

CREATE table reply (
    r_num               NUMBER,                 --pk
    r_b_num             NUMBER not null,        --fk
    r_ref               NUMBER not null,
	r_origin			NUMBER not null,
    r_level             NUMBER not null,
    r_step              NUMBER not null,    
    r_id                varchar2(10) not null,  --fk
    r_nick              varchar2(10) not null,
    r_content           varchar2(500) not null,
    r_regdate           DATE default sysdate,
    r_update            DATE default sysdate,
    r_ip                VARCHAR2(20) not null,
    r_del               CHAR(1) default 'n',
    CONSTRAINT r_num_pk PRIMARY KEY (r_num)
);     

CREATE table reply (
    r_num               NUMBER,                 --pk
    r_b_num             NUMBER not null,        --fk
    r_ref               NUMBER not null,
	r_origin			NUMBER not null,
    r_level             NUMBER not null,
    r_step              NUMBER not null,    
    r_id                varchar2(10) not null,  --fk
    r_nick              varchar2(10) not null,
    r_content           varchar2(500) not null,
    r_regdate           DATE default sysdate,
    r_update            DATE default sysdate,
    r_ip                VARCHAR2(20) not null,
    r_del               CHAR(1) default 'n',
    CONSTRAINT r_num_pk PRIMARY KEY (r_num),
    FOREIGN KEY (r_b_num) REFERENCES board (b_num), 
    FOREIGN KEY (r_id) REFERENCES user_info (user_id) 
);    
