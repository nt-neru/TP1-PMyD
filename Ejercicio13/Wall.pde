class Wall{
  private PVector posicion;
  private int ancho;
  private int alto;
  private Vector direccion;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor Parametrizado */
  public Wall(PVector posicion, int ancho, int alto){
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
    this.direccion = new Vector(this.posicion, new PVector(0,1));
  }
  
  /** Metodo que dibuja una pared */
  public void display(){
    fill(200); 
    noStroke();
    rect(this.posicion.x, this.posicion.y, ancho, alto);

    stroke(0);
    this.direccion.display();
  }
  
}
