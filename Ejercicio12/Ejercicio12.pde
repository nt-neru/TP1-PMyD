/* -- VARIABLES -- */
private Zombie zombie;
private Tank tank;

public void setup(){
  size(800,800);
  
  zombie = new Zombie(new PVector(100,100),35*4,40*4);
  tank = new Tank(new PVector(width/2,height/2+200),44*4,76*4);
}

public void draw(){
  imageMode(CORNER);
  background(50);
  
  zombie.display();
  // Verifica si el mouse está sobre el zombie
  if (dist(mouseX, mouseY, zombie.getPosicion().x, zombie.getPosicion().y) < zombie.getAncho()) {
    zombie.setPosicion(new PVector(mouseX,mouseY));
  }
  
  tank.setEstadoAnim(MaquinaEstadosAnimacion.MOV);
  tank.detectarZombie(zombie);
  
  
  if(tank.detectarZombie(zombie)){
    tank.setEstadoAnim(MaquinaEstadosAnimacion.ATACK);    
    tank.giroDireccion();
  }
  else{    
    tank.setEstadoAnim(MaquinaEstadosAnimacion.MOV);
    tank.display();
  }
}