/** Clase que representa a un punto */
class Punto{
  /*  -- ATRIBUTOS --  */
  /** Representa el nombre del punto */
  private String nombre;
  /** Representa las coordenadas x e y del punto */
  private PVector coordenadas;
  
  /*  -- CONSTRUCTORES --  */
  /** Constructor por defecto*/
  public Punto(){}
  
  /** Constructor parametrizado */
  public Punto(PVector coordenadas, String nombre){
    this.coordenadas = coordenadas;
    this.nombre = nombre;
  }
  
  /*  -- ATRIBUTOS --  */
  /** Metodo que dibuja el punto */
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
  
  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  /** Devuelve el valor de las coordenadas del punto */
  public PVector getCoordenadas(){
    return this.coordenadas;
  }
  /*Setters*/
  /** Asigna unas nuevas coordenadas al punto*/
  public void setCoordenadas(PVector coordenadas){
    this.coordenadas = coordenadas;
  }
}
