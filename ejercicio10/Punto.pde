class Punto{
  /** Atributos */
  private String nombre;
  private PVector coordenadas;
  
  /** Constructor parametrizado */
  public Punto(PVector coordenadas, String nombre){
    this.coordenadas = coordenadas;
    this.nombre = nombre;
  }
  
  /** Metodo que dibuja al punto */
  public void display(){
    strokeWeight(10);
    stroke(0, 191, 255,150); // Color celeste
    point(this.coordenadas.x, this.coordenadas.y);
    
    // Definir las coordenadas del texto
    fill(10);
    textSize(18);
    textAlign(CENTER,BOTTOM);
    text(nombre, this.coordenadas.x, this.coordenadas.y-3);
  }
  
  /** Gets */
  public PVector getCoordenadas(){
    return this.coordenadas;
  }
}
