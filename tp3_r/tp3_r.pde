https://youtu.be/8ZIEijZBeqk

PImage miImagen; 
int cant = 40; 
boolean invertirColores = false; 

//arranca en 280 grados
float gradosActuales = 280; 

void setup() {
  size(800, 400); 
  rectMode(CENTER);
  
  colorMode(HSB, 360, 100, 100);  
  miImagen = loadImage("Imagen 35.jpg"); 
}





//DIBUJO PRINCIPAL


// Funcion 1: espiral con los parámetros indicados (no retorna valor)
void dibujarEspiral(float centroX, float centroY, int cantidad, float rotacionMaxima) {
  noStroke(); 

  // Bucle
  for (int i = cantidad - 1; i >= 0; i--) {
    pushMatrix();
    translate(centroX, centroY); 

    float aux = map(i, 0, cantidad, 0, rotacionMaxima);
    rotate(radians(aux));

    // Control de color 
    if (i % 2 == 0) {
      if (invertirColores) {
        fill(0, 0, 100); // Blanco
      } else {
        fill(0, 0, 0);   // Negro
      }
    } else {
      if (invertirColores) {
        fill(0, 0, 0);   //  N
      } else {
        fill(0, 0, 100); //  B
      }
    }

    // Funcion 2: Calcula el tamaño con la curva exponencial
    float tam = calcularTamañoExponencial(i, cantidad); 
    rect(0, 0, tam, tam);

    popMatrix();
  }
}


// Imagen y clip


void draw() {
  background(0, 0, 20); 

  // Imagen 
  if (miImagen != null) {
     image(miImagen, 0, -50, 400, 525);  
  }

  // zona de dibujo 
  clip(400, 0, 400, height); 

  
  dibujarEspiral(600, 200, cant, gradosActuales);

  
  noClip(); 
}



// Interaciones (r, a, s, clic y arrastre)


// Click
void mouseClicked() {
  if (mouseX > 400) {
    invertirColores = !invertirColores; 
  }
}

// Arrastre
void mouseDragged() {
  if (mouseX > 400) {
    gradosActuales = map(mouseX, 400, 800, 0, 360); 
  }
}

// r
void keyPressed() {
  // 1. Reseteo general con la tecla 'r'
  if (key == 'r' || key == 'R') {
    gradosActuales = 280;     
    invertirColores = false;  
    cant = 40; 
  }
  
  // a
  if ((key == 'a' || key == 'A') && cant > 2) {
    cant--;
  }
  
  // s
  if ((key == 's' || key == 'S') && cant < 100) {
    cant++;
  }
}



// Funcion 2 (retorna valor)


// FUNCIÓN 2: Calcula el tamaño aplicando una curva de profundidad 
float calcularTamañoExponencial(int indiceActual, int total) {
  float maxTamaño = 450.0;
  
  float proporcionLineal = float(indiceActual) / total; 
  float proporcionExponencial = proporcionLineal * proporcionLineal; 
  
  float tamañoFinal = maxTamaño * proporcionExponencial;
  
  return tamañoFinal; 
}
