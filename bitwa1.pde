int liczbaWojakow=1000;
int liczbaArmii=2;

Armia[] armie = new Armia[liczbaArmii];
Bron[] bronie = new Bron[liczbaWojakow*2];;
Wojak[] wojacy = new Wojak[liczbaWojakow];

void setup(){
  size(500,500);
  ustawWojakow();
}

void draw(){
  background(127);
  ruszWojakow();
  rysujWojakow();
}



void ustawWojakow(){
  
  for (int i=0;i<liczbaArmii;i++){
    armie[i]= new Armia();
  }
  
  armie[0].kolor=color(255,0,0);
  armie[1].kolor=color(0,0,255);
 
  for (int i=0;i<liczbaWojakow;i++){
    wojacy[i]=new Wojak();
  } //<>//
  for (int i=0;i<10;i++){
    for (int j=0;j<10;j++){
      
      wojacy[j*10+i].poz.x=i*10;
      wojacy[j*10+i].poz.y=j*10;
      wojacy[j*10+i].armia=armie[0];
      wojacy[j*10+i].kolor=wojacy[j*10+i].armia.kolor;
      
      wojacy[j*10+i+100].poz.x=i*10+200;
      wojacy[j*10+i+100].poz.y=j*10;
      wojacy[j*10+i+100].armia=armie[1];
      wojacy[j*10+i+100].kolor=wojacy[j*10+i+100].armia.kolor;
    }
  }
}

void ruszWojakow(){
  for (int i=0;i<liczbaWojakow;i++){
    wojacy[i].rusz(0.1);
  }
}

void rysujWojakow(){
  translate(200,200);
  //scale(0.5);
  for (int i=0;i<liczbaWojakow;i++){ //<>//
    wojacy[i].rysuj();
  }
}