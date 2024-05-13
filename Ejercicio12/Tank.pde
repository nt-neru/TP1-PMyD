/** Clase que representa al enemigo*/
class Tank extends GameObject{
  /* -- ATRIBUTOS -- */
  private SpriteObject sprite;
  private int estadoAnim;
  private Vector direccion;
  private Vector enemigoJugador;
  private float anguloVision = 30;
  private float distanciaVision = 400;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Tank(){
    this.posicion = new PVector(width/2, height/2);
  }
  /** Constructor Parametrizado */
  public Tank(PVector posicion, int ancho, int alto){
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("gatito tanke.png", this.ancho, this.alto);
    this.enemigoJugador = new Vector();
    this.direccion = new Vector(this.posicion,new PVector(0,-1)); // vector unitario mirando derecha
  }
  
  /* -- METODOS -- */
  /** Dibujando al tanque */
  public void display(){
    sprite.render(this.estadoAnim, this.posicion);
    direccion.display();
    float anguloVision = radians(this.anguloVision);
    // Calcular el vector de dirección del ángulo de visión
    PVector direccion1 = PVector.fromAngle(-PI/2 + anguloVision); // Vector para la primera línea
    PVector direccion2 = PVector.fromAngle(-PI/2 - anguloVision); // Vector para la segunda línea
  
    // Calcular el punto final del campo de visión
    PVector puntoFinal = PVector.add(this.posicion, direccion1.mult(700));
    PVector puntoFinal2 = PVector.add(this.posicion, direccion2.mult(700));
    
    // Dibujar la línea que representa el campo de visión
    line(this.posicion.x, this.posicion.y, puntoFinal.x, puntoFinal.y);
    line(this.posicion.x, this.posicion.y, puntoFinal2.x, puntoFinal2.y);
    
    noFill();
    ellipse(this.posicion.x, this.posicion.y, distanciaVision*2, distanciaVision*2);
  }
  
  /** dibujando el tanque con giro */
  public void displayCenter(){  
    sprite.render(this.estadoAnim, new PVector(0,0));
    //this.direccion = this.enemigoJugador; // Funciona pero al resto no lo dibuja
    float anguloVision = radians(this.anguloVision);
     // Calcular el vector de dirección del ángulo de visión
    PVector direccion1 = PVector.fromAngle(-PI/2 + anguloVision).mult(700);
    PVector direccion2 = PVector.fromAngle(-PI/2 - anguloVision).mult(700);
  
    // Dibujar la línea que representa el campo de visión
    line(0, 0, direccion1.x, direccion1.y);
    line(0, 0, direccion2.x, direccion2.y);
    noFill();
    ellipse(0, 0, distanciaVision*2, distanciaVision*2);
  }
  
  /** Deteccion del tanque con el Zombie */
  public boolean detectarZombie(GameObject jugador){
    // Vector relacion entre el enemigo y el jugador
    this.enemigoJugador.origen = this.posicion;
    this.enemigoJugador.destino = PVector.sub(jugador.getPosicion(), this.posicion);
    this.enemigoJugador.display();
    
    float angulo = PVector.angleBetween(direccion.destino, enemigoJugador.destino);
    angulo = degrees(angulo);
    textSize(40);

    // VISUALIZACION DE PARAMETROS
    textSize(20);    
    text("Magnitud: " + this.enemigoJugador.destino.mag(),50,100);
    fill(255);
    if(angulo <= anguloVision && enemigoJugador.destino.mag() < distanciaVision){
        fill(#77dd77);
    }
    text("Angulo del jugador desde el enemigo: " + nfc(angulo,1) +"°",50,130);
    fill(255);
    text("Angulo de Vision: " + anguloVision +"°",50,160);
    
    if (angulo <= anguloVision && enemigoJugador.destino.mag() <= distanciaVision){ // esta en el campo de vision
      return true;
    }
    else{ 
      this.direccion = new Vector(this.posicion,new PVector(0,-1)); // resetea su direccion de vision 
      return false;
    }
  }  // end detectarJugador
  
  /** Gira al tanque segun el angulo entre la direccion a donde mira el tanque y la distancia con el enemigo*/
  public void giroDireccion(){
    float angulo = PVector.angleBetween(this.direccion.destino, this.enemigoJugador.destino);
    PVector rotacion = direccion.destino.cross(enemigoJugador.destino);
    int clockWise = 1;
    println("Rotacion: "+rotacion);
    if(rotacion.z < 0){ // si la rotacion es negativo clockWise es negativo para ayudar a girar la img
      clockWise = -1;
    }
      translate(this.posicion.x, this.posicion.y);
      rotate(angulo*clockWise);
      displayCenter();
  }
  
  /* -- ASESORES -- */
  /* Setters */
  public void setEstadoAnim(int estado){
    this.estadoAnim = estado;
  }
  /* Getters */
  public Integer getEstadoAnim(){
    return this.estadoAnim;
  }
}
