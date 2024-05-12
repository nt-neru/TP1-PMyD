/** Clase que representa al enemigo*/
class Enemigo extends GameObject{
  /* -- ATRIBUTOS -- */
  private SpriteObject sprite;
  private int estadoAnim;
  private Vector mirando;
  private Vector enemigoJugador;
  private float anguloVision = 30;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Enemigo(){
    this.posicion = new PVector(width/2, height/2);
    this.sprite = new SpriteObject("enemigo 001.png",104,94);
  }
  /** Constructor Parametrizado */
  public Enemigo(PVector posicion, int ancho, int alto){
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("enemigo 002.png",ancho,alto);
    this.mirando = new Vector(this.posicion,new PVector(1,0).mult(100)); // vector unitario mirando derecha
    this.enemigoJugador = new Vector();
  }
  
  /* -- METODOS -- */
  public void display(){
    this.sprite.render(this.estadoAnim, new PVector(this.posicion.x,this.posicion.y-30));
    this.mirando.display();
    
    // Calcular el vector de dirección del ángulo de visión
    PVector direccion = PVector.fromAngle(radians(anguloVision));
    PVector direccion2 = PVector.fromAngle(radians(-anguloVision));
    
    // Calcular el punto final del campo de visión
    PVector puntoFinal = PVector.add(this.posicion, direccion.mult(700));
    PVector puntoFinal2 = PVector.add(this.posicion, direccion2.mult(700));
    
    // Dibujar la línea que representa el campo de visión
    line(this.posicion.x, this.posicion.y, puntoFinal.x, puntoFinal.y);
    line(this.posicion.x, this.posicion.y, puntoFinal2.x, puntoFinal2.y);
  }
  
  public void detectarJugador(GameObject jugador){
    // Vector relacion entre el enemigo y el jugador
    this.enemigoJugador.origen = this.posicion;
    this.enemigoJugador.destino = PVector.sub(jugador.getPosicion(), this.posicion).normalize().mult(150);
    this.enemigoJugador.display();
    
    float dotProducto = mirando.obtenerProductoPunto(enemigoJugador);
    float angulo = acos(dotProducto/(mirando.obtenerMagnitud() * enemigoJugador.obtenerMagnitud()));
    angulo = degrees(angulo);
    textSize(40);

    if (angulo <= anguloVision){ // esta en el campo de vision
      fill(255,0,0);
      text(" Esta al frente ",enemigo.getPosicion().x-100,enemigo.getPosicion().y);
    }
    else if (angulo > anguloVision){ // esta fuera del campo de vision
      text(" No hay nada ",enemigo.getPosicion().x-100,enemigo.getPosicion().y);
    }
    
    // VISUALIZACION DE PARAMETROS
    textSize(20);
    fill(255);
    text("Producto Punto: "+ dotProducto,50,100);
    
    if(angulo <= anguloVision){
        fill(#77dd77);
    }
    text("Angulo del jugador desde el enemigo: " + nfc(angulo,1) +"°",50,130);
    fill(255);
    text("Angulo de Vision: " + anguloVision +"°",50,160);
  }  // end detectarJugador
  
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
