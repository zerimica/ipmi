void setup() {
  size(800, 400);
  // color de fondo:
  background(255);

  // Centro del personaje (movido a la derecha)
  float cx = 500;
  float cy = 200;

  PImage miFoto;
  // cargar la imagen en la variable
  miFoto = loadImage("xdxd.jpg");
  // muestro la imagen:
  image(miFoto, 0, 0, 400, 400);

  // Pelo largo (fondo del cabello)
  fill(0);
  ellipse(cx, cy, 160, 260); // cabello largo

  // Cabeza
  fill(235, 180, 145); // tono piel
  ellipse(cx, cy - 80, 100, 120); // cara

  // Flequillo
  fill(0);
  arc(cx, cy - 100, 100, 80, PI, TWO_PI); // flequillo sobre la frente

  // Ojos
  fill(255);
  ellipse(cx - 20, cy - 90, 20, 15);
  ellipse(cx + 20, cy - 90, 20, 15);

  fill(0);
  ellipse(cx - 20, cy - 90, 6, 6);
  ellipse(cx + 20, cy - 90, 6, 6);

  // Anteojos
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(cx - 20, cy - 90, 25, 20);
  ellipse(cx + 20, cy - 90, 25, 20);
  line(cx - 8, cy - 90, cx + 8, cy - 90); // puente

  // Boca
  noFill();
  stroke(0);
  strokeWeight(2);
  arc(cx, cy - 65, 40, 20, 0, PI);

  // Cuerpo (remera)
  noStroke();
  fill(120, 160, 255); // azul
  rect(cx - 40, cy - 10, 80, 120, 20); // <-- subido

  // Brazos
  fill(235, 180, 145);
  ellipse(cx - 60, cy + 20, 20, 20);
  ellipse(cx + 60, cy + 20, 20, 20);
}
