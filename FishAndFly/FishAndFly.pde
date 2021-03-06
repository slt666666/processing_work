Flock FishAndHebi;
ArrayList<Ball> balls;
ArrayList<Bullet> bullets;

void setup() {
  //fullScreen();
  size(720,480);
  background(220);
  FishAndHebi = new Flock(10,2);
  balls = new ArrayList<Ball>();
  balls.add(new Ball());
  balls.add(new Ball());
  balls.add(new Ball());
  bullets = new ArrayList<Bullet>();
}

void draw() {

  background(220);
  for (Ball b: balls){
    b.move();
  }
  FishAndHebi.deadCheck();
  FishAndHebi.update();
  FishAndHebi.display();
  for (int i = bullets.size()-1; i >= 0; i--){
     bullets.get(i).move();
     if (bullets.get(i).removeCheck()){
       bullets.remove(bullets.get(i));
     }
  }
  text("Click to generate new creature", 0, height-10);
}

void mousePressed(){
   Bullet bullet = new Bullet();
   bullets.add(bullet);   
}

void keyPressed(){
   FishAndHebi.addFish(5);
   FishAndHebi.addHebi();
}