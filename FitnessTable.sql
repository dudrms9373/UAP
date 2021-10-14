-- 회원정보
CREATE TABLE MEMBER(
    MEM_ID NUMBER (10) PRIMARY KEY,
    MEM_NAME VARCHAR2 (100) NOT NULL,
    MEM_BIRTH VARCHAR2 (10) NOT NULL,
    ID VARCHAR2 (30) UNIQUE,
    PWD VARCHAR2 (30) NOT NULL,
    TEL VARCHAR2 (30) UNIQUE,
    GENDER VARCHAR2 (10) CHECK (GENDER IN('M','W')),
    ADDR VARCHAR2(100) NOT NULL,
    HEIGHT NUMBER(5),
    WEIGHT NUMBER(5),
    IN_DATE VARCHAR2(50)
);


-- 트레이너 정보
CREATE TABLE TRAINER(
    T_ID NUMBER (10) PRIMARY KEY,
    T_NAME VARCHAR2 (100) NOT NULL,
    T_BIRTH VARCHAR2 (10) NOT NULL,
    ID VARCHAR2 (30) UNIQUE,
    PWD VARCHAR2 (30) NOT NULL,
    T_TEL VARCHAR2(30) UNIQUE,
    GENDER VARCHAR2(10) CHECK (GENDER IN('M','W')) NOT NULL,
    ADDR VARCHAR2(100) NOT NULL
);

-- 연장기록
CREATE TABLE PROLONG (
    PROL_ID NUMBER(10) PRIMARY KEY,
    STATUS VARCHAR2(10) CHECK (STATUS IN ('Y','N')),
    START_DATE VARCHAR2(50),
    END_DATE VARCHAR2(50),
    PROL_DATE VARCHAR2(50),
    MEM_ID NUMBER(10), 
    CONSTRAINT fk_MEM_PROL FOREIGN KEY(MEM_ID) 
    REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE
);

-- Pt 예약 정보
CREATE TABLE RESERVATION(
    RES_ID NUMBER(8) PRIMARY KEY,       
    RES_DATE VARCHAR2(50),
    RES_NOTE VARCHAR2(1000) NOT NULL,
    RES_CHECK VARCHAR2(5),

    MEM_ID NUMBER(10),    
    T_ID NUMBER(10),
    
    CONSTRAINT fk_MEM_RESV 
      FOREIGN KEY (MEM_ID) REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE,
    CONSTRAINT fk_TRAN_RESV 
      FOREIGN KEY (T_ID) REFERENCES TRAINER(T_ID)

);

-- 특이사항
CREATE TABLE SPECIAL(
    SPE_ID NUMBER(8) PRIMARY KEY,
   
    W_DATE VARCHAR2(50) DEFAULT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),
    SPE_NOTE VARCHAR2(1000),
     MEM_ID NUMBER(10),
     CONSTRAINT fk_MEM_SPE 
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER(MEM_ID) ON DELETE CASCADE


);

-- PT 내역
CREATE TABLE EXECUTION(
    EXE_ID NUMBER(8) PRIMARY KEY,
    EXE_NOTE VARCHAR2(2000),
    HEIGHT NUMBER(3),
    WEIGHT NUMBER(3),
    EXE_CHECK VARCHAR(5) NOT NULL,
    RES_ID NUMBER(8),
    CONSTRAINT fk_EXE_REV FOREIGN KEY (RES_ID) REFERENCES RESERVATION(RES_ID)
    ON DELETE CASCADE
);


/*
테이블

- 회원정보 -
mem_id
이름
생년월일
id
pwd
전화번호
성별
주소
키
몸무게
가입일자
t_id


- 트레이너정보 -
이름
생년월일
id
pwd
전화번호
성별
주소
t_id

- 예약정보 -
SEQ
mem_id
t_id
상담일자
오전/오후
시간
상담내역
예약유무

- 연장기록 -
SEQ
mem_id
연장 유무
시작 일자
끝나는 일자
연장한 일자


- 특이사항 -
SEQ 
mem_id 
날짜
특이사항

- PT내역 -
seq
mem_id
PT내용
키
몸무게
상담/Pt

