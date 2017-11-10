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
    typ=3;
    predkosc=1;
    kierunek=1;
  }
  
  void rusz(float deltaT){
    poz=poz.add(PVector.fromAngle(kierunek).mult(predkosc*deltaT));
 //   println(poz.x+" "+poz.y);
  }
  
  void rysuj(){
    pushMatrix();
    translate(poz.x,poz.y);
    rotate(kierunek);
    stroke(kolor);
    switch(typ){
      case 1:{
        ellipse(0,0,10,10);
        break;
      }
      case 2:{
        beginShape();
        vertex(-5,-4);
        vertex(5,0);
        vertex(-5,4);
        endShape(CLOSE);
        
        break;
      }
      case 3:{
        beginShape();
        vertex(-5,-4);
        vertex(5,-4);
        vertex(5,4);
        vertex(-5,4);
        endShape(CLOSE);
        line(0,0,5,0);
      }
    }
    popMatrix();
  }
}