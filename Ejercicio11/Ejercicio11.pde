/* -- VARIABLES -- */
private Jugador jugador;
private Enemigo enemigo, enemigoDefecto;
private PImage fondo;
private GestorBalas gestorBalas;

public void setup(){
  size(1200,800);
  
  jugador = new Jugador(new PVector(200,200),84,102);
  //enemigoDefecto = new Enemigo();
  enemigo = new Enemigo(new PVector(width/2,height/2),44*5,48*5);
  gestorBalas = new GestorBalas();
  fondo = loadImage("Room.jpg");
  fondo.resize(width,height); 
}

public void draw(){
  imageMode(CORNER);
  image(fondo, 0, 0, width, height);
  
  jugador.display();
  // Verifica si el mouse está sobre el jugador
  if (dist(mouseX, mouseY, jugador.getPosicion().x, jugador.getPosicion().y) < jugador.getAncho()) {
    jugador.setPosicion(new PVector(mouseX,mouseY));
  }
  
  enemigo.display();
  //enemigoDefecto.display();
  enemigo.setEstadoAnim(MaquinaEstadosAnimacion.MOV);
  enemigo.detectarJugador(jugador);
  
  gestorBalas.mostrarBalas();
  gestorBalas.moverBalas();
  
  if(enemigo.detectarJugador(jugador)){
    enemigo.setEstadoAnim(MaquinaEstadosAnimacion.ATACK);
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ATACK);
    enemigo.dispararBala();
  }
  else{
    enemigo.setEstadoAnim(MaquinaEstadosAnimacion.MOV);
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV);
  }
}
