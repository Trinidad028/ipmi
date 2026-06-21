//https://youtu.be/CMhQ_cjenow

PImage miImagen; 
int cant = 20; 
float cambioColor = 0; 

void setup() {
  size(800, 400); 
  rectMode(CENTER);
  ellipseMode(RADIUS); 
  
  colorMode(HSB, 360, 100, 100);  
  
  
  miImagen = loadImage("Imagen 35.jpg"); 
  
}

void draw() {
   
  // movimiento de mouse cuadrados y color
  float gradosCuadradosX = map(mouseX, 400, 800, 0, 360); 
  float cambioColorY = map(mouseY, 0, height, 0, 360); 

 

  // fondo multicolor
  for (int r = 550; r > 0; r -= 2) {
    float m = map(r, 0, 550, 0, 360) + cambioColor + cambioColorY;
    fill(m % 360, 100, 100);
    noStroke();
    ellipse(600, 200, r, r); // Centro en la derecha
  }

  //cuadrados
  noFill();             
  stroke(0, 0, 0);      

  // movimiento cuadrados
  for (int i = 0; i < cant; i++) {
    pushMatrix();
    translate(600, 200); 

//rotacion de cuadrados
    float aux = map(i, 0, cant, 0, gradosCuadradosX );
    rotate(radians(aux));

//cambio de grosor
    float grosor = map(i, 0, cant, 1, 7); 
    strokeWeight(grosor); 

//tamaño de cuadrados
    float tam = 450 * (float(i) / cant); 
    rect(0, 0, tam, tam);

    popMatrix();
    
    // imagen
     image (miImagen, 0, -50, 400, 525); 
  }
}


// click cambia color
void mouseClicked() {
  if (mouseX > 400) {
    cambioColor = random(0, 360);
  }
}
