//////////////////////////////////
// ZObject
//////////////////////////////////
// copyright: Daniel Erickson 2012
public float ZOOM = 4.0;
public int MIN_BLUR_LEVELS = 1;
public int BLUR_LEVEL_COUNT = 1;
public float BLUR_AMOUNT = 5.0;
public float VISIBILITY_RANGE = 0.95;
public float FOCAL_LENGTH = 0.9;
public color BACKGROUND = color(0, 0, 0);
 
class ZObject implements Comparable {
    float radius;
    PVector pos;
    color bubble_color;
    color shaded_color;
    float zoffs = 0.0;
    float z = 0.0;
    
    ZObject(float ix, float iy, float iz, float iradius, color icolor) {
        pos = new PVector(ix, iy, iz);
        bubble_color = icolor;
        radius = iradius;
        setColor();
    }
     
    void setColor() {
        float shade = z;
        float shadeinv = 1.0-shade;
        shaded_color = color( (red(bubble_color)),
                        (green(bubble_color)),
                        (blue(bubble_color)));
    }
     
    void updateZ() {
        z = pos.z + zoffs;
        while (z < 0.0) z += 1.0;
        while (z > 1.0) z -= 1.0;
    }
     
    void zoomIn(float amount) {
        zoffs += amount;
        updateZ();
    }
     
    void zoomOut(float amount) {
        zoffs -= amount;
        updateZ();
    }
  
    void update() {
       
         
        updateZ();
        setColor();
    }
     
    void draw(float xoffs, float yoffs) {
        float dz = (z*z)*ZOOM;
        xoffs = 1;
        yoffs = 1 ;
        float posX = pos.x;
        float posY = pos.y;
        float zradius = z*RADIUS;
        float a = 1.0;
        if (z > VISIBILITY_RANGE) {
            a = (VISIBILITY_RANGE-z)/(1.0-VISIBILITY_RANGE)+1.0;
        }
        if (posX> -zradius*2 && posX < WIDTH+zradius*2 && posY > -zradius*2 && posY < HEIGHT+zradius*2) {
            blurred_circle(posX, posY, zradius, abs(z-FOCAL_LENGTH), shaded_color, a);
        }
    }
     
    int compareTo(Object o) {
        ZObject other = (ZObject)o;
        if(other.z>z) 
            return -1;
        if(other.z<z)
            return 1;
        else
            return 0;
    }
}
 
// This function will draw a blurred circle, according to the "blur" parameter. Need to find a good radial gradient algorithm.
void blurred_circle(float x, float y, float rad, float blur, color col, float a) {
    float levels = MIN_BLUR_LEVELS + (blur*BLUR_LEVEL_COUNT);
    float level_distance = BLUR_AMOUNT*blur/levels;
    for (float i=0.0; i<=levels*2.0; i += 1.0) {
        fill(col, 255.0*(levels*2.0-i)/(levels*2.0)*a);
        ellipse(x, y, rad+(i-levels)*level_distance, rad+(i-levels)*level_distance);
    }
}