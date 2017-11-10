class Wojak
{
  Bron[] bronie;
  color kolor;
  Armia armia;
  PVector poz;
  float kierunek;
  float predkosc;
  int typ;
  float zdrowie;
  float celnosc;
  
  Wojak(){
    poz=new PVector(0,0,0);
    kolor=color(255,255,255);
    typ=1;
    predkosc=1;
    kierunek=0;
  }
  
  void rusz(float deltaT){
    poz=poz.add(PVector.fromAngle(kierunek).mult(predkosc*deltaT));
    println(poz.x+" "+poz.y);
  }
  
  void rysuj(){
    pushMatrix();
    translate(poz.x,poz.y);
    stroke(kolor);
    switch(typ){
      case 1:ellipse(0,0,10,10);break;
    }
    popMatrix();
  }
}