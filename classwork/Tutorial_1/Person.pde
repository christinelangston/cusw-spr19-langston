class Person {
 // create object Person
  String name;
 String year;
 PVector screenLocation;
 boolean locked; //am i clicking on this circle? 

 
 Person(String _name, String _year) {
  name = _name;
  year = _year;
  screenLocation =  new PVector(width/2, height/2);
 }
 
  void randomLocation(){
   screenLocation = new PVector(random(width), random(height)); 
  }
 
 // see if my mouse  cursor is -near- my person 
 boolean hoverEvent() { 
   float xDistance = abs(mouseX - screenLocation.x);
   float yDistance = abs(mouseY - screenLocation.y);
   
   if (xDistance < 30 && yDistance < 30 ){
   return true;
   } else{
   return false;
   }
 } 
 
 boolean checkSelection(){
  if (hoverEvent()){
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
 
  void drawPerson(){
   noStroke(); // no circle outline 
   if (hoverEvent()){
    fill(#FFFF00); 
   } else{
    fill(255); //White fill
   }
    ellipse(screenLocation.x, screenLocation.y, 30, 30);
    text(name + " \n Year: " + year, screenLocation.x + 30, screenLocation.y +30);
  }
}


//so happy 
