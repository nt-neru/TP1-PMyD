/** Clase que representa al jugador*/
class Zombie extends GameObject{
  /* -- ATRIBUTOS -- */
  /** Representa el Sprite del jugador*/
  private SpriteObject sprite;  
  private int estadoAnim;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Zombie(){}
  
  /** Constructor Parametrizado */
  public Zombie(PVector posicion, int ancho, int alto){
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("zombie.png", this.ancho, this.alto);
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  /* -- METODOS -- */
  /* Dibuja al jugador */
  public void display(){
    imageMode(CENTER);
    sprite.render(estadoAnim, this.posicion);
  }
  
  /* -- ASESORES -- */
  /* Setters */
  public void setEstadoAnim(int estadoAnim){
    this.estadoAnim = estadoAnim;
  }
  /* Getters */
  public int getEstadoAnim(){
    return this.estadoAnim;
  }
}
