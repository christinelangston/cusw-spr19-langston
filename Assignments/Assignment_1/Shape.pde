class Shape {
  
 PVector screenLocation;
 boolean locked;
 
 Shape(){
  screenLocation = new PVector(width/2, height/2);
  locked = false;
 }


void randomLocation(){
screenLocation = new PVector(random(width), random(height));
}


boolean checkSelection(){
  float xDistance = abs(mouseX - screenLocation.x);
  float yDistance = abs(mouseY - screenLocation.y);
   
   if (xDistance < 30 && yDistance < 30 ){
    locked = true;
  }else{
  locked = false;
  }
 return locked; 
}

void updateLocation(){
  if (locked){
  
  screenLocation = new PVector(mouseX, mouseY);
  }
 }

void drawShape(){
 noStroke();
 fill(#7AE0FF);
 //text
 //ellipse(screenLocation.x, screenLocation.y, 30, 30);
  square(screenLocation.x, screenLocation.y, 30);
  
 //text("circle", screenLocation.x+ 30, screenLocation.y +30);
}

}
