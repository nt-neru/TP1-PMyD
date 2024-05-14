/** Clase para representar una bola */
class Ball {
  PVector posicion; // Posición
  PVector velocidad; // Velocidad
  float diametro; // Diámetro
  float factorDeFrenado; // Factor de disminución de velocidad
  Vector direccion;
  
  Ball(PVector posicion, float diametro) {
    this.posicion = posicion;
    this.velocidad = new PVector(0,0);
    this.diametro = diametro;
    this.direccion = new Vector();
    //this.factorDeFrenado = 0.97; // Factor de disminución de velocidad
  }
  
  void dibujar() {
    fill(0);
    noStroke();
    ellipse(this.posicion.x, this.posicion.y, diametro, diametro);
    direccion.display();
  }
  
  void golpear(PVector velocidad) {
    // Aplica la velocidad de golpe a la bola
    this.velocidad = velocidad;
    this.direccion.setOrigen(this.posicion);
    this.direccion.setDestino(this.velocidad);
  }
  
  void actualizar() {    
    // Actualiza la posición de la bola
    this.posicion.add(this.direccion.destino);
    
    // Hay que disminuir la velocidad con el tiempo
    
  }
  
  boolean colisionaCon(Ball otra) {
    // Verifica si hay colisión entre esta bola y otra
    float distancia = this.posicion.dist(otra.posicion);
    return distancia < this.diametro / 2 + otra.diametro / 2;
  }
  
  PVector calcularNormal(Ball otra) {
    // Calcula la normal de la colisión entre esta bola y otra
    return PVector.sub(this.posicion, otra.posicion).normalize();
  }
  
  void reflejar(PVector normal) {
    // Refleja la velocidad de esta bola basándose en la normal de la colisión
    float dot = PVector.dot(this.velocidad, normal);
    PVector reflejada = PVector.sub(this.velocidad, PVector.mult(normal, 2 * dot));
    this.velocidad.set(reflejada);
  }
  
}
