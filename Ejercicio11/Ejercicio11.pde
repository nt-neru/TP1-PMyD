/* -- VARIABLES -- */
private Jugador jugador;
private Enemigo enemigo, enemigoDefecto;
private PImage fondo;

public void setup(){
  size(1200,800);
  
  jugador = new Jugador(new PVector(200,200),84,102);
  //enemigoDefecto = new Enemigo();
  enemigo = new Enemigo(new PVector(width/2,height/2-30),44*5,48*5);
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
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  
}
