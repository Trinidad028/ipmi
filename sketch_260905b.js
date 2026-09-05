// ARREGLOS DE FRAMES
let framesQuieto = [];
let framesCaminando = [];

// MÁQUINA DE ESTADOS
const ESTADO_CAMINANDO = 0;
const ESTADO_QUIETO = 1;
let estadoActual = ESTADO_CAMINANDO;

// Control de tiempo y contadores
let tiempoInicioEstado = 0;
const DURACION_CAMINATA = 5000; // 5000 milisegundos (5 segundos)

// Control de fotograma
let frameQuietoActual = 0;
let frameCaminandoActual = 0;

// Posiciones y Movimiento
let xFondoLejano = 0;
let xSuelo = 0;
let posMapacheX = 50;  // Posición X inicial del mapache
let posMapacheY = 280; // Posición Y sobre el suelo
let velocidadMapache = 0.5;

// Fondos
let imgFondoLejano;
let imgSuelo;

function preload() {
  // Carga de caminata: Mapache-1.png a Mapache-5.png
  cargarSpritesMapache("Mapache-", 1, 5, framesCaminando);



  // Carga de imágenes de fondo
  imgFondoLejano = loadImage("Casas.png");
  imgSuelo = loadImage("Suelo.png");
}

function setup() {
  createCanvas(800, 600);
  tiempoInicioEstado = millis(); // Guarda el tiempo de inicio
}

function draw() {
  background(200);

  switch (estadoActual) {
    case 0: // ESTADO: CAMINANDO
      // Movimiento de fondos (Parallax)
      xFondoLejano -= 1;
      xSuelo -= 2;

      // Movimiento del mapache de izquierda a derecha
      posMapacheX += velocidadMapache;
      
      if (posMapacheX > width) {
        posMapacheX = -200;
      }

      dibujarFondoParallax(imgFondoLejano, xFondoLejano, 0);
      dibujarFondoParallax(imgSuelo, xSuelo, 00);

      // Avanza el fotograma de la animación
      frameCaminandoActual = obtenerSiguienteFrame(frameCaminandoActual, framesCaminando.length, 6);
      
      // Dibuja la secuencia de imágenes de caminata
      if (framesCaminando.length > 0) {
        image(framesCaminando[frameCaminandoActual], posMapacheX, posMapacheY, 200, 200);
      }

      // EVENTO
      if (eventoCambiaEstado()) {
        cambiarEstado(1); // Pasa al estado QUIETO (case 1)
      }
      break;

    case 1: // ESTADO: QUIETO
      // Los fondos quedan congelados en su última posición
      dibujarFondoParallax(imgFondoLejano, xFondoLejano, 0);
      dibujarFondoParallax(imgSuelo, xSuelo, 200);

      // Alterna entre los fotogramas del arreglo framesQuieto (MapacheGirado-6 y 7)
      frameQuietoActual = obtenerSiguienteFrame(frameQuietoActual, framesQuieto.length, 12);
      
      // Dibuja la secuencia de imágenes del estado quieto
      if (framesQuieto.length > 0) {
        image(framesQuieto[frameQuietoActual], posMapacheX, posMapacheY, 200, 200);
      }
      break;
  }
}


// FUNCIONES DE CONTROL DE ESTADO


function eventoCambiaEstado() {
  return (millis() - tiempoInicioEstado >= DURACION_CAMINATA);
}

function cambiarEstado(nuevoEstado) {
  estadoActual = nuevoEstado;
  tiempoInicioEstado = millis(); // Resetea el tiempo para el nuevo estado
  frameQuietoActual = 0;          // Asegura comenzar desde la primera imagen quieto
  frameCaminandoActual = 0;
}

function reset() {
  posMapacheX = 50;
  xFondoLejano = 0;
  xSuelo = 0;
  cambiarEstado(0);
}


// FUNCIONES PROPIAS


function cargarSpritesMapache(prefijo, inicio, fin, arregloDestino) {
  for (let i = inicio; i <= fin; i++) {
    arregloDestino.push(loadImage(prefijo + i + ".png"));
  }
}

function dibujarFondoParallax(imagen, posXMovil, posY) {
  let xRelativa = (posXMovil % width);
  if (xRelativa > 0) {
    xRelativa -= width;
  }
  image(imagen, xRelativa, posY, width, height - posY);
  image(imagen, xRelativa + width, posY, width, height - posY);
}

function obtenerSiguienteFrame(frameActual, totalFrames, intervaloFrames) {
  if (totalFrames === 0) return 0;
  if (frameCount % intervaloFrames === 0) {
    return (frameActual + 1) % totalFrames;
  }
  return frameActual;
}
