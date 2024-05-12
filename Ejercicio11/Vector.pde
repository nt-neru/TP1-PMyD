class  Vector{
  /* -- ATRIBUTOS -- */
  private PVector origen;
  private PVector destino;
  private Integer tamañoFlecha = 13;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Vector(){}
  /** Constructor parametrizado */
  public Vector(PVector origen, PVector destino){
    this.origen = origen;
    this.destino = destino;
  }
  
  /* -- METODOS --*/
  /** Metodo que dibuja al vector */
  public void display(){
    strokeWeight(2);
    stroke(#EBFF6A);
    line(this.origen.x, this.origen.y, this.origen.x + this.destino.x, this.origen.y + this.destino.y);
  
    // Dibujar la flecha al final del vector
    float angle = atan2(this.destino.y , this.destino.x ); //Calcula angulo entre la linea Esto nos dará el ángulo en radianes.
    strokeWeight(3);
    fill(#EBFF6A);
    pushMatrix(); // Todos los cambios aplicados no afectaran a otros objetos que se dibujen después.
      translate(this.origen.x + this.destino.x, this.origen.y + this.destino.y); // Se traslada el origen del sistema de coordenadas al punto final del vector
      rotate(angle); //Se rota el sistema de coordenadas al ángulo del vector
      triangle(-this.tamañoFlecha,this.tamañoFlecha/2 , -this.tamañoFlecha, -this.tamañoFlecha/2, 0, 0);
    popMatrix();
  }
  
  public float obtenerProductoPunto(Vector vector){
    return PVector.dot(this.destino,vector.getDestino());
  }
  public float obtenerMagnitud(){
    return this.destino.mag();
  }
  
  /* ASESORES */
  /* Getters */
  public PVector getOrigen(){
    return this.origen;
  }
  public PVector getDestino(){
    return this.destino;
  }
  
  /* Setters */
  public void setDestino(PVector nuevaPos){
    this.destino = nuevaPos;
  }
  public void setOrigen(PVector nuevaPos){
    this.origen = nuevaPos;
  }
} //end class Vector
