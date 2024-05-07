// Objetos
Vector vectorAB, vectorAC, vectorBD, vectorDC;
int unidad=30;
// Variables Globales
PVector puntoA, puntoB, puntoC , puntoD;

public void setup(){
  size(700,700);
  puntoA = new PVector(agregarX(-1),agregarY(-2));
  puntoB = new PVector(agregarX(4),agregarY(-1));
  puntoC = new PVector(agregarX(5),agregarY(2));
  
  vectorAB = new Vector(puntoA , puntoB);
  vectorAC = new Vector(puntoA, puntoC);
  vectorBD = vectorAB.sumar(vectorAC);
  vectorDC = vectorBD.restar(vectorAB);
}

public void draw(){
  background(255);
  
  strokeWeight(1);
  line(width/2, 0, width/2,height);
  line(0,height/2, width , height/2);
  strokeWeight(10);
  point(width/2,height/2);
  point(puntoD.x, puntoD.y);
  vectorAB.display();
  vectorAC.display();
  vectorBD.display();
  vectorDC.display();
}
public int agregarX(int cant){
  return width/2 + unidad*cant;
}
public int agregarY(int cant){
  return height/2 + unidad*cant*(-1);
}
