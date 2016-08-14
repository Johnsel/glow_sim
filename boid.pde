//////////////////////////////////
// Perlin Bubble Boid
//////////////////////////////////
// copyright: Daniel Erickson 2012
public int NOISE_LEVELS = 2;
public float NOISE_SCALE = 8.0;
public float TIME_SCALE = 3.0;
public float SPEED = 5;
 
class Boid extends ZObject {
    PVector vel;
    Boid(float iradius, float x, float y, float z, color icolor) {
        super(x, y, z, iradius, icolor);
        float vz = random(0.001);
        vel = new PVector(0.001, vz, vz);
    }
     
    void update(float t) {
        // float ft = TIME_SCALE * t * 0.00001;
         
        // vel.x = 0;//SPEED * 0.000000001 * cos(2*PI*(noise(pos.x*NOISE_SCALE+ft+0, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
        // vel.y = 0;//SPEED * 0.00001 * -sin(2*PI*(noise(pos.x*NOISE_SCALE+ft+1, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
        // vel.z = 0;//SPEED * 0.00001 * sin(2*PI*(noise(pos.x*NOISE_SCALE+ft+2, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
         
        //bubble_color = color(random(150.0, 240.0), 20, random(150.0, 240.0));
         
        // pos.add(vel);
        super.update();
    }
}