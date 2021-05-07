
/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operator? bir Boolean operat?rd?r ve true - false de?er d?nd?r?r. 
    EXISTS operator? s?kl?kla Subquery'lerde sat?rlar?n do?rulu?unu test etmek 
    i?in kullan?l?r.
    
    E?er bir subquery (altsorgu) bir sat?r? d?nd?r?rse EXISTS operat?r? de TRUE 
    de?er d?nd?r?r. Aksi takdirde, FALSE de?er d?nd?recektir.
    
    ?zellikle altsorgularda h?zl? kontrol i?lemi ger?ekle?tirmek i?in kullan?l?r
==============================================================================*/
   
    CREATE TABLE mart_satislar
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
   
    --DELETE FROM nisan_satislar;
    
       
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE N?SAN aylar?nda ayn? URUN_ID ile sat?lan ?r?nlerin
  URUN_ID’lerini listeleyen ve ayn? zamanda bu ?r?nleri MART ay?nda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yaz?n?z. 
 -----------------------------------------------------------------------------*/       
    -- tablolara k?sa isim vermek m?mk?nd?r. B?ylece sorgular?m?z?n daha k?sa 
    -- g?z?kmesini sa?labiliriz.
    
    -- AS  -> bir sutuna k?sa isim veriyor.
    -- Bir sorgu i?erisinde  tabloya da k?sa isim vermek m?mk?n. 
    -- tablo_Adi k?sa_isim
    
    SELECT urun_id, musteri_isim FROM mart_satislar 
    
    WHERE EXISTS  (SELECT urun_id FROM nisan_satislar 
                  WHERE mart_satislar.urun_id = nisan_satislar.urun_id);


   -- WHERE urun_id IN(SELECT urun_id FROM nisan_satislar
   --          WHERE mart_satislar.urun_id = nisan_satislar.urun_id);  
   
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da sat?lan ?r?nlerin URUN_ISIM'lerini ve bu ?r?nleri
  N?SAN ay?nda sat?n alan MUSTERI_ISIM'lerini listeleyen bir sorgu yaz?n?z. 
 -----------------------------------------------------------------------------*/
 
    SELECT urun_isim, musteri_isim FROM nisan_satislar  nisan
    
    WHERE EXISTS  (SELECT urun_id FROM mart_satislar mart
                  WHERE mart.urun_isim = nisan.urun_isim);
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satilmayan ?r?nlerin URUN_ISIM'lerini 
  ve bu ?r?nleri N?SAN ay?nda sat?n alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    SELECT urun_isim, musteri_isim FROM nisan_satislar n
    
    WHERE NOT EXISTS  (SELECT urun_id FROM mart_satislar mart
                      WHERE mart.urun_isim = n.urun_isim);
 
       
 /*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operat?rleridir. Bir ifadenin NULL olup 
    olmad???n? kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve i?erisindeki parameterelerden NULL olmayan
    ilk ifadeyi d?nd?r?r. E?er ald??? t?m ifadeler NULL ise NULL d?nd?r?r?r.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
   -- INSERT INTO insanlar  VALUES();
    DELETE FROM insanlar;
/* ----------------------------------------------------------------------------
    ORNEK1: isim 'i NULL olanlar? sorgulay?n?z.
 -----------------------------------------------------------------------------*/     
    SELECT * FROM insanlar
    WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK2: isim 'i NULL olmayanlar? sorgulay?n?z.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM insanlar
    WHERE isim IS NOT NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan ki?ilerin isim'ine NO NAME atay?n?z. 
-----------------------------------------------------------------------------*/   
    UPDATE insanlar
    SET isim = 'NO NAME'
    WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayal?m.
-----------------------------------------------------------------------------*/    
   UPDATE insanlar
   SET isim = COALESCE (isim, 'Hen?z isim girilmedi'),
       adres = COALESCE (adres, 'Hen?z adres girilmedi'),
       ssn= COALESCE (ssn, 'No SSN');
       
    SELECT * FROM insanlar;
/*================================ ORDER BY  ===================================
   ORDER BY c?mleci?i bir SORGU deyimi i?erisinde belli bir SUTUN’a g?re 
   SIRALAMA yapmak i?in kullan?l?r.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
    CREATE TABLE kisiler 
    (
        ssn CHAR(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');

    SELECT * FROM kisiler;
    
/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e g?re s?ralayarak sorgulay?n?z.
 -----------------------------------------------------------------------------*/ 
 
    SELECT * FROM kisiler
    ORDER BY adres;   --- ASC gibi s?rad?.

/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'a g?re s?ralayarak sorgulay?n?z.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM kisiler
    ORDER BY maas;  
 
 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a g?re AZALAN s?rada sorgulay?n?z.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    ORDER BY maas DESC;  -- Azalan
 
/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlar?, SSN'e g?re AZALAN s?rada sorgulay?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE isim = 'Mine'
    ORDER BY ssn DESC;
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanlar? isim s?ral? olarak sorgulay?n?z.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    WHERE soyisim = 'Bulut'
    ORDER BY 2;                 --2= 2.inci sutuna gore surala isim'e g?re s?ralanm??
                                --3= 3.uncu stuna gore sirala gibi
                                --6= 6.inci satir olmadigi icin hata verir
                                
/*====================== FETCH NEXT, OFFSET (12C VE ?ST?) ======================
   FETCH c?mleci?i ile listelenecek kay?tlar? s?n?rland?rabiliriz. ?stersek 
   sat?r say?s?na g?re istersek de toplam sat?r say?s?n?n belli bir y?zdesine 
   g?re s?n?rland?rma koymak m?mk?nd?r. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET C?mleci?i ile de listenecek olan sat?rlardan s?ras?yla istedi?imiz 
   kadar?n? atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET sat?r_sayisi ROWS;
  
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: MAA?'? en y?ksek 3 ki?inin bilgilerini listeleyen sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;
    -- maaslari yuksekten siralayip, ilk 3 unu aldik
/* ----------------------------------------------------------------------------
  ORNEK2: MAA?'? en D???K 2 ki?inin bilgilerini listeleyen sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;
    -- maaslari ilk dusukleri yazdirip, ilk 2 sini yazdirdik
/* ----------------------------------------------------------------------------
  ORNEK3: MAA?'a g?re s?ralamada 4-6. ki?ilerin bilgilerini listeleyen 
  sorguyu yaz?n?z.
-----------------------------------------------------------------------------*/     
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS           -- ilk 3 kayd? atlad?k
    FETCH NEXT 3 ROWS ONLY; -- sonraki 3 kayd? se?tik.
    
  