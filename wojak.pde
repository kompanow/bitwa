class Wojak
{
  Bron[] bronie;
  color kolor;
  Armia armia;
  PVector poz;
  int typ;
  float zdrowie;
  
  Wojak(){
    poz=new PVector(0,0,0);
    kolor=color(255,255,255);
    typ=1;
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