//////////////////////////////////
// Tenseg_Double
//////////////////////////////////
// copyright: John Simons 2016


class Tenseg_Double {
    public int MAX_TD_N = 336; // 6 buizen * 60 leds / buis
    
    Tenseg_Double() {
      boids = new Boid[MAX_TD_N];
        
      float xx1 =   8;
      float xy1 =  20;
      float xx2 =   8;
      float xy2 = 191;
      float xx3 =  28;
      float xy3 = 147;
      float xx4 = 244;
      float xy4 = 163;
      float xx5 = 228;
      float xy5 =  62;
      float xx6 = 255;
      float xy6 = 106;
      
      for (int i=0; i<MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx1, xy1, 0, color(220, 100, 0));
          xx1 += 4.38;
          xy1 += 3.12;
      }
      
      for (int i=MAX_N/6; i<2*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx2, xy2, 0, color(220, 0, 0));
          xx2 += 3.6;
          xy2 -= 1.75;
      }
      
       for (int i=2*MAX_N/6; i<3*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx3, xy3, 0, color(100, 220, 0));
          xx3 += 3.95;
          xy3 -= 2.32;
      }
      
       for (int i=3*MAX_N/6; i<4*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx4, xy4, 0, color(0, 100, 220));
          xx4 += 4.43;
          xy4 -= 2.61;
      }
      
      for (int i=4*MAX_N/6; i<5*MAX_N/6; i++) {
          boids[i] = new Boid(RADIUS, xx5, xy5, 0, color(0, 0, 220));
          xx5 += 4.6;
          xy5 += 1.92;
      }
      
      for (int i=5*MAX_N/6; i<MAX_N; i++) {
          boids[i] = new Boid(RADIUS, xx6, xy6, 0, color(0, 220, 100));
          xx6 += 4.55;
          xy6 -= 0.52;
      }
       
      for (int b=0; b<N; b++) {
            boids[b].update();
      }
    }
     
    void update(int[] leds ) {
        
    }
}