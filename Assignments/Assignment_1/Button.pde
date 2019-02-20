class Button {
  
  PVector screenLocation;
  PVector dimensions;
   boolean selected;
   int corner;
   int col;
   String text;
   
   Button(String _text){
    col = new int(#7EFF77);
    screenLocation = new PVector(20, 310);
    dimensions = new PVector(55, 35);
    corner = new int(7);
    selected = false;
    text = new String(_text);
   }
  
  void drawButton(){
  noStroke();
  fill(col);
  }
  
}
