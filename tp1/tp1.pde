PImage miImagen;


void setup () {
  
  miImagen = loadImage ("Catedral LP.jpg");
    size (800, 400);
    background (135, 194, 230);
    println (mouseX);
    println (mouseY);
    
    }
void draw() {
  image (miImagen,0,0,400,400);
  //Piso
  stroke(0);
    fill (160);
    rect (400, 360, 800, 40);
   
  //Pared  
    fill (168, 96, 54);
    rect (450, 200, 250, 160);
    println (mouseX);
    println (mouseY);
    rect (650, 120, 50, 80);
    rect (450, 120, 50, 80);
    
    //columnas y triangulo gris
    fill (178, 170, 161);
    rect (455, 70, 40, 50);
    rect (655, 70, 40, 50);
    triangle (540,200,610,200,575,150);
    
    //negro
    fill (40, 42, 54);
    triangle (460,70,490,70,475,20);
    triangle (660,70,690,70,675,20);
    rect (465, 80, 20, 40);
    rect (665,80,20,40);
    strokeWeight (4);
    line (475,20,475,0);
    line (675,20,675,0);
    
    //columnas
    strokeWeight (1);
    fill (156, 115, 89);
    rect(445,200, 10,160);
    rect (495,200, 10,160);
    rect (535,200,10,160);
    rect (605,200,10,160);
    rect (645,200,10,160);
    rect (695,200,10,160);
    triangle (535,200,545,200, 540,160);
    triangle (605,200,615,200,610,160);
    strokeWeight (4);
    line (575,150,575,130);
    
    //puertas
    strokeWeight (1);
    fill(120, 85, 62);
    noStroke ();
    rect (550,325, 50,35);
    circle (575,325,50);
    rect (510,325,20,35);
    rect (620,325,20,35);
    circle (630, 325,20);
    circle (520, 325,20);
    
    
    //ventanas

    fill (178, 170, 161);
    rect (540,350, 70,10);
    rect (550,240, 50,50);
    circle (575,240,50);
    rect (620,240, 20,50);
    rect (510,240,20,50);
    triangle (510,240,530,240,520,230);
    triangle (620,240,640,240,630,230);
    rect (460,250, 30,50);
    rect (660,250,30,50);
    triangle (660,250,690,250,675,240);
    triangle (460,250,490,250,475,240);
    rect (460,145,30,50);
    rect (660,145,30,50);
    rect (465,315,20,40);
    rect (665, 315,20,40);
    
    
    
    }


    
   
