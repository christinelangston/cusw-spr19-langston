
ArrayList<Shape> shapes;
//Shape s;
void setup(){
   shapes = new ArrayList<Shape>();

 size(640, 360); // width then height
 background(0);
  for (int i = 0; i < 10; i++){
     Shape s = new Shape();
     s.randomLocation();
     shapes.add(s);
  }
  
}

void draw(){
  clear();
 // ellipse(mouseX, mouseY, 50, 50);

 fill(255);
 text("Reset", 30, 330);

 //fill(#0EFF00);

 for (Shape s: shapes){
 s.updateLocation();
 s.drawShape();
 }
}


// print frame rate to console

void mousePressed(){
  for(Shape s: shapes){
  if(s.checkSelection()){
  break;
  }
  } 
}

void mouseReleased(){
  for(Shape s: shapes){
 s.locked = false; 
  }
}
