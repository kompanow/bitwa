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
  float zasiegWzroku;
  float zasiegBroni;
  Wojak cel;
  Strzal strzal;
  
  
  Wojak(){
    poz=new PVector(0,0,0);
    kolor=color(255,255,255);
    typ=3;
    predkosc=1;
    kierunek=0;
    cel=null;
    coRobi=1;
    zasiegWzroku=1000;
    
  }
  
  void decyduj(){
    Wojak najblizszy=szukajNajblizszegoWroga();
    if (najblizszy!=null){
      cel=najblizszy;
     // println("#");
      float odleglosc=(najblizszy.poz.x-poz.x)*(najblizszy.poz.x-poz.x)+
                      (najblizszy.poz.y-poz.y)*(najblizszy.poz.y-poz.y);
                      
      if (odleglosc>zasiegBroni*zasiegBroni){
        coRobi=2; //goni
        predkosc=1;
      }else{
        coRobi=3; //strzela
        predkosc=0;
      }
        kierunek=atan2(najblizszy.poz.y-poz.y,najblizszy.poz.x-poz.x)*random(0.99,1.01);
    }      
  }
    
    
    
 
  
  void rusz(float deltaT){
    if (coRobi>1){
      
      poz=poz.add(PVector.fromAngle(kierunek).mult(predkosc*deltaT));
      
    }
    
 
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
    float odleglosc=zasiegWzroku*zasiegWzroku;
    Wojak temp;
    temp=null;
 //   PVector vtemp=new PVector();
 //   println('@');
    for (Armia wrogieWojsko: armia.wojska){
      if (armia!=wrogieWojsko){
        //for (int i=0;i<wrogieWojsko.liczbaWojakow;i++)
        for (Wojak woj: wrogieWojsko.wojacy)
        {
 //         print('#');
          //if (wrogieWojsko.wojacy[i].coRobi>0)
          if (woj.coRobi>0)
          {
            float d=(woj.poz.x-poz.x)*(woj.poz.x-poz.x)+
                    (woj.poz.y-poz.y)*(woj.poz.y-poz.y);
           // println(d);        
            if (d<odleglosc){
              odleglosc=d;
              temp=woj;
            }
          }
        }
  //      println();
        
      }
    }
    return temp;
  }
  void pokazWroga(){
  //  stroke(255);
    if (null!=cel) line(cel.poz.x,cel.poz.y,poz.x,poz.y);
    
  }
}