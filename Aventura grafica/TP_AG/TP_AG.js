let estado = 0;
let fondos = [];
let personajes = [];

let musicaFondo;
let musicaCargada = false;

let dialogos = [
  "", 
  "Me desperté con un dolor de cabeza terrible... ¿Dónde estoy?",
  "Revisando la habitación, noto que la puerta está cerrada con llave.",
  "Hay una nota sobre la mesa de luz. Dice: 'El tiempo se agota'.",
  "Tengo que encontrar la forma de salir de aquí antes de que sea tarde."
];

let btnIniciarX, btnIniciarY, btnAncho = 220, btnAlto = 50;
let btnCreditosX, btnCreditosY;
let btnVolverX, btnVolverY, btnVolverAncho = 120, btnVolverAlto = 40;

function preload() {
  fondos[1] = loadImage("Habitacion-Hotel.jpg");
  fondos[2] = loadImage("Pasillo-Hotel-1.jpg"); 
  fondos[3] = loadImage("Pasillo-Hotel-2.jpg");
  fondos[4] = loadImage("Recepcion-Hotel.jpg");

  personajes[1] = loadImage("PJ-Normal.png"); 
  personajes[2] = loadImage("PJ-Dudoso.png");
  personajes[3] = loadImage("PJ-Sorprendido.png");
  personajes[4] = loadImage("PJ-Dudoso.png");

  musicaFondo = loadSound("Twisting.mp3", 
    function() {
      console.log("¡Música cargada con éxito!");
      musicaCargada = true;
    }, 
    function(err) {
      console.log("No se pudo cargar el archivo de audio. Verifica el nombre o formato.", err);
    }
  );
}

function setup() {
  createCanvas(800, 450);
  
  btnIniciarX = width / 2 - btnAncho / 2;
  btnIniciarY = height / 2 - 20;
  
  btnCreditosX = width / 2 - btnAncho / 2;
  btnCreditosY = height / 2 + 45;
  
  btnVolverX = 40;
  btnVolverY = 380;
}

function draw() {
  background(0);

  if (estado === 0) {
    dibujarMenuPrincipal();
  } 
  else if (estado === -1) {
    dibujarCreditos();
  } 
  else {
    if (fondos[estado]) {
      image(fondos[estado], 0, 0, width, height);
    }
    if (personajes[estado]) {
      image(personajes[estado], 100, 150, 200, 300);
    }
    if (dialogos[estado]) {
      dibujarCajaDeTexto(dialogos[estado]);
    }
  }
}

function dibujarMenuPrincipal() {
  background(17, 21, 61);
  fill(255);
  textSize(36);
  textAlign(CENTER, CENTER);
  text("Titulo", width / 2, height / 3 - 20);

  if (mouseX > btnIniciarX && mouseX < btnIniciarX + btnAncho && mouseY > btnIniciarY && mouseY < btnIniciarY + btnAlto) {
    fill(100, 180, 250);
  } else {
    fill(255);
  }
  rect(btnIniciarX, btnIniciarY, btnAncho, btnAlto, 8);
  
  fill(0);
  textSize(18);
  text("INICIAR", width / 2, btnIniciarY + btnAlto / 2);

  if (mouseX > btnCreditosX && mouseX < btnCreditosX + btnAncho && mouseY > btnCreditosY && mouseY < btnCreditosY + btnAlto) {
    fill(100, 180, 250);
  } else {
    fill(200);
  }
  rect(btnCreditosX, btnCreditosY, btnAncho, btnAlto, 8);
  
  fill(0);
  text("CRÉDITOS", width / 2, btnCreditosY + btnAlto / 2);
}

function dibujarCreditos() {
  background(17, 21, 61);
  fill(255);
  textSize(28);
  textAlign(CENTER, CENTER);
  text("CRÉDITOS", width / 2, 100);
  
  textSize(16);
  text("Animacion.", width / 2, 200);

  if (mouseX > btnVolverX && mouseX < btnVolverX + btnVolverAncho && mouseY > btnVolverY && mouseY < btnVolverY + btnVolverAlto) {
    fill(180, 100, 100);
  } else {
    fill(120);
  }
  rect(btnVolverX, btnVolverY, btnVolverAncho, btnVolverAlto, 5);
  
  fill(255);
  textSize(14);
  text("VOLVER", btnVolverX + btnVolverAncho / 2, btnVolverY + btnVolverAlto / 2);
}

function dibujarCajaDeTexto(textoActual) {
  push();
  fill(0, 0, 0, 200);
  stroke(255);
  strokeWeight(2);
  rect(50, 320, 700, 100, 10);

  noStroke();
  fill(255);
  textSize(16);
  textAlign(LEFT, TOP);
  text(textoActual, 75, 345, 650, 60);

  // Actualizamos la instrucción visual para el usuario
  textSize(11);
  fill(180);
  textAlign(RIGHT, BOTTOM);
  text("Haz clic izquierdo para continuar ➔", 735, 410);
  pop();
}

function mousePressed() {
  // 1. Menú Principal (estado 0)
  if (estado === 0) {
    if (mouseX > btnIniciarX && mouseX < btnIniciarX + btnAncho && mouseY > btnIniciarY && mouseY < btnIniciarY + btnAlto) {
      estado = 1; 
      
      if (musicaCargada && !musicaFondo.isPlaying()) {
        musicaFondo.setVolume(0.5);
        musicaFondo.loop();
      }
    }
    else if (mouseX > btnCreditosX && mouseX < btnCreditosX + btnAncho && mouseY > btnCreditosY && mouseY < btnCreditosY + btnAlto) {
      estado = -1; 
    }
  }
  
  // 2. Pantalla de Créditos (estado -1)
  else if (estado === -1) {
    if (mouseX > btnVolverX && mouseX < btnVolverX + btnVolverAncho && mouseY > btnVolverY && mouseY < btnVolverY + btnVolverAlto) {
      estado = 0; 
    }
  }
  
  // 3. Historia (estado 1 en adelante) - Ahora avanza con CLIC IZQUIERDO en cualquier parte
  else if (estado > 0) {
    estado++;
    if (estado >= dialogos.length) {
      estado = 0; // Vuelve al menú principal al terminar los diálogos
    }
  }
  
  return false; 
}
