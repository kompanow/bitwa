class Armia{
  color kolor;
  Armia[] wojska;
  int id;
  int liczbaWojakow=100;
  Wojak[] wojacy= new Wojak[liczbaWojakow];
  
  void ustawWojakow(){
       
    for (int i=0;i<liczbaWojakow;i++){
      wojacy[i]=new Wojak();
      wojacy[i].id=i;
    }
    for (int i=0;i<10;i++){
      for (int j=0;j<10;j++){
        
        wojacy[j*10+i].poz.x=i*10+150*this.id;
        wojacy[j*10+i].poz.y=j*10+60*this.id;
        wojacy[j*10+i].armia=this;
        wojacy[j*10+i].kolor=this.kolor;
        wojacy[j*10+i].liczbaBroni=2;
        wojacy[j*10+i].bronie=new Bron[wojacy[j*10+i].liczbaBroni];
        wojacy[j*10+i].bronie[0]=rodzajeBroni[0].kopiujNiedokladnie();
        wojacy[j*10+i].bronie[1]=rodzajeBroni[1].kopiujNiedokladnie();
        wojacy[j*10+i].zasiegBroni=wojacy[j*10+i].bronie[1].zasieg;
        
      }
    }
  }
  
  void decydujWojakow(){
    for (Wojak wojak:wojacy){
      wojak.decyduj();
    }
  }
  
  void ruszWojakow(){
    for (int i=0;i<liczbaWojakow;i++){
      wojacy[i].rusz(0.1);
    }
  }
  
  void wypiszWojakow(){
    for (int i=0;i<liczbaWojakow;i++){
      wojacy[i].wypisz();
    }
  }
  
  void rysujWojakow(){
    for (int i=0;i<liczbaWojakow;i++){
      wojacy[i].rysuj();
      wojacy[i].pokazWroga();
    }
   
  }
  
  void listaWojakow(int x,int y){
    for (int i=0;i<liczbaWojakow;i++){
      text (str(wojacy[i].coRobi),x,y*10); //<>//
    }    
  }
}