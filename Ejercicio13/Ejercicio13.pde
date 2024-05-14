Ball whiteBall;
boolean arrastrando = false; // Indica si el jugador arrastra el mouse
Wall wall;
ArrayList<Ball> balls;

void setup() {
  size(800, 600);
  whiteBall = new Ball(new PVector(width / 2, height / 2), 30);
  wall = new Wall(new PVector(width/2,25),width,50 );
  balls = new ArrayList<Ball>();
  
  balls.add(new Ball(new PVector(300,200), 20));

}

void draw() {
  background(#67B766);
  rectMode(CENTER);

  wall.display();
  
  // Actualizar y dibujar la bola que se puede arrastrar
  whiteBall.actualizar();
  whiteBall.dibujar();
  
  for (Ball ball : balls) {
    ball.actualizar();
    ball.dibujar();    
    line(whiteBall.posicion.x, whiteBall.posicion.y, ball.posicion.x, ball.posicion.y);

    // Verificar colisión entre las bolas
    if (whiteBall.colisionaCon(ball)) {
      // Calcular la normal de la colisión
      PVector normal = whiteBall.calcularNormal(ball);
      
      // Reflejar las velocidades de ambas bolas
      whiteBall.reflejar(normal);
      ball.direccion.destino.set(normal.mult(-1));
    }
    // Verificar colisión entre las bolas
    /*for (Ball otherBall : balls) {
      if (ball != otherBall && ball.colisionaCon(otherBall)) {
        // Calcular la normal de la colisión
        PVector normal = ball.calcularNormal(otherBall);
        
        // Reflejar las velocidades de ambas bolas
        ball.reflejar(normal);
        otherBall.reflejar(normal);
      }
    }*/
  }
  
  if (arrastrando) {
    // Dibujar línea entre la bola y el cursor del mouse
    line(whiteBall.posicion.x, whiteBall.posicion.y, mouseX, mouseY);
  }
  
  // Verificar si la bola ha colisionado con la pared
  if (whiteBall.posicion.y + whiteBall.diametro / 2 <= wall.posicion.y + wall.alto) {
    PVector normal = wall.direccion.destino;
    // Calcular la reflexión de la velocidad de la bola
    //PVector direccionRef = PVector.sub(whiteBall.velocidad, PVector.mult(normal, 2 * PVector.dot(whiteBall.velocidad, normal)));

    normal = PVector.mult(normal, 2 * PVector.dot(whiteBall.velocidad, normal));
    PVector direccionRef = PVector.sub(whiteBall.velocidad, normal);

    // Asignar la nueva velocidad reflejada a la dirección de la bola
    whiteBall.direccion.setDestino(direccionRef);
  }
  
}

void mousePressed() {
  // Verificar si el mouse está sobre la bola que se puede arrastrar
  if (dist(mouseX, mouseY, whiteBall.posicion.x, whiteBall.posicion.y) < whiteBall.diametro / 2) {
    // Iniciar arrastre de la bola
    arrastrando = true;
  }

}

void mouseReleased() {
  if (arrastrando) {
    // Calcular la velocidad del golpe
    whiteBall.golpear(PVector.sub(whiteBall.posicion, new PVector(mouseX, mouseY)).mult(0.08));

    arrastrando = false;
  }
}
