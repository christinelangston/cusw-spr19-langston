class Button {
  
  PVector screenLocation;
  PVector dimensions;
   boolean selected;
   int corner;
  // int col;
  String col;
   String text;
   
   Button(String _text, int x,int y, String _color){
   // col = new int(#7EFF77);
   col = _color;
    screenLocation = new PVector(x, y);//(20, 280);
    dimensions = new PVector(55, 35);
    corner = 7;
    selected = false;
    text = new String(_text);
   }
  
  void drawButton(){
  noStroke();
  if (col == "green"){
    
  fill(#7EFF77);
  }if (col == "blue"){
 fill(#7AE0FF);
 }if (col == "red"){
    fill(#E82C0C);  
  }if(col == "yellow"){
  fill(#FFEC1F);
  }
  rect(screenLocation.x, screenLocation.y, dimensions.x, dimensions.y, corner);
  fill(0);
  text(text, screenLocation.x+ 15, screenLocation.y + 20);
  }
  
  boolean selected(){
    print("inside selecteD");
   float xDistance = abs(mouseX - screenLocation.x - dimensions.x/2);
  float yDistance = abs(mouseY - screenLocation.y - dimensions.y/2);
 if (xDistance < 25 && yDistance < 15 ){
   return true;
 } else{
   return false;
 }
  }
  
  void add(String col){
   // print(redsEmpty);
   
   if (col == "red"){
   for (int i = 0; i < 10; i++){
     Shape s = new Shape(col);
     s.randomLocation();
     reds[i] = s;
      } redsEmpty = false;
  }if (col == "green"){
   for (int i = 0; i < 10; i++){
     Shape s = new Shape(col);
     s.randomLocation();
     greens[i] = s;
      } greensEmpty = false;
  }if (col == "yellow"){
   for (int i = 0; i < 10; i++){
     Shape s = new Shape(col);
     s.randomLocation();
     yellows[i] = s;
      } yellowsEmpty = false;
  }if (col == "blue"){
   for (int i = 0; i < 10; i++){
     Shape s = new Shape(col);
     s.randomLocation();
     blues[i] = s;
      } bluesEmpty = false;
  }
  
  
  
  }
  
}
