class Bron{
  int typ;  // 1-bliska, 2-zdalna
  int rodzaj;
  String nazwa; 
  float zasieg;
  float czestotliwosc;
  float sila;
  float celnosc;
  float czasDoWystrzalu;
  int liczbaAmunicji;
  float masa;
  
  Bron kopiuj(){
    Bron tymczasowy;
    tymczasowy= new Bron();
    tymczasowy.typ=typ;
    tymczasowy.rodzaj=rodzaj;
    tymczasowy.zasieg=zasieg;
    tymczasowy.czestotliwosc=czestotliwosc;
    tymczasowy.sila=sila;
    tymczasowy.celnosc=celnosc;
    tymczasowy.liczbaAmunicji=liczbaAmunicji;
    tymczasowy.masa=masa;
    return tymczasowy;
  }
  Bron kopiujNiedokladnie(){
    Bron tymczasowy;
    tymczasowy= new Bron();
    tymczasowy.typ=typ;
    tymczasowy.rodzaj=rodzaj;
    tymczasowy.zasieg=zasieg*random(0.9,1.1);
    tymczasowy.czestotliwosc=czestotliwosc*random(0.9,1.1);
    tymczasowy.sila=sila*random(0.9,1.1);
    tymczasowy.celnosc=celnosc*random(0.9,1.1);
    tymczasowy.liczbaAmunicji=liczbaAmunicji;
    tymczasowy.masa=masa;
    return tymczasowy;
  }  
  
  void wypisz(){
    println("  ["+nazwa+"]");
    println("   zasieg:"+zasieg);
    println("   sila:"+sila);
    
  }
  
}