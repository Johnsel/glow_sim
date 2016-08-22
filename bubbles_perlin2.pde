
//////////////////////////////////
// Perlin Bubbles
//////////////////////////////////
// copyright: Daniel Erickson 2012
import controlP5.*;
 import java.util.Arrays;

int CONTROL_WIDTH = 100;
int CONTROL_HEIGHT = 10;
int CONTROL_SPACING = 2;
ControlP5 controls;
 
int WIDTH = 1024;
int HEIGHT = 800;
public int MAX_N = 336;
public int N =336;
public float RADIUS = HEIGHT/40;
public float ZOOM_SPEED = 2;
PImage img;

Boid[] boids;

Tenseg_Double[] tenseg_doubles;

ArtNetListener artNetListener;
byte[] inputDmxArray;

void setup() { 
    size(1024, 800, P2D);
    smooth();
    noStroke();
    
    frameRate(1);
    smooth(4);
     
    int y = CONTROL_SPACING;
    controls = new ControlP5(this);
    controls.addSlider("MIN_BLUR_LEVELS", 0, 5, MIN_BLUR_LEVELS, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("BLUR_LEVEL_COUNT", 0, 10, BLUR_LEVEL_COUNT, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("BLUR_AMOUNT", 0.0, 200.0, BLUR_AMOUNT, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("ZOOM", 1.0, 4.0, ZOOM, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("ZOOM_SPEED", 1.0, 10.0, ZOOM_SPEED, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("FOCAL_LENGTH", 0.0, 1.0, FOCAL_LENGTH, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("RADIUS", 1, HEIGHT/40, RADIUS, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("TIME_SCALE", 0.0, 10.0, TIME_SCALE, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("NOISE_SCALE", 0.0, 20.0, NOISE_SCALE, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("SPEED", 0.0, 15.0, SPEED, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("N", 0.0, MAX_N, N, WIDTH-250, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    
    tenseg_doubles = new Tenseg_Double[1]; 
    
    for (int i=0; i<1; i++) {
        tenseg_doubles[i] = new Tenseg_Double();
    }
    
    img = loadImage("single_module.png");
    
    artNetListener = new ArtNetListener();
}
 
boolean zoomIn = false;
boolean zoomOut = false;
 
float xoffs = 0;
float yoffs = 0;
void draw() {
    background(BACKGROUND);
    
    image(img, 0, 0);
    xoffs = 0;//xoffs*0.9 + 0.1*((float)mouseX/(float)WIDTH);
    yoffs = 0;///yoffs*0.9 + 0.1*((float)mouseY/(float)HEIGHT);
     
    inputDmxArray = artNetListener.getCurrentInputDmxArray(); 
     
    for (int i=0; i<N; i++) {
        Boid current = (Boid)boids[i];
        
        if (i<56){
        
          int r = artNetListener.toInt(inputDmxArray[i*3+0]);
          int g = artNetListener.toInt(inputDmxArray[i*3+1]);
          int b = artNetListener.toInt(inputDmxArray[i*3+2]);
                  
        current.bubble_color = color(r,g,b);
        
        }
        
        if (zoomIn) current.zoomIn(ZOOM_SPEED*0.003);
        if (zoomOut) current.zoomOut(ZOOM_SPEED*0.003);
        current.update(millis());
    }
     
    Arrays.sort(boids, 0, N);
     
    for (int i=0; i<N; i++) {
        ((Boid)boids[i]).draw(xoffs, yoffs);
    }
}   

void exit() {
  println( "Exiting ...");
  artNetListener.stopArtNet();
  super.exit();
}