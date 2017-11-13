//int liczbaWojakow=1000;
int liczbaArmii=3;
int liczbaRodzajowBroni;
PFont czciona;

Armia[] armie = new Armia[liczbaArmii];
//Bron[] bronie = new Bron[liczbaWojakow*2];
Bron[] rodzajeBroni;
//Wojak[] wojacy = new Wojak[liczbaWojakow];

void setup(){
  size(500,500);
  wczytajRodzajeBroni("rodzajebroni.txt");
  czciona=createFont("Arial",8,true);
  textFont(czciona,16);
  
  ustawArmie();
  wypiszArmie();
}

void draw(){
  background(127);
  decydujArmie();
  ruszArmie();
  rysujArmie();
 // listaArmii();
}



void ustawArmie(){

  for (int i=0;i<liczbaArmii;i++){
      armie[i]= new Armia();
      armie[i].id=i;
   }
   armie[0].kolor=color(255,0,0);
   armie[1].kolor=color(0,0,255);
   armie[2].kolor=color(0,255,0);
   for (int i=0;i<liczbaArmii;i++){
     armie[i].ustawWojakow();
     armie[i].wojska=armie;
   };
}

void decydujArmie(){
  for (Armia armia:armie){
    armia.decydujWojakow();
  }
}

void ruszArmie(){
  for (int i=0;i<liczbaArmii;i++){
    armie[i].ruszWojakow();
  }
}

void rysujArmie(){
  translate(50,50);
  scale(1);  
  for (int i=0;i<liczbaArmii;i++){
    armie[i].rysujWojakow();
  }
}


void listaArmii(){
  for (Armia armia:armie){
    armia.listaWojakow(armia.id*10,0);
  }
}

void wypiszArmie(){
  for (int i=0;i<liczbaArmii;i++){
    armie[i].wypiszWojakow();
  }
} //<>//

void wczytajRodzajeBroni(String nazwaPliku){
  String[] ProdzajeBroni=loadStrings(nazwaPliku);
  int nrlinii=1;
  liczbaRodzajowBroni=int(ProdzajeBroni[nrlinii]);nrlinii++;
  rodzajeBroni=new Bron[liczbaRodzajowBroni];
  for(int i=0;i<liczbaRodzajowBroni;i++)
  {
    rodzajeBroni[i]=new Bron();
   // println(ProdzajeBroni[nrlinii]);
    String[] l2=ProdzajeBroni[nrlinii].split(",");nrlinii++;
    rodzajeBroni[i].rodzaj=i;
    rodzajeBroni[i].nazwa=l2[0];
    rodzajeBroni[i].typ=int(l2[1]);
    rodzajeBroni[i].zasieg=float(l2[2]);
    rodzajeBroni[i].czestotliwosc=float(l2[3]);
    rodzajeBroni[i].sila=float(l2[4]);
    rodzajeBroni[i].celnosc=float(l2[5]);
    rodzajeBroni[i].liczbaAmunicji=int(l2[6]);
    rodzajeBroni[i].masa=int(l2[7]);
  }
};