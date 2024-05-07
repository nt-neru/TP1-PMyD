class Vector{
  /** Atributos*/
  private PVector origen;
  private PVector destino;
  
  /** Constructor sin parametros*/
  public Vector(){}
  
  /** Constructor parametrizado */
  public Vector(PVector origen, PVector destino){
    this.origen = origen;
    this.destino = destino;
  }
  
  /** Metodo que dibuja al vector */
  public void display(){
    strokeWeight(2);
    line(origen.x, origen.y, destino.x, destino.y);
  }
  /** Metodo que suma dos Vectores*/
  public Vector sumar(Vector sumando){
    Vector vectorSuma = new Vector();
    vectorSuma.origen = this.destino;
    vectorSuma.destino = PVector.add(this.destino, sumando.destino);
    vectorSuma.destino.sub(sumando.origen);
    return vectorSuma;
  }

  /** Metodo que resta dos Vectores*/
  // BD - AB B=origen D=destino
  public Vector restar(Vector sustraendo){ //AB   A=origen B=Destino
    Vector vectorResta = new Vector();
    vectorResta.origen = this.destino;
    vectorResta.destino = PVector.sub(this.destino, sustraendo.destino);
    vectorResta.destino.add(sustraendo.origen);
    return vectorResta;
    //es en base a coordenadas
  }
  
  //** Gets y Sets*/
  public void setOrigen(PVector origen){
    this.origen = origen;
  }
  public PVector getOrigen(){
    return this.origen;
  }
  
  public void setDestino(PVector destino){
    this.destino = destino;
  }
  public PVector getDestino(){
    return this.destino;
  }
}
