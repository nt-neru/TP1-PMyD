class Vector{
  /** Atributos*/
  private PVector origen;
  private PVector destino;
  private PVector componentes;
  private String nombre;
  private Integer tamañoFlecha = 11;
  private color colorVector;
  
  /** Constructor parametrizado origen 0*/
  public Vector(PVector destino, String nombre){
    this.nombre = nombre;
    this.origen = new PVector(0,0);
    this.destino = destino;
    this.componentes = this.destino;
  }
  
  /** Constructor parametrizado, Vector con origen y destino */
  public Vector(PVector origen, PVector destino, String nombre, color colorVector ){
    this.origen = origen;
    this.destino = destino;
    this.nombre = nombre;
    this.componentes = PVector.sub(this.destino,this.origen);
    this.colorVector = colorVector;
  }
  
  /** Metodo que dibuja el vector */
  public void display(){
    strokeWeight(2);
    stroke(this.colorVector);
    line(this.origen.x, this.origen.y, this.destino.x, this.destino.y);
    
    // Dibujar el nombre del vector en el punto medio
    float puntoMedioX = (this.origen.x + this.destino.x) / 2;
    float puntoMedioY = (this.origen.y + this.destino.y) / 2;
    fill(70);
    textSize(16);
    textAlign(CENTER,TOP);
    text(this.nombre, puntoMedioX, puntoMedioY);
    
    // Dibujar la flecha al final del vector
    float angle = atan2(this.componentes.y, this.componentes.x); //Calcula angulo entre la linea Esto nos dará el ángulo en radianes.
    strokeWeight(0);
    pushMatrix(); // Todos los cambios aplicados no afectaran a otros objetos que se dibujen después.
      translate(this.destino.x, this.destino.y); // Se traslada el origen del sistema de coordenadas al punto final del vector
      rotate(angle); //Se rota el sistema de coordenadas al ángulo del vector
      triangle(-this.tamañoFlecha,this.tamañoFlecha/2 , -this.tamañoFlecha, -this.tamañoFlecha/2, 0, 0);
      
      /*stroke(0);
      strokeWeight(1);
      line(0,-200,0,200);*/
    popMatrix();
  
  }
  /** Metodo que suma dos Vectores*/
  public Vector sumar(Vector sumando, String nombre){
    Vector vectorSuma = new Vector(this.origen, 
                        PVector.add(this.destino, sumando.getComponentes()), 
                        nombre,
                        color(random(255),random(255),random(255)));
    return vectorSuma;
  }

  /** Metodo que resta dos Vectores*/
  public Vector restar(Vector sustraendo){ 
    Vector vectorResta = new Vector(this.destino, 
                         PVector.sub(this.destino, sustraendo.getComponentes()), 
                         "-"+sustraendo.getNombre()+"'",
                         sustraendo.getColor());
    return vectorResta;
  }
  
  //** Gets y Sets*/
  public PVector getOrigen(){
    return this.origen;
  }
  public PVector getComponentes(){
    return this.componentes;
  }
  public String getNombre(){
    return this.nombre;
  }
  public PVector getDestino(){
    return this.destino;
  }
  public color getColor(){
    return this.colorVector;
  }
  
  public void  setColor(color colorVector){
    this.colorVector = colorVector;
  }
}
