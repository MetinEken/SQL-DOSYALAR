CREATE TABLE hastaneler(
 hastane_id VARCHAR2(5),
 hastane_ad VARCHAR2(25),
 hastane_sehir VARCHAR2(10),
 hastane_statu VARCHAR2 (3),
 
 CONSTRAINT pk_id PRIMARY KEY (hastane_id)
 
);
INSERT INTO hastaneler VALUES('H101','Ac? Madem Hastanesi','Istanbul','Y');
INSERT INTO hastaneler VALUES('H102','Haszeki Hastanesi','Istanbul','N');
INSERT INTO hastaneler VALUES('H103','Medikol Hastanesi','Izmir','Y');
INSERT INTO hastaneler VALUES('H104','Nemoryil Hastanesi','IAnkara','Y');
SELECT * FROM hastaneler;

CREATE TABLE hastalar(
hasta_kimlikNo VARCHAR2(11),
hasta_ad VARCHAR2(25),
hasta_teshis VARCHAR2(20),
CONSTRAINT pk_kimlik PRIMARY KEY(hasta_kimlikNo)
);
INSERT INTO hastalar VALUES('12573638356','Ali Can','Gizli Seker');
INSERT INTO hastalar VALUES('12545637856','Ayse Yilmaz','Hiper Tansiyon');
INSERT INTO hastalar VALUES('12556398356','Steve job','Pankreatit');
INSERT INTO hastalar VALUES('12572987356','Tom Hanks','COVID 19');
SELECT * FROM hastaneler;

CREATE TABLE bolumler(
 bolum_id VARCHAR2(10),
 bolum_ad VARCHAR2(25),
 CONSTRAINT pk_bolumid PRIMARY KEY(bolum_id)
); 
    INSERT INTO bolumler VALUES('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES('KBB', 'Kulak-Burun-Bogaz');
    INSERT INTO bolumler VALUES('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES('GAST', 'Gastroloji');
    INSERT INTO bolumler VALUES('KARD', 'Kardioloji');
    INSERT INTO bolumler VALUES('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES('GOZ', 'Goz Hastaliklari');
    
    CREATE TABLE hasta_kayitlar(
    hasta_kayitNo VARCHAR2(11),
    hasta_isim VARCHAR2(50),
    hastane_isim VARCHAR2(50),
    bolum_isim VARCHAR2(50),
    teshis_isim VARCHAR2(20),
    
    
    
    CONSTRAINT pk_Kayitno PRIMARY KEY(hasta_kayitNo)
    
    );
    DROP TABLE hasta_kayitlar;
    
    INSERT INTO hasta_kayitlar VALUES ('1111','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES ('2222','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES ('3333','NONAME','','','');
    
    UPDATE hasta_kayitlar 
    SET hasta_isim='Salvador Dali',
    hastane_isim='John Hopins',
    bolum_isim='Noroloji',
    teshis_isim='Parkinson',
    hasta_kayitNo='99991119991'
    WHERE hasta_kayitNo = '3333';
    
    SELECT * FROM hasta_kayitlar;
     
    
    /*  1111 UPDATE */
    
    
    UPDATE hasta_kayitlar
    SET
    hasta_isim = (SELECT hasta_ad FROM hastalar
    WHERE hasta_ad = 'Ali Can'),
     hastane_isim =(SELECT hastane_ad FROM hastaneler
    WHERE hastane_id = 'H104'),
     bolum_isim = (SELECT bolum_ad FROM bolumler
    WHERE bolum_id = 'DHL'),
      teshis_isim = (SELECT hasta_teshis FROM hastalar
    WHERE hasta_ad = 'Ali Can'),
     hasta_kayitNo=(SELECT hasta_kimlikNo FROM hastalar
    WHERE hasta_ad= 'Ali Can')
    
    WHERE hasta_kayitNo= '1111';
    
    select * from hasta_kayitlar;
  
    UPDATE hasta_kayitlar 
    set 
    
    hastane_isim =(SELECT hastane_ad FROM hastaneler
    WHERE hastane_id = 'H104');
    
    
    
    
    /* 2222 nolu hasta i?in */
    
    
    UPDATE hasta_kayitlar
    SET
    hasta_isim='Ayse Yilmaz',
    hastane_isim=(SELECT hastane_ad FROM hastaneler WHERE hastane_id='H103'),
    bolum_isim=(SELECT bolum_ad FROM bolumler WHERE bolum_id='KBB'),
    teshis_isim = (SELECT hasta_teshis FROM hastalar WHERE hasta_ad ='Tom Hanks'),
    hasta_kayitno=(SELECT hasta_kimlikNo FROM hastalar WHERE hasta_ad='Steve job')
    WHERE hasta_kayitNo= '2222';
    
    select * from hasta_kayitlar;