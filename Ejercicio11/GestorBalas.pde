/** Clase que contiene el ArrayList de los Enemigos: Gestionará la aparición de varios enemigos */
class GestorBalas {
  /* -- ATRIBUTOS -- */
  /** Representa la lista dinamica que contiene a los enemigos */
  private ArrayList<Bala> balas;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorBalas() {
    this.balas = new ArrayList <Bala>();
  }

  /* -- MÉTODOS -- */
  /** Mostrando los enemigos */
  public void mostrarBalas() {
    for (int i = this.balas.size() - 1; i >= 0; i--) {
      Bala bala = this.balas.get(i);
      bala.display();
      if (bala.getPosicion().x > width || bala.getPosicion().y < 0 || bala.getPosicion().y > height) {
        this.balas.remove(i); // Elimina el elemento en la posición i
      }
    }
  }
  public void moverBalas(){
    for (Bala e : this.balas) {      
      e.mover();
    }
  }
  /** Genera el grupo de enemigos */
  public void generarBala(PVector posicion, PVector direccion) {
    Bala e = new Bala(new PVector(posicion.x, posicion.y), 60, 60, direccion);
    this.balas.add(e);
  }
}
