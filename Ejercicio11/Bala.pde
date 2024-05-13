/** Clase que representa a la llave del juego */
class Bala extends GameObject{
  /* -- ATRIBUTOS -- */
  private SpriteObject sprite;
  private int estadoAnim;
  private PVector direccion;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Bala() {}

  /** Constructor parametrizado */
  public Bala(PVector posicion, int ancho, int alto, PVector direccion) {
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("bala.png",ancho,alto);
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
    this.direccion = direccion;
  }
  
  /* -- MÉTODOS -- */
  /** Dibuja la bala en el escenario */
  public void display() {    
    this.sprite.render(this.estadoAnim,this.posicion);
  }
  /** Mueve la bala */
  public void mover(){
    this.posicion.add(this.direccion);
  }
  
  /* -- ASESORES -- */
  /* Setters */
  public void setDireccion(PVector direccion){
    this.direccion = direccion;
  }
}
