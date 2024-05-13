/** Clase que gestiona los sprites de los elementos renderizables del juego */
class SpriteObject {
  /* -- ATRIBUTOS -- */
  /** Representa al SpriteSheet del Objeto */
  private PImage spriteSheet;

  /** Representa el Ancho del Frame individual */
  private int anchoFrame;

  /** Representa el Alto del Frame individual */
  private int altoFrame;

  /** Representa la Posición inicial x del Frame */
  private int xFrame;

  /** Representa la Posición inicial y del Frame (contador para animación hacia arriba) */
  private int yFrame;

  /** Representa el Puntero al primer píxel en x de un frame */
  private float punteroXFrame;

  /** Representa el Puntero al primer píxel en x del siguiente frame a punteroXFrame; */
  private float punteroXFrameSiguiente;

  /** Representa la velocidad con la que se reproducirá la animación (la transición entre sprites) */
  private float velocidadAnimacion;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public SpriteObject(){}
  
  /** Constructor Parametrizado */
  public SpriteObject(String spriteSheet, int anchoFrame, int altoFrame) {
    this.spriteSheet = requestImage(spriteSheet);
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;
    this.xFrame=0;
    this.yFrame=0;
    this.velocidadAnimacion = 8;
  }


  /* -- MÉTODOS -- */
  /** Diubjando los Sprites segun su estado */
  public void render(int estado, PVector posicion) {
    imageMode(CENTER);
    switch(estado) {
    case MaquinaEstadosAnimacion.MOV:{
        yFrame = 0;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        moverSprite();
        break;
      }
    case MaquinaEstadosAnimacion.ESTATICO:{ 
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    case MaquinaEstadosAnimacion.ATACK:{
        yFrame = altoFrame;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        moverSprite();
        break;
      }
    }
  }
  /** Mueve la posicion del Frame en x del SpriteSheet */
  public void moverSprite() {
    //Calculando DeltaTime
    float deltaTime = 1/frameRate;
    //Transicionando entre los distintos Sprites
    this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;

    if (this.punteroXFrame >= this.punteroXFrameSiguiente) {
      this.xFrame += this.anchoFrame;
      this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
      //Reiniciando Punteros para el error de pasos del sprite
      this.punteroXFrame = 0;
      this.punteroXFrameSiguiente = this.anchoFrame;

      //Reiniciando animación al llegar al final del spriteSheet
      if (this.xFrame >= this.spriteSheet.width) {
        this.xFrame = 0;
      }
    }
  }//fin moverSprite
}
