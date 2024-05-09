// Objetos
Vector vectorAB, vectorAC, vectorBD, vectorDC;
int unidad=50;
// Variables Globales
PVector puntoA, puntoB, puntoC , puntoD;

public void setup(){
  size(700,700);
  puntoA = new PVector(agregarX(-1),agregarY(-2));
  puntoB = new PVector(agregarX(4),agregarY(-1));
  puntoC = new PVector(agregarX(5),agregarY(2));

  vectorAB = new Vector(puntoA , puntoB, "AB", #1777E8);
  vectorAC = new Vector(puntoA, puntoC, "AC", #8BE836);
  vectorBD = vectorAB.sumar(vectorAC);
  vectorDC = vectorBD.restar(vectorAB);
  
  puntoD = new PVector(vectorBD.getDestino().x , vectorBD.getDestino().y);
}

public void draw(){
  background(255);
  
  dibujarFondo();
  
  //Dibujando punto D
  strokeWeight(10);
  stroke(0, 191, 255); // Color celeste
  point(puntoD.x, puntoD.y);
  // Definir las coordenadas del texto
  fill(0); // Color del texto negro
  textSize(18); // Tamaño de fuente más grande
  textAlign(CENTER,BOTTOM);
  text("D", puntoD.x, puntoD.y-3);
  
  // Dibujando vectores
  vectorAB.display();
  vectorAC.display();
  vectorBD.display();
  vectorDC.display();
}
public float agregarX(int cant){
  
  float centroX = width/4;
  return centroX + unidad*cant;
}
public float agregarY(int cant){
  float centroY = height*2/3;
  return centroY + unidad*cant*(-1);
}
public void dibujarFondo(){
  
  float centroX = width/4;
  float centroY = height*2/3;

  stroke(203,226,255);
  strokeWeight(1);
  fill(180);
  textAlign(RIGHT, CENTER);
  //lineas horizontales
  for(int i=0 ; i*unidad < centroY; i++){
    line(0,agregarY(i), width , agregarY(i));
    if(i==0) text(i, centroX -6, agregarY(i)+ 8);
    else text(i, centroX -6, agregarY(i));
  }
  for(int i=0 ; i*unidad>-height; i--){
    line(0,agregarY(i), width , agregarY(i));
    if(i==0) text(i, centroX -6, agregarY(i)+ 8);
    else text(i, centroX -6, agregarY(i));
  }
  //lineas verticales
  textAlign(CENTER,TOP);
  for(int i=0 ; i*unidad < width ; i++){
    line(agregarX(i), 0 , agregarX(i) , height);
    if(i!=0)  text(i, agregarX(i), centroY);
  }
  for(int i=0 ; i*unidad> - centroX ; i--){
    line(agregarX(i), 0 , agregarX(i) , height);
    if(i!=0)  text(i, agregarX(i), centroY);
  }
  
  // Dibujando centro
  stroke(180);
  strokeWeight(1.5);
  line(centroX, 0, centroX,height);
  line(0,centroY, width , centroY);
  
}
