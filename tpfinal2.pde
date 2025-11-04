// ===============================
//  EL PORTAL DEL TIEMPO - PARTE 2
//  Autor: Mica Aguilar
// ===============================

import processing.sound.*;

// Imágenes
PImage biblioteca, reloj, puerta, pasadizo, finalBueno, finalMalo;

// Sonidos
SoundFile sonidoVictoria;
SoundFile sonidoDerrota;

// Estado del juego
int escena = 0;
boolean gano = false;

void setup() {
  size(800, 600);
  
  // Cargar imágenes (todas deben estar en la carpeta "data")
  biblioteca = loadImage("biblioteca.jpg");
  reloj = loadImage("reloj.jpg");
  puerta = loadImage("puerta.jpg");
  pasadizo = loadImage("pasadizo.jpg");
  finalBueno = loadImage("final_bueno.jpg");
  finalMalo = loadImage("final_malo.jpg");
  
  // Cargar sonidos
  sonidoVictoria = new SoundFile(this, "victoria.mp3");
  sonidoDerrota = new SoundFile(this, "derrota.mp3");
  
  textAlign(CENTER);
  textSize(22);
}

void draw() {
  background(0);
  
  switch (escena) {
    case 0:
      image(biblioteca, 0, 0, width, height);
      fill(255);
      text("Despertás en una vieja biblioteca. Hay un reloj, una puerta y un pasadizo.", width/2, 50);
      mostrarBoton("Mirar el reloj", 200, 500);
      mostrarBoton("Abrir la puerta", 400, 500);
      mostrarBoton("Entrar al pasadizo", 600, 500);
      break;
      
    case 1:
      image(reloj, 0, 0, width, height);
      fill(255);
      text("El reloj empieza a brillar... se abre un portal luminoso.", width/2, 50);
      mostrarBoton("Entrar al portal", 300, 500);
      mostrarBoton("Volver atrás", 500, 500);
      break;
      
    case 2:
      image(puerta, 0, 0, width, height);
      fill(255);
      text("Entrás al jardín oscuro. Las estatuas parecen observarte...", width/2, 50);
      mostrarBoton("Tocar una estatua", 300, 500);
      mostrarBoton("Escapar por el jardín", 500, 500);
      break;
      
    case 3:
      image(pasadizo, 0, 0, width, height);
      fill(255);
      text("El pasadizo te lleva a una sala con un espejo gigante.", width/2, 50);
      mostrarBoton("Tocar el espejo", 300, 500);
      mostrarBoton("Regresar", 500, 500);
      break;
      
    case 4: // Final bueno
      image(finalBueno, 0, 0, width, height);
      fill(255);
      text("¡Escapaste del ciclo del tiempo! Has ganado.", width/2, height - 40);
      if (!gano) {
        sonidoVictoria.play();
        gano = true;
      }
      mostrarBoton("Reiniciar", width/2, height - 80);
      break;
      
    case 5: // Final malo
      image(finalMalo, 0, 0, width, height);
      fill(255);
      text("El tiempo te atrapó para siempre...", width/2, height - 40);
      if (!gano) {
        sonidoDerrota.play();
        gano = true;
      }
      mostrarBoton("Reiniciar", width/2, height - 80);
      break;
  }
}

void mostrarBoton(String texto, float x, float y) {
  fill(0, 150);
  rectMode(CENTER);
  rect(x, y, 200, 40, 10);
  fill(255);
  text(texto, x, y + 8);
}

void mousePressed() {
  // Detectar clics en botones
  if (escena == 0) {
    if (botonPresionado(200, 500)) escena = 1;
    else if (botonPresionado(400, 500)) escena = 2;
    else if (botonPresionado(600, 500)) escena = 3;
  } 
  else if (escena == 1) {
    if (botonPresionado(300, 500)) escena = 4; // final bueno
    else if (botonPresionado(500, 500)) escena = 0;
  } 
  else if (escena == 2) {
    if (botonPresionado(300, 500)) { escena = 5; gano = false; } // final malo
    else if (botonPresionado(500, 500)) escena = 1;
  } 
  else if (escena == 3) {
    if (botonPresionado(300, 500)) escena = 4; // final bueno
    else if (botonPresionado(500, 500)) escena = 0;
  } 
  else if (escena == 4 || escena == 5) {
    if (botonPresionado(width/2, height - 80)) {
      escena = 0;
      gano = false;
    }
  }
}

boolean botonPresionado(float x, float y) {
  return (mouseX > x - 100 && mouseX < x + 100 && mouseY > y - 20 && mouseY < y + 20);
}
