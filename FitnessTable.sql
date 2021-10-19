-- 회원정보 5명
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
    IN_DATE VARCHAR2(50) DEFAULT SYSDATE
);

-- 트레이너 정보 3명
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

-- Pt 예약 정보
CREATE TABLE RESERVATION(
    RES_ID NUMBER(8) PRIMARY KEY,       
    RES_DATE VARCHAR2(50),
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
    REMAIN_NUM NUMBER(10),
    RES_ID NUMBER(8),
    CONSTRAINT fk_EXE_REV FOREIGN KEY (RES_ID) REFERENCES RESERVATION(RES_ID)
    ON DELETE CASCADE
);

-- SEQ ID
CREATE SEQUENCE SEQ_MEM_ID;
CREATE SEQUENCE SEQ_TRAINER_ID;
CREATE SEQUENCE SEQ_SPE_ID;
CREATE SEQUENCE SEQ_RES_ID;

-- TEST용 회원정보 5명
INSERT INTO MEMBER VALUES(SEQ_MEM_ID.NEXTVAL,'김영근','960403','guest1','1234','010-1111-1111','M','부산진구유명가수',170,80,SYSDATE);
INSERT INTO MEMBER VALUES(SEQ_MEM_ID.NEXTVAL,'김승신','9901103','guest2','1111','010-2222-1111','M','부산남구유명가수',180,82,2021-10-10);
INSERT INTO MEMBER VALUES(SEQ_MEM_ID.NEXTVAL,'김민성','890501','guest3','2222','010-3333-1111','M','부산북구유명가수',183,90,2020-9-13);
INSERT INTO MEMBER VALUES(SEQ_MEM_ID.NEXTVAL,'최헌성','880101','guest4','3333','010-4444-1111','M','대구중구유명가수',167,80,2021-08-12);
INSERT INTO MEMBER VALUES(SEQ_MEM_ID.NEXTVAL,'우형근','8201231','guest5','4444','010-5555-1111','M','서울강남구유명가수',175,88,2021-03-01);


-- TEST용 트레이너 3명
INSERT INTO TRAINER VALUES(SEQ_TRAINER_ID.NEXTVAL,'조성오','900705','trainer1','1111','010-1234-1234','M','부산진구');
INSERT INTO TRAINER VALUES(SEQ_TRAINER_ID.NEXTVAL,'유은영','991015','trainer2','2222','010-5678-5678','W','울산');
INSERT INTO TRAINER VALUES(SEQ_TRAINER_ID.NEXTVAL,'임형준','921120','trainer3','3333','010-9999-8888','M','대구');

-- TEST용 특이사항
INSERT INTO SPECIAL VALUES(SEQ_SPE_ID.NEXTVAL,SYSDATE,'거북목있음, 라운드숄더', 1);

-- TEST용 예약정보
INSERT INTO RESERVATION VALUES(SEQ_RES_ID.NEXTVAL, SYSDATE , 1, 1);
INSERT INTO RESERVATION VALUES(SEQ_RES_ID.NEXTVAL, SYSDATE , 2, 1);
INSERT INTO RESERVATION VALUES(SEQ_RES_ID.NEXTVAL, SYSDATE , 3, 2);
INSERT INTO RESERVATION VALUES(SEQ_RES_ID.NEXTVAL, SYSDATE , 4, 2);
INSERT INTO RESERVATION VALUES(SEQ_RES_ID.NEXTVAL, SYSDATE , 5, 3);

--TEST용 EXE
INSERT INTO EXECUTION VALUES(SEQ_EXE_ID.NEXTVAL, '안뇽', 170 , 70, 10, 9);



commit;


테이블

- 회원정보 -
mem_id
이름
생년월일
나이 ( 자동으로 입력 되게 )
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

- 특이사항 -
SEQ 
mem_id 
날짜
특이사항

- PT내역 -
seq
res_id
PT내용
키
몸무게
Pt 남은횟수

