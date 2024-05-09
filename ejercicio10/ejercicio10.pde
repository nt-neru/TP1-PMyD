// Objetos
private Vector vectorAB, vectorAC, vectorAD, vectorDB, vectorDC;
private Punto puntoA, puntoB, puntoC, puntoD;

// Variables Globales
private Integer unidad=50;
private PVector centroPantalla;

public void setup(){
  size(700,700);
  
  centroPantalla = new PVector(width/4, height*2/3);
  
  puntoA = new Punto( new PVector(agregarX(-1),agregarY(-2)),
                      "A");
  puntoB = new Punto( new PVector(agregarX(4),agregarY(-1)),
                      "B");
  puntoC = new Punto( new PVector(agregarX(5),agregarY(2)),
                      "C");

  vectorAB = new Vector(puntoA.getCoordenadas(), 
                        puntoB.getCoordenadas(), 
                        "AB", #1777E8);
  vectorAC = new Vector(puntoA.getCoordenadas(), 
                        puntoC.getCoordenadas(), 
                        "AC", #8BE836);
  vectorAD = vectorAB.sumar(vectorAC,"AD");
  vectorDB = vectorAD.restar(vectorAC);
  vectorDC = vectorAD.restar(vectorAB);
  
  puntoD = new Punto( new PVector( vectorAD.getDestino().x , vectorAD.getDestino().y),
                      "D");
}

public void draw(){
  background(255);
  
  dibujarFondo();
  
  puntoA.display();
  puntoB.display();
  puntoC.display();
  
  vectorAB.display();
  vectorAC.display();
  vectorAD.display();
  vectorDB.display();
  vectorDC.display();
  
  puntoD.display();
}

public float agregarX(Integer cant){
  return centroPantalla.x + unidad*cant;
}

public float agregarY(Integer cant){
  return centroPantalla.y + unidad*cant*(-1);
}

public void dibujarFondo(){
  stroke(203,226,255);
  strokeWeight(1);
  fill(180);
  
  //lineas horizontales
  textAlign(RIGHT, CENTER);
  for(int i=0 ; i*unidad < centroPantalla.y ; i++){
    line(0,agregarY(i), width , agregarY(i));
    if(i==0) text(i, centroPantalla.x -6, agregarY(i)+ 8);
    else text(i, centroPantalla.x -6, agregarY(i));
  }
  for(int i=0 ; i*unidad>-height; i--){
    line(0,agregarY(i), width , agregarY(i));
    if(i==0) text(i, centroPantalla.x -6, agregarY(i)+ 8);
    else text(i, centroPantalla.x -6, agregarY(i));
  }
  
  //lineas verticales
  textAlign(CENTER,TOP);
  for(int i=0 ; i*unidad < width ; i++){
    line(agregarX(i), 0 , agregarX(i) , height);
    if(i!=0)  text(i, agregarX(i), centroPantalla.y);
  }
  for(int i=0 ; i*unidad> - centroPantalla.x ; i--){
    line(agregarX(i), 0 , agregarX(i) , height);
    if(i!=0)  text(i, agregarX(i), centroPantalla.y);
  }
  
  // Dibujando centro
  stroke(180);
  strokeWeight(1.5);
  line(centroPantalla.x, 0, centroPantalla.x,height);
  line(0,centroPantalla.y, width , centroPantalla.y);
}
