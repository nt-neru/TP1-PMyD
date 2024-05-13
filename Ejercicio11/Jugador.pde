/** Clase que representa al jugador*/
class Jugador extends GameObject{
  /* -- ATRIBUTOS -- */
  /** Representa el Sprite del jugador*/
  private SpriteObject sprite;
  /** Representa el estado de la animacion del sprite */
  private int estadoAnim;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Jugador(){}
  
  /** Constructor Parametrizado */
  public Jugador(PVector posicion, int ancho, int alto){
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("isaac sprite.png",ancho,alto);
    this.estadoAnim = MaquinaEstadosAnimacion.MOV;
  }
  
  /* -- METODOS -- */
  /* Dibuja al jugador */
  public void display(){
    imageMode(CENTER);
    this.sprite.render(this.estadoAnim, new PVector(this.posicion.x,this.posicion.y));
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
