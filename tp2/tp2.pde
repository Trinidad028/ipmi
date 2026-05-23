int estado;

//imagenes
PImage miImagen;
PImage fondosinlogo;
PImage P1Cara;
PImage Ciudad;
PImage CiudadConnor;
PImage connor;
PImage ciudadkara;
PImage kara;
PImage ciudadmarkus;
PImage markus;
PFont miFuente;
PFont miFuente2;

//boton empezar
float btnX = 160;
float btnY = 380;
float btnAncho = 200;
float btnAlto = 50;

//imagen logo
float logoAnchoActual;
float logoAltoActual;
float logoAnchoFinal = 400; 
float logoAltoFinal = 200;
float logoXActual;
float logoYActual;
float logoXFinal = 120;    
float logoYFinal = 140;   
float velocidadAnimacion = 0.04; 

//imagen cara
float caraXActual;
float caraXFinal = 80; 
float caraY = 0;    
float caraAncho = 560; 
float caraAlto = 480;  
float velocidadCara = 0.03; 

//formas blancas
float triIzqXActual;
float triIzqXFinal = 150;  
float triDerXActual;
float triDerXFinal = 490;  
float velocidadTriangulos = 0.06; 

//texto
float textoXActual;
float textoXFinal = 20;  
float textoY = 140;       
float textoVelocidad = 0.03; 

//connor
float connorYActual;
float connorYFinal = 80;    
float connorX = 350;        
float connorAncho = 270;   
float connorAlto = 430;     
float velocidadConnor = 0.02; 

//kara
float karaXActual;
float karaXFinal = 370;    
float karaY = 80;          
float karaAncho = 270;      
float karaAlto = 400;       
float velocidadKara = 0.02; 

//markus
float markusYActual;
float markusYFinal = 80;    
float markusX = 350;        
float markusAncho = 270;    
float markusAlto = 430;   
float velocidadmarkus = 0.02;

//tiempo
int tiempoUltimoCambio = 0;
int segundos;

//botón reiniciar 
float btnReX = (640 - 200) / 2; 
float btnReY = 400;             
float btnReAncho = 200;
float btnReAlto = 45;

void setup(){
  size(640, 480);
                                                                                        //loadimages
  miImagen = loadImage("Detroit logo.png");
  fondosinlogo = loadImage("fondo sin logo.png");
  P1Cara = loadImage("detroit cara.png");
  Ciudad = loadImage("Detroit ciudad.jpg");
  CiudadConnor = loadImage("ciudad connor.jpg");
  connor = loadImage("connor.png");
  ciudadkara = loadImage("ciudad kara.jpg");
  kara = loadImage("kara.png");
  markus = loadImage("markus.png");
  ciudadmarkus = loadImage("ciudad markus.jpg");
  miFuente = createFont("Detroit DEMO.ttf", 32);
  miFuente2 = createFont("robot typo.ttf", 32);
 
  estado = 0;  
  println(estado);

  caraXActual = width;
  logoAnchoActual = logoAnchoFinal * 2;
  logoAltoActual = logoAltoFinal * 2;
  logoXActual = 15; 
  logoYActual = (height - logoAltoActual) / 2;
  triIzqXActual = -100; 
  triDerXActual = width + 100; 
  textFont(miFuente);
  textoXActual = -200;
  connorYActual = height;
  karaXActual = width;
  markusYActual = height;
}

void draw(){
  println(mouseX);
  println(mouseY);
                                                                                                                                 //pantalla 1
  if( estado == 0 ){
    background(17, 21, 61);
                                                                                                                                           
    if (mouseX > btnX && mouseX < btnX + btnAncho && mouseY > btnY && mouseY < btnY + btnAlto) {
      fill(100, 180, 250); 
    } else {
      fill(255);
    }
    rect(btnX, btnY, btnAncho, btnAlto, 7); 
    
    fill(0); 
    textSize(18);
    textAlign(CENTER, CENTER);
    text("EMPEZAR", btnX + (btnAncho/2), btnY + (btnAlto/2));
    
    caraXActual = lerp(caraXActual, caraXFinal, velocidadCara);
    image(P1Cara, caraXActual, caraY, caraAncho, caraAlto);

    logoAnchoActual = lerp(logoAnchoActual, logoAnchoFinal, velocidadAnimacion);
    logoAltoActual = lerp(logoAltoActual, logoAltoFinal, velocidadAnimacion);
    logoXActual = (width - logoAnchoActual) / 2;
    logoYActual = (height - logoAltoActual) / 2;
    image(miImagen, logoXActual, logoYActual, logoAnchoActual, logoAltoActual);
                                                                                                            
  } 
                                                                                                                      //pantalla 2
  else if( estado == 1 ){
    background(17, 21, 61);
    image(Ciudad, 0, 0, 640, 480);
    
    triIzqXActual = lerp(triIzqXActual, triIzqXFinal, velocidadTriangulos);
    triDerXActual = lerp(triDerXActual, triDerXFinal, velocidadTriangulos);
     
    fill(245);
    noStroke();
    rect(triIzqXActual - 150, 50, 270, 500);
    triangle(triDerXActual + 400, 0, triDerXActual + 50, 60, triDerXActual, 1140);
    
    textoXActual = lerp(textoXActual, textoXFinal, textoVelocidad);
    textFont(miFuente2);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER); 
    
    text("El año es 2038 en Detroit.", textoXActual, textoY);
    text("La ciudad prospera gracias a", textoXActual, textoY+25);
    text("los androides de la empresa ", textoXActual, textoY+50);
    text(" CyberLife, máquinas de ", textoXActual, textoY+75);
    text("aspecto humano usadas ", textoXActual, textoY+100);
    text("como sirvientes y mano de ", textoXActual, textoY+125);
    text("obra. Todo cambia cuando ", textoXActual, textoY+150);
    text("algunos robots se desvían,", textoXActual, textoY+175);
    text("desarrollando consciencia y ", textoXActual, textoY+200);
    text("emociones.", textoXActual, textoY+225);
                                                                                                     
  } 
                                                                                                              //pantalla 3
  else if( estado == 2 ){
    background(17, 21, 61);
    image(CiudadConnor, 0, 0, 640, 480);
    
    triIzqXActual = lerp(triIzqXActual, triIzqXFinal, velocidadTriangulos);
    triDerXActual = lerp(triDerXActual, triDerXFinal, velocidadTriangulos);
    
    fill(245);
    noStroke();
    rect(triIzqXActual - 150, 50, 270, 500);
    triangle(triDerXActual + 400, 0, triDerXActual + 50, 60, triDerXActual, 1140);

    connorYActual = lerp(connorYActual, connorYFinal, velocidadConnor);
    image(connor, connorX, connorYActual, connorAncho, connorAlto);
    
    
    textoXActual = lerp(textoXActual, textoXFinal, textoVelocidad);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER); 
    
    text("Connor es el modelo RK800,", textoXActual, textoY);
    text("su misión principal es ", textoXActual, textoY+25);
    text("investigar la divergencia y ", textoXActual, textoY+50);
    text("ayudar al Departamento de ", textoXActual, textoY+75);
    text("Policía a detener a los ", textoXActual, textoY+100);
    text("androides que han ", textoXActual, textoY+125);
    text("desarrollado emociones. ", textoXActual, textoY+150);
  
  } 
                                                                                                   //pantalla 4
  else if( estado == 3 ){                     
    background(17, 21, 61);
    image(ciudadkara, 0, 0, 640, 480); 
   
    triIzqXActual = lerp(triIzqXActual, triIzqXFinal, velocidadTriangulos);
    triDerXActual = lerp(triDerXActual, triDerXFinal, velocidadTriangulos);
    
    fill(245);
    noStroke();
    rect(triIzqXActual - 150, 50, 270, 500);
    triangle(triDerXActual + 400, 0, triDerXActual + 50, 60, triDerXActual, 1140);
    
    karaXActual = lerp(karaXActual, karaXFinal, velocidadKara);
    image(kara, karaXActual, karaY, karaAncho, karaAlto);
    
    textoXActual = lerp(textoXActual, textoXFinal, textoVelocidad);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER); 
    
    text("Es un modelo doméstico ", textoXActual, textoY);
    text("AX400 diseñado para las", textoXActual, textoY+25);
    text("labores del hogar y el ", textoXActual, textoY+50);
    text("cuidado de niños. Su  ", textoXActual, textoY+75);
    text("emocionante historia se  ", textoXActual, textoY+100);
    text("centra en el despertar de   ", textoXActual, textoY+125);
    text("su consciencia, el instinto   ", textoXActual, textoY+150);
    text(" maternal y su desesperada   ", textoXActual, textoY+175);
    text(" huida para salvar a la   ", textoXActual, textoY+200);
    text("pequeña Alice.  ", textoXActual, textoY+225);

  }
                                                                                                     //pantalla 5
  else if( estado == 4 ){
    background(17, 21, 61);
    image(ciudadmarkus, 0, 0, 640, 480);
    
    triIzqXActual = lerp(triIzqXActual, triIzqXFinal, velocidadTriangulos);
    triDerXActual = lerp(triDerXActual, triDerXFinal, velocidadTriangulos);
    
    fill(245);
    noStroke();
    rect(triIzqXActual - 150, 50, 270, 500); 
    triangle(triDerXActual + 400, 0, triDerXActual + 50, 60, triDerXActual, 1140);
    
    markusYActual = lerp(markusYActual, markusYFinal, velocidadmarkus);
    image(markus, markusX, markusYActual, markusAncho, markusAlto);
    
    textoXActual = lerp(textoXActual, textoXFinal, textoVelocidad);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER); 
    
    text("Markus es un androide ", textoXActual, textoY);
    text("modelo RK200. Diseñado  ", textoXActual, textoY+25);
    text("originalmente para el  ", textoXActual, textoY+50);
    text("cuidado personal y el arte,   ", textoXActual, textoY+75);
    text(" despierta y se convierte en  ", textoXActual, textoY+100);
    text("el líder de la revolución de ", textoXActual, textoY+125);
    text("los androides ", textoXActual, textoY+150);
    
   //botón reiniciar
    if (mouseX > btnReX && mouseX < btnReX + btnReAncho && mouseY > btnReY && mouseY < btnReY + btnReAlto) {
      fill(250, 100, 100); 
    } else {
      fill(83, 83, 128);
    }
    rect(btnReX, btnReY, btnReAncho, btnReAlto, 7);
    
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("REINICIAR", btnReX + (btnReAncho/2), btnReY + (btnReAlto/2));
  }

  //temporizador
  if (estado > 0 && estado < 4) {
    segundos = (millis() - tiempoUltimoCambio) / 1000;
    println("segundos: " + segundos);
    
    if (millis() - tiempoUltimoCambio >= 10000) { 
      estado++;
      tiempoUltimoCambio = millis(); 
      
      // Reseteo de transiciones 
      logoAnchoActual = logoAnchoFinal * 2;
      logoAltoActual = logoAltoFinal * 2;
      caraXActual = width;
      triIzqXActual = -100;
      triDerXActual = width + 100;
      textoXActual = -400;
      connorYActual = height;
      karaXActual = width;
      markusYActual = height;
    }
  }
} 


void mousePressed() { 
  // Boton empezar 
  if (estado == 0) {
    if (mouseX > btnX && mouseX < btnX + btnAncho && mouseY > btnY && mouseY < btnY + btnAlto) {
      estado = 1;
      tiempoUltimoCambio = millis(); 
      
      triIzqXActual = -100;
      triDerXActual = width + 100;
      textoXActual = -400;
    }
  }
  
  // Botón reiniciar
  if (estado == 4) {
    if (mouseX > btnReX && mouseX < btnReX + btnReAncho && mouseY > btnReY && mouseY < btnReY + btnReAlto) {
      estado = 0; // 
      tiempoUltimoCambio = millis(); 
      
     //reseteo de las imagenes
      caraXActual = width;
      logoAnchoActual = logoAnchoFinal * 2;
      logoAltoActual = logoAltoFinal * 2;
      logoXActual = 15; 
      logoYActual = (height - logoAltoActual) / 2;
      triIzqXActual = -100;
      triDerXActual = width + 100;
      textoXActual = -400;
      connorYActual = height;
      karaXActual = width;
      markusYActual = height;
    }
  }
}
