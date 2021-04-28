 CREATE TABLE calisanlar2
 (
 id CHAR(4),
 isim VARCHAR2(50),
 maas NUMBER(5),
 CONSTRAINT calisan PRIMARY KEY (id)
 );
 INSERT INTO calisanlar2 VALUES('1001', 'Ahmet Aslan', 7000);
 INSERT INTO calisanlar2 VALUES( '1002', 'Mehmet Y?lmaz' ,12000);
 INSERT INTO calisanlar2 VALUES('1003', 'Meryem ', 7215);
 INSERT INTO calisanlar2 VALUES('1004', 'Veli Han', 5000);

 CREATE TABLE aileler
 
(
 id CHAR(4),
 cocuk_sayisi VARCHAR2(50),
 ek_gelir NUMBER(5),
 CONSTRAINT aile FOREIGN KEY (id) REFERENCES calisanlar2(id)
 );
 INSERT INTO aileler VALUES('1001', 4, 2000);
 INSERT INTO aileler VALUES('1002', 2, 1500);
 INSERT INTO aileler VALUES('1003', 1, 2200);
 INSERT INTO aileler VALUES('1004', 3, 2400);
 
 
 SELECT * FROM calisanlar2;
 --==========================
 --1.soru veli hanin maasina %20 zam
 UPDATE calisanlar2
 SET maas=maas*1.2 --=*120/100
 WHERE isim='Veli Han';
 
 SELECT * FROM calisanlar2;
 --=========================
 
 --2. soru maasi ortalamanin altinda kalanlara %20 zam
 
 UPDATE calisanlar2
 SET maas=maas*1.2
 WHERE maas<(SELECT AVG(maas) FROM calisanlar2);
  
  SELECT * FROM calisanlar2;
 
 --=====================
 
 --3.soru calisanlarin isim ve cocuk sayilarini listele
 
 SELECT isim,(SELECT cocuk_sayisi FROM aileler
                    WHERE aileler.id=aileler.id) AS cocuk_sayisi
                    FROM calisanlar2;
                    
-                  
 --========================================
 
 --4.soru calisanlarin id,isim ve toplam gelirlerini listele
SELECT isim,id,(SELECT (ek_gelir+maas) FROM aileler
                WHERE calisanlar2.id=aileler.id) AS toplam_gelir
FROM calisanlar2;
 
        
--=========================
UPDATE calisanlar2
SET maas=maas*1.10
WHERE 2000<((SELECT (ek_gelir+maas)/(cocuk_sayisi+2) FROM aileler 
              WHERE calisanlar2.id=aileler.id));
              
   SELECT * FROM calisanlar2;
   
   

   
   
   
   
   
   
   
   