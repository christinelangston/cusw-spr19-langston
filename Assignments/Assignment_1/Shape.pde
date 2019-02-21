class Shape {
  
 PVector screenLocation;
 boolean locked;
 String col;
 
 Shape(String colorString){
  screenLocation = new PVector(width/2, height/2);
  locked = false;
  col = colorString;
  print(col);
 }


void randomLocation(){
screenLocation = new PVector(random(140, width - 20), random(height - 20));
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
 //noStroke();
 if (col == "blue"){
 fill(#7AE0FF);
 }if (col == "green"){
   fill(#7EFF77); 
}if(col == "red"){
  fill(#E82C0C);
}if(col == "yellow"){
  fill(#FFEC1F);
  }
 //text
 //ellipse(screenLocation.x, screenLocation.y, 30, 30);
  square(screenLocation.x, screenLocation.y, 30);
  
 //text("circle", screenLocation.x+ 30, screenLocation.y +30);
}

//int length()

}
