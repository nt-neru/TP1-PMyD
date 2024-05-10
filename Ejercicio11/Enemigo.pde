/** Clase que representa al enemigo*/
class Enemigo extends GameObject{
  /* -- ATRIBUTOS -- */
  private SpriteObject sprite;
  private int estadoAnim;
  
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
  }
  
  /* -- METODOS -- */
  public void display(){
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
