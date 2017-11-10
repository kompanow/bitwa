class Wojak
{
  int id;
  Bron[] bronie;
  int liczbaBroni;
  color kolor;
  Armia armia;
  PVector poz;
  float kierunek;
  float predkosc,predkoscMax;
  int typ;
  float zdrowie;
  float celnosc;
  int coRobi; //0-martwy , 1-pilnuje, 2-goni, 3-strzela, 4-ucieka
  Wojak cel;
  
  
  Wojak(){
    poz=new PVector(0,0,0);
    kolor=color(255,255,255);
    typ=3;
    predkosc=1;
    kierunek=1;
    cel=null;
    coRobi=0;
    
  }
  
  void rusz(float deltaT){
    poz=poz.add(PVector.fromAngle(kierunek).mult(predkosc*deltaT));
 //   println(poz.x+" "+poz.y);
  }
  
  void wypisz(){
    println("wojak "+id+"("+poz.x+","+poz.y+")");
    if (armia!=null) println("  armia "+armia.id);
    for (int i=0;i<liczbaBroni;i++){
      bronie[i].wypisz();
    }
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
  
  Wojak szukajNajblizszegoWroga(){
    float odleglosc=1000000;
    Wojak temp;
    temp=null;
 //   PVector vtemp=new PVector();
    for (Armia wrogieWojsko: armia.wojska){
      if (armia!=wrogieWojsko){
        for (int i=0;i<wrogieWojsko.liczbaWojakow;i++)
        {
          if (wrogieWojsko.wojacy[i].coRobi>0)
          {
            float d=(wrogieWojsko.wojacy[i].poz.x-poz.x)*(wrogieWojsko.wojacy[i].poz.x-poz.x)+
                    (wrogieWojsko.wojacy[i].poz.y-poz.y)*(wrogieWojsko.wojacy[i].poz.y-poz.y);
                    
            if (d<odleglosc){
              d=odleglosc;
              temp=wrogieWojsko.wojacy[i];
            }
          }
        }
        
      }
    }
    return temp;
  }
}