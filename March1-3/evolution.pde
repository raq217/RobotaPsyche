//Rashid Al Qubaisi


List<Vehicle> vehicles = new ArrayList<Vehicle>();
List<PVector> food = new ArrayList<PVector>();
List<PVector> poison = new ArrayList<PVector>();

boolean debug;

void setup() {
  size(640, 360);
  for (int i = 0; i < 50; i++) {
    float x = random(width);
    float y = random(height);
    vehicles.add(new Vehicle(x, y));
  }

  for (int i = 0; i < 40; i++) {
    float x = random(width);
    float y = random(height);
    food.add(new PVector(x, y));
  }

  for (int i = 0; i < 20; i++) {
    float x = random(width);
    float y = random(height);
    poison.add(new PVector(x, y));
  }
}
//ensures that the mouse and user controls the spawning of vehicles 
void mouseDragged() {
  vehicles.add(new Vehicle(mouseX, mouseY));
}

void draw() {
  background(51,51,200);

  if (random(1) < 0.1) {
    float x = random(width);
    float y = random(height);
    food.add(new PVector(x, y));
  }

//this is responsible for the randomization of the poison, making sure that it doesn't spawn twice on the same location 
  if (random(1) < 0.01) {
    float x = random(width);
    float y = random(height);
    poison.add(new PVector(x, y));
  }


  for (int i = 0; i < food.size(); i++) {
    fill(0, 255, 0);
    noStroke();
    ellipse(food.get(i).x, food.get(i).y, 4, 4);
  }

  for (int i = 0; i < poison.size(); i++) {
    fill(255, 0, 0);
    noStroke();
    ellipse(poison.get(i).x, poison.get(i).y, 4, 4);
  }

  for (int i = vehicles.size() - 1; i >= 0; i--) {
    Vehicle v = vehicles.get(i);
    v.boundaries();
    v.behaviors(food, poison);
    v.update();
    v.display();

//adds a new vehicle
    Vehicle newVehicle = v.clone();
    if (newVehicle != null) {
      vehicles.add(newVehicle);
    }

//this removes the vehicle once it dies
    if (v.dead()) {
      food.add(v.position.copy());
      vehicles.remove(i);
    }
  }
}
