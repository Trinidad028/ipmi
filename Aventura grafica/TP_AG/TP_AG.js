let estado = 0;

// Arreglos para almacenar las imágenes de cada escena
let fondos = [];
let personajes = [];

// Textos de los diálogos para cada estado
let dialogos = [
  "Me desperté con un dolor de cabeza terrible... ¿Dónde estoy?",
  "Revisando la habitación, noto que la puerta está cerrada con llave.",
  "Hay una nota sobre la mesa de luz. Dice: 'El tiempo se agota'.",
  "Tengo que encontrar la forma de salir de aquí antes de que sea tarde."
];

function preload() {
  // Carga las imágenes de forma ordenada en los arreglos.
  // Asegúrate de tener estas imágenes en tu proyecto con estos nombres (o cámbialos por los tuyos):
  fondos[0] = loadImage("Habitacion-Hotel.jpg");
  fondos[1] = loadImage("Pasillo-Hotel-1.jpg"); // Puedes cambiar de fondo por escena
  fondos[2] = loadImage("Pasillo-Hotel-2.jpg");
  fondos[3] = loadImage("Recepcion-Hotel.jpg");

  // Personajes para cada escena (ej: silueta, detective, etc.)
  personajes[0] = loadImage("PJ-Normal.png"); 
  personajes[1] = loadImage("PJ-Dudoso.png");
  personajes[2] = loadImage("PJ-Sorprendido.png");
  personajes[3] = loadImage("PJ-Dudoso.png");
}

function setup() {
  createCanvas(800, 450);
  console.log("Estado inicial: " + estado);
}

function draw() {
  background(0);

  // 1. Dibujar el fondo de la escena actual
  if (fondos[estado]) {
    image(fondos[estado], 0, 0, width, height);
  }

  // 2. Dibujar el personaje de la escena actual (si existe)
  if (personajes[estado]) {
    // Puedes ajustar las coordenadas (X, Y) y tamaño del personaje aquí
    image(personajes[estado], 100, 150, 200, 300);
  }

  // 3. Dibujar el globo de texto / caja de diálogo en la parte inferior
  dibujarCajaDeTexto(dialogos[estado]);
}

// Función para diseñar el globo de texto clásico de aventura gráfica
function dibujarCajaDeTexto(textoActual) {
  push();
  // Rectángulo del globo (estilo semi-transparente oscuro con borde blanco)
  fill(0, 0, 0, 200);
  stroke(255);
  strokeWeight(2);
  rect(50, 320, 700, 100, 10);

  // Texto del diálogo
  noStroke();
  fill(255);
  textSize(16);
  textAlign(LEFT, TOP);
  // text(texto, x, y, anchoMaximo, altoMaximo) para que el texto haga salto de línea automático
  text(textoActual, 75, 345, 650, 60);

  // Pequeña instrucción visual para el usuario
  textSize(11);
  fill(180);
  textAlign(RIGHT, BOTTOM);
  text("Haz clic derecho para continuar ➔", 735, 410);
  pop();
}

// Evento que detecta el clic del mouse
function mousePressed() {
  // mouseButton === RIGHT detecta el clic derecho
  if (mouseButton === RIGHT) {
    estado++;
    
    // Si llegamos al último estado, podemos reiniciar o frenar en el último
    if (estado >= fondos.length) {
      estado = 0; // Vuelve al inicio (o puedes manejar un estado de final del juego)
    }
    
    console.log("Avanzó al estado: " + estado);
  }
  
  // Esto previene que se abra el menú contextual predeterminado del navegador al hacer clic derecho
  return false; 
}
