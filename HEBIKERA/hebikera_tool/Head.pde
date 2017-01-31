class Head {

  PVector position;
  PVector velocity;
  float topspeed;
  float reductionRate;

  Head(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0,0);
    topspeed = 5;
  }
  
  void update(ArrayList<Creature> creatures) {
    PVector followP = follow();
    PVector separateP = separate(creatures);
    velocity.add(followP);
    velocity.add(separateP);
    velocity.limit(topspeed);
    position.add(velocity);
}
  
  PVector follow() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector followPower = PVector.sub(mouse,position);
    followPower.setMag(0.2);
    followPower.limit(topspeed);
    return followPower;
  }
  
  PVector separate(ArrayList<Creature> creatures){
    float desiredDistance = 20;
    PVector sum = new PVector();
    int count = 0;
    for (Creature c: creatures){
      float d = PVector.dist(position, c.brain.position);
      if ((d > 0) && (d < desiredDistance)){
        PVector diff = PVector.sub(position, c.brain.position);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0){
      sum.div(count);
      sum.normalize();
      sum.mult(0.8);
    }
    return sum;
  }
  
  void display() {
    float angle = velocity.heading();
    reductionRate = map(velocity.x,0,5,0,1);
    stroke(0);
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(0);
    ellipse(0,0,16*reductionRate,16);
    noFill();
    beginShape();
    //右向き ※radianで計算するときは反時計回り
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(40*cos(angle+radians(30))*reductionRate,40*sin(angle+radians(30)));
      vertex(15*cos(angle+radians(150))*reductionRate,15*sin(angle+radians(150)));
      vertex(30*cos(angle-radians(120))*reductionRate,30*sin(angle-radians(120)));
      vertex(50*cos(angle-radians(120))*reductionRate,50*sin(angle-radians(120)));
      vertex(30*cos(angle-radians(60))*reductionRate,30*sin(angle-radians(60)));
    }else{
    //左向き
      vertex(40*cos(angle-radians(30))*reductionRate,40*sin(angle-radians(30)));
      vertex(15*cos(angle-radians(150))*reductionRate,15*sin(angle-radians(150)));
      vertex(30*cos(angle+radians(120))*reductionRate,30*sin(angle+radians(120)));
      vertex(50*cos(angle+radians(120))*reductionRate,50*sin(angle+radians(120)));
      vertex(30*cos(angle+radians(60))*reductionRate,30*sin(angle+radians(60)));
    }
    endShape(CLOSE);
    
    popMatrix();
  }

}