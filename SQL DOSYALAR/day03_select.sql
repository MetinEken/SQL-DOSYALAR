/* ======================= SELECT - WHERE ==================================*/

    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler;
    
/* ============================================================================
   Verileri SELECT komutu ile veritaban?ndan ?ekerken filtreleme yapmak i?in 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullan?labilir. 
   
    SELECT sut?n1, sut?n2
        ...
    FROM  tablo_ad?WHERE ko?ul;
==============================================================================*/
  
/* -----------------------------------------------------------------------------
  ORNEK1: S?nav notu 80'den b?y?k olan ??rencilerin t?m bilgilerini listele
 -----------------------------------------------------------------------------*/  
    SELECT * FROM ogrenciler 
    WHERE sinav_notu>80;
    
    -- notu 80 den b?y?k olanlar?n sadece isim ve not bilgilerini listeleme
    SELECT isim,sinav_notu
    FROM ogrenciler 
    WHERE sinav_notu>80;
    
 /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan ??rencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
    
 /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan ??rencilerin t?m bilgilerini listele
 -----------------------------------------------------------------------------*/
    SELECT * FROM ogrenciler
    WHERE id = 124;
    
            
/* ======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Y?lmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay?e Can', 4000);

    SELECT * FROM personel;
    
    -- NOT:BETWEEN iki mant?ksal ifade ile tan?mlayabilece?imiz durumlar? 
    -- tek komutla yazabilme imk?n? verir. Yazd???m?z 2 s?n?r da aral??a dahildir.
    
/*============================================================================*/
   
/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 aras?nda olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
    --1.Y?ntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Y?ntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ?ST L?M?TLER DAH?LD?R.
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Y?lmaz ile Veli Han aras?ndaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Y?lmaz' AND 'Veli Han';
    
/* -----------------------------------------------------------------------------
  ORNEK6: id?si 10002 - 10004 aras?nda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mant?ksal ifade ile tan?mlayabilece?imiz durumlar? 
    tek komutla yazabilme imk?n? verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_ad?
    WHERE sutun_ad? IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id?si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    --1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     --2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004);   
    
/* -----------------------------------------------------------------------------
  ORNEK8: Maa?? sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sa?lar.
    SYNTAX:
    -------
    SELECT sut?n1, sut?n2,?
    FROM  tablo_ad?WHERE s?tunN LIKE pattern
    
    PATTERN ???N
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile ba?layanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup di?er harflerinde y olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';

/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile ba?lamayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';

 /* -----------------------------------------------------------------------------
  ORNEK16:  maa??n?n son 2 hanesi 00 olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';

/* -----------------------------------------------------------------------------
  ORNEK17:  maa??n?n 4000 olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
 /* -----------------------------------------------------------------------------
  ORNEK18: maa?? 5 haneli olanlar? listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
  /* -----------------------------------------------------------------------------
  ORNEK19: maa??n?n  5 haneli olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  

    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karma??k pattern ile sorgulama i?lemi i?in REGEXP_LIKE kullan?labilir.  
?
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad?, ?pattern[] ?, ?c? ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    
    -- i?erisinde 'hi' harfleri ge?en kelimeleri sorgulayn?z.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- i?erisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --i?erisinde ot veya at harfleri olan kelimeleri sorgulay?n?z.
    -- veya islemi | karakteri ile yap?l?r.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile ba?layan kelimeleri sorgulay?n?z.
    -- Ba?lama i?in ^ karakteri kullan?l?r.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho', 'i');
    
    -- t veya m ile biten kelimeleri B?y?k-K???k harf duyars?z ?ekilde listeyeniz.
    --biti? i?in $ ilareti kullan?l?r.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    
    -- h ile ba?lay?p t ile biten 3 harfli kelimeleri b?y?k-k???k harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- - (tire) karakteri bir aral?k verir.
    -- k??eli parantez tek bir karakter g?sterir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z|0-9]t','i');
    
    -- ?lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
    -- kelimelerin t?m bilgilerini sorgulayal?m.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- ??inde m veya i veya e olan kelimelerin t?m bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    -- Ilk harfi h olan ve ??inde m veya i veya e olan kelimelerin
    --t?m bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    -- i?erisinde en az 2 adet oo bar?nd?ran kelimelerin t?m bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '[o]{2}', 'i')
    
    -- i?erisinde en az 2 adet a bar?nd?ran kelimelerin t?m bilgilerini 
    -- listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{2}','i'); 