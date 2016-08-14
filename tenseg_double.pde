//////////////////////////////////
// Tenseg_Double
//////////////////////////////////
// copyright: John Simons 2016


class Tenseg_Double {
    public int MAX_TD_N = 336; // 6 buizen * 60 leds / buis
    
    Tenseg_Double() {
      boids = new Boid[MAX_TD_N];
        
      float xx =  8;
      float xy = 20;
          
      for (int i=0; i<MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx, xy, 0, color(20, random(150.0, 240.0), random(150.0, 240.0)));
          xx += 4.38;
          xy += 3.12;
      }
      
      for (int i=MAX_N/6; i<2*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, random(WIDTH), 1/6f*HEIGHT, 0, color(random(150.0, 240.0), 20, random(150.0, 240.0)));
      }
      
       for (int i=2*MAX_N/6; i<3*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, random(WIDTH), 2/6*HEIGHT, 1, color(random(150.0, 240.0), 20, random(150.0, 240.0)));
      }
      
       for (int i=3*MAX_N/6; i<4*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, random(WIDTH), 1/2*HEIGHT, 1, color(random(150.0, 240.0), 20, random(150.0, 240.0)));
      }
      
      for (int i=4*MAX_N/6; i<5*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, random(WIDTH), 4/6*HEIGHT, 1, color(random(150.0, 240.0), 20, random(150.0, 240.0)));
      }
      
      for (int i=5*MAX_N/6; i<MAX_N; i++) {
          boids[i] = new Boid(RADIUS, random(WIDTH), 5/6*HEIGHT, 1, color(random(150.0, 240.0), random(150.0, 240.0), 20));
      }
       
      for (int b=0; b<N; b++) {
            boids[b].update();
      }
    }
     
    void update(int[] leds ) {
        
    }
}