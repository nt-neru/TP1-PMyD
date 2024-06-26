/** Clase que representa al enemigo*/
class Enemigo extends GameObject{
  /* -- ATRIBUTOS -- */
  private SpriteObject sprite;
  private int estadoAnim;
  private Vector mirando;
  private Vector enemigoJugador;
  private float anguloVision = 30;
  private float tiempoDisparo = 790;
  private float esperaInical = 6; 
  private float velocidadDisparo = 8;
  private float tiempoUltimoDisparo;
  private float tiempoInicial;
  private int contTiempo;
  private boolean primerDisparo = true;
  
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
  /** Dibujando al enemigo */
  public void display(){
    this.sprite.render(this.estadoAnim, new PVector(this.posicion.x,this.posicion.y-30));
  }
  
  /** Deteccion del enemigo con el jugador */
  public boolean detectarJugador(GameObject jugador){
    // Vector relacion entre el enemigo y el jugador
    this.enemigoJugador.origen = this.posicion;
    this.enemigoJugador.destino = PVector.sub(jugador.getPosicion(), this.posicion).normalize().mult(150);
    
    float dotProducto = mirando.obtenerProductoPunto(enemigoJugador);
    float angulo = acos(dotProducto/(mirando.obtenerMagnitud() * enemigoJugador.obtenerMagnitud()));
    angulo = degrees(angulo);
    textSize(40);

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
    
    if (angulo <= anguloVision){ // esta en el campo de vision
      return true;
    }
    else{ // esta fuera del campo de vision
      this.primerDisparo = true;
      contTiempo=0;
      return false;
    }
  }  // end detectarJugador
  
  /** Metodo que dispara una bala segun el tiempo de recarga */
  public void dispararBala(){
    float tiempoActual = millis(); // Obtiene el tiempo actual en milisegundos
    if (primerDisparo) { 
      if(tiempoActual - tiempoInicial >= 100){
        contTiempo++;
        tiempoInicial = tiempoActual; // Actualiza el tiempo inicial
      }
      if(contTiempo >= esperaInical) { // Si ha pasado el tiempo de espera inicial
        primerDisparo = false; // Marcar el primer disparo como realizado
      }
    }
    else if(tiempoActual - tiempoUltimoDisparo > tiempoDisparo) {  
      PVector direccion = new PVector(enemigoJugador.getDestino().x, enemigoJugador.getDestino().y).normalize().mult(velocidadDisparo);
      gestorBalas.generarBala(this.posicion,direccion);
      tiempoUltimoDisparo = tiempoActual;// Actualiza el tiempo del último disparo
    }
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
