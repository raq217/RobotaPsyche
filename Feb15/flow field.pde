//Rashid Al Qubaisi

int w, h;
class FlowField {
  PVector[][] field;
  int resolution;
  
  FlowField(int w, int h, int detail) {
    field = new PVector[int(w/detail)][int(h/detail)];
    resolution = detail;
    float xoff = 0;
    for(int i = 0; i < w/detail; i++) {
      float yoff = 0;
      for(int j = 0; j < h/detail; j++) {
        float angle = map(noise(xoff, yoff), 0,1, 0,2*PI);
        //the reason for cos and sin gives it more ambiguity 
        field[i][j] = new PVector(cos(angle), sin(angle));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
  
  PVector getForce(float x, float y) {
    try {
      return field[int(x/resolution)][int(y/resolution)];
    } //this makes sure that it flows out of the screen instead of flowing back 
    catch (ArrayIndexOutOfBoundsException e) {
      return null;
    }
  }
}
 
class Point {
  PVector location;
  Point(int startX, int startY) {
    location = new PVector(startX, startY);

  }
  
  PVector getLocation() {
    return location;
  }
  
  void move(PVector direction) {
    try {
      direction.normalize();
      location.x += direction.x;
      location.y += direction.y;
      stroke(200, 255, 255, 50);
      ellipse(location.x, location.y, .5,.5);
    } //this indicates that if there is no direction by the mouse then nothing is done
    catch (NullPointerException e) {}
    
  }
}
 
//arrayList for the points
ArrayList<Point> points = new ArrayList<Point>();
void setup() {
  size(500, 500);
  w = width;
  h = height;
  
  background(0);
  strokeWeight(0.5);
  stroke(255);
  //p = new Point(width/2, height/2);
}
 
void draw() {
  FlowField field = new FlowField(width, height, 10);
  for(int x = 0; x < width; x += 10) {
    for(int y = 0; y < height; y += 10) {
      PVector force = field.getForce(x, y); 
      stroke(100);
      line(x,y, x+10*force.x,y+10*force.y);   
    }
  }
  stroke(255);  


  int listSize = points.size();
  for(int i = 0; i < listSize; i++) {
    Point point = points.get(i);
    
    
    PVector location = point.getLocation();
    PVector direction = field.getForce(location.x, location.y);
    point.move(direction);
  }
}
 //allows the user to control it with their mouse
void mouseDragged() {
  points.add(new Point(mouseX, mouseY));
}
