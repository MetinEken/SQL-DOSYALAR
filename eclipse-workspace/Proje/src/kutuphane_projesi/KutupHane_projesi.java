package kutuphane_projesi;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class KutupHane_projesi {

	
	/*
	 KÜTÜPHANE PROGRAMI 

Müşterileriler kütüphaneleri için bir kitap yönetim sistemi tasarlamanızı istiyorlar. 

1.Bu programda kitaplar, Kitap Adı, Yazar Adı, Yayın Yılı ve Fiyat gibi bilgiler içerebilmelidir.

2. Program, kitaplara 1001’den başlayarak sıralı ve otomatik numara vermelidir. 

3. Kullanıcı sisteme Kitap eklemeyebimeli, silebilmeli,  arama ve tüm kitapları listeleme gibi  işlemleri yapabilmelidir.  

4. Programın başlangıcında Kullanıcıya aşağıdaki gibi bir menü sunulmalıdır ve Kullanıcı programı bitirene kadar işlemlere devam edebilmelidir. 
			
========= KİTAP PROGRAMI =============
	1: Kitap ekle 
	2: Numara ile kitap sil
	3. Numara ile kitap ara
	4: Tüm kitapları listele
	5: Bitir 

	 */
	
public static List <Integer> kitapNo = new ArrayList();
public static List <String>  kitapAdi =new ArrayList();
public static List <String>  yazarAdi = new ArrayList();
public static List <Double>  fiyati =new ArrayList();
public static List <Integer> yayinYili = new ArrayList();

public static Scanner scan =new Scanner(System.in);


	public static void main(String[] args) {
		
		
		kitapAdi.addAll(Arrays.asList("YALNIZ EFE","SEFILLER","DAVA"));	
		yazarAdi.addAll(Arrays.asList("Omer SEYFETTIN","Victor HUGO","        Franz KAFKA"));
		yayinYili.addAll(Arrays.asList(1919,1862,1925));
		fiyati.addAll(Arrays.asList(10.50, 20.00, 15.65));
		kitapNo.addAll(Arrays.asList(1001,1002,1003));
		int secenek;
		
		System.out.println("KUTUPHANEMIZE HOSGELDINIZ");
		
	do {	
		kitapProgrami();
		System.out.println("Lutfen yapmak istediginiz islem no'yu seciniz");
		secenek =scan.nextInt();
		
		switch(secenek) {
		
		case(1):
			kitapEkle();
					break;
		case (2) :
			kitapSil();
					break;
		case (3):
			kitapAra();
					break;
		case 4 :
		kitapListesi();
					break;
		}
	}while(secenek!=5);
		
		System.out.println("TESEKKUR EDERIZ");
		
		
	
	}


	
private static void kitapAra() {
	Scanner scan= new Scanner(System.in);	
	System.out.println("lutfen kitap ismini giriniz");
		String ara=scan.nextLine().toUpperCase();		
		
	
			if(kitapAdi.contains(ara)) {
						
			for(int i=0 ; i<(kitapAdi.size()) ; i++) {
			if(kitapAdi.get(i).contains(ara)) {
				System.out.println("aranan kitap mevcut");
				System.out.println("Sira No  Kitap NO  Kitap Adi \t Yazar \t     Yayin Yili  Fiyati");
				System.out.println("=====================================================================");
				System.out.println("  "+(i+1)+"\t " +kitapNo.get(i)+"\t   "+ kitapAdi.get(i)+"\t"+ yazarAdi.get(i)+"\t"+yayinYili.get(i)+"\t"+fiyati.get(i));
				}}
			
		
		}else {
			System.out.println("kitap mevcut degildir");
		}
}

private static void kitapSil() {
		System.out.println("Lutfen silmek istediginiz 'kitap No' numarasini giriniz");
		
		int no= scan.nextInt();
		System.out.println("  "+(no)+"\t " +kitapNo.get(no-1)+"\t   "+ kitapAdi.get(no-1)+"\t"+ yazarAdi.get(no-1)+"\t"+yayinYili.get(no-1)+"\t"+fiyati.get(no-1)+"\r\n"
		+ "   ISIMLI KITABI SILMEK ISTEDIGINIZDEN EMINMISINIZ E/H");
		String eH=scan.next().toLowerCase();
		
		if(eH.equals("e")) {
			kitapNo.remove(no-1);
			kitapAdi.remove(no-1);
			yazarAdi.remove(no-1);
			fiyati.remove(no-1);
			yayinYili.remove(no-1);
			
			System.out.println("Basariyla silindi");
		}else {
			System.out.println("Kitap silme islemi iptal edildi");
		}
		
	}




	private static void kitapEkle() {
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		System.out.println("lutfen eklemek istediginiz kitap ismini giriniz");
		String ekle = scan.nextLine();
		kitapAdi.add(ekle);
		
		System.out.println("lutfen eklemek istediginiz kitabin Yazar ismini giriniz");
		String kyAdi=scan.nextLine();
		yazarAdi.add(kyAdi);
		
		System.out.println("lutfen eklemek istediginiz kitabin yayin yilini giriniz");
		int yil= scan.nextInt();
		yayinYili.add(yil);
		
		
		
		System.out.println("lutfen eklemek istediginiz kitabin fiyatini giriniz");
		double fEkle=scan.nextDouble();
		fiyati.add(fEkle);
		
		kitapNo.add(kitapNo.get(kitapNo.size()-1)+1);
		System.out.println("\t\t BASARIYLA KAYDEDILDI");
		System.out.println("Sira No  Kitap NO  Kitap Adi \t Yazar \t     Yayin Yili  Fiyati");
		System.out.println("=====================================================================");
		System.out.println(kitapAdi.size()+"     "+kitapNo.get((kitapNo.size()-1))+"\t   "+ kitapAdi.get((kitapAdi.size()-1))+"\t"+ yazarAdi.get(yazarAdi.size()-1)+"\t"+yayinYili.get(yayinYili.size()-1)+"\t"+fiyati.get(fiyati.size()-1));
		
	}
	private static void kitapProgrami() {
		System.out.println("========= KİTAP PROGRAMI =============\r\n"
				+ "	1: Kitap ekle \r\n"
				+ "	2: Numara ile kitap sil\r\n"
				+ "	3. Numara ile kitap ara\r\n"
				+ "	4: Tüm kitapları listele\r\n"
				+ "	5: Bitir");
		
	}


	public static void kitapListesi() {
		System.out.println("Sira No  Kitap NO  Kitap Adi \t Yazar \t     Yayin Yili  Fiyati");
		System.out.println("=====================================================================");
		
		for(int i=0 ; i<kitapAdi.size() ; i++) {
			
			System.out.println("  "+(i+1)+"\t " +kitapNo.get(i)+"\t   "+ kitapAdi.get(i)+"\t"+ yazarAdi.get(i)+"\t"+yayinYili.get(i)+"\t"+fiyati.get(i));
		}
		scan.close();
	}
	
	

}
