class fishHead extends Head{

  fishHead(float x, float y, int num) {
    super(x, y, num);
  }
  
  void display() {
    angle = atan2(-velocity.y,velocity.x);
    reductionRate = map(abs(velocity.x),0,5,0,1);
    stroke(random(200));
    strokeWeight(2);
    pushMatrix();
    translate(position.x, position.y);
    fill(random(200));
    beginShape();
    //右向き
    if(angle <= PI/2 && angle >= -PI/2){
      vertex(16*cos(angle-PI/6)*reductionRate,-16*sin(angle-PI/6));
      vertex(6*cos(angle-PI*5/6)*reductionRate,-6*sin(angle-PI*5/6));
      vertex(12*cos(angle+PI*2/3)*reductionRate,-12*sin(angle+PI*2/3));
      vertex(20*cos(angle+PI*2/3)*reductionRate,-20*sin(angle+PI*2/3));
      vertex(12*cos(angle+PI/3)*reductionRate,-12*sin(angle+PI/3));
    }else{
    //左向き
      vertex(16*cos(angle+PI/6)*reductionRate,-16*sin(angle+PI/6));
      vertex(6*cos(angle+PI*5/6)*reductionRate,-6*sin(angle+PI*5/6));
      vertex(12*cos(angle-PI*2/3)*reductionRate,-12*sin(angle-PI*2/3));
      vertex(20*cos(angle-PI*2/3)*reductionRate,-20*sin(angle-PI*2/3));
      vertex(12*cos(angle-PI/3)*reductionRate,-12*sin(angle-PI/3));
    }
    endShape(CLOSE);
    //目
    stroke(0);
    strokeWeight(2);
    fill(0);
    ellipse(0,0,4*reductionRate,4);
    popMatrix();
  }

}