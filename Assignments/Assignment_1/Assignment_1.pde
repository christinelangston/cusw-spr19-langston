
Shape[] reds;
Shape[] yellows;
Shape[] greens;
Shape[] blues;

Button[] buttons;
boolean redsEmpty = true;
boolean yellowsEmpty = true;
boolean greensEmpty = true;
boolean bluesEmpty = true;

StopWatchTimer sw = new StopWatchTimer();

int n;
int totalMoves;

void setup(){
  
  blues = new Shape[10];
  greens = new Shape[10];
   yellows = new Shape[10];
   reds = new Shape[10];
 
  buttons = new Button[4]; // so far only 2 buttons
 
  size(640, 360); // width then height
 background(255);
 // for (int i = 0; i < 10; i++){
 //    Shape s = new Shape("blue");
 //    s.randomLocation();
     //shapes.add(s);
 //    shapes[i] = s;
// }
//  b = new Button("Add", 20, 310);
//  redButton = new Button("Add", 20 , 270);

  buttons[0] = new Button("Add", 20, 310, "green");;
  buttons[1] = new Button("Add", 20 , 270, "red");
  buttons[2] = new Button("Add", 20 , 230, "blue");
  buttons[3] = new Button("Add", 20 , 190, "yellow"); // #FFEC1F
  // sw.start();
}

void draw(){
  
  background(255);
  n =0;//shapes.length;// + reds.length; // add other values 
  if(!bluesEmpty){
  n = n + blues.length;
  }if(!redsEmpty){
   n = n + reds.length; 
  }if(!yellowsEmpty){
   n = n + yellows.length; 
  } if(!greensEmpty){
   n = n + greens.length; 
  }
  
  fill(0);
  text("Total shapes: " + str(n), 30, 35);
  text("Total moves: " + str(totalMoves), 30, 55);
  text("Press Any Key to Reset", 20, 15);
  int time = sw.seconds(); 
  text("Timer: " + str(time), 30, 75);

if (!bluesEmpty){
 for (Shape s: blues){
 s.updateLocation();
 s.drawShape();
 }
}if (!redsEmpty){
  for (Shape re: reds){
 re.updateLocation();
 re.drawShape();
 }
 }if (!greensEmpty){
  for (Shape ge: greens){
 ge.updateLocation();
 ge.drawShape();
 }
 }if (!yellowsEmpty){
  for (Shape ye: yellows){
 ye.updateLocation();
 ye.drawShape();
 }
 }
 
for (Button b: buttons){
 b.drawButton();
 }

}


// print frame rate to console

void keyPressed(){

 totalMoves = 0;
 bluesEmpty =true;
 yellowsEmpty = true; // dont draw reds
 redsEmpty = true; // dont draw reds
 greensEmpty = true; // dont draw reds
 sw.stop();
}

void mousePressed(){
  if(!bluesEmpty){
  for(Shape s: blues){
  if(s.checkSelection()){
  break;
  } } }
  if (!redsEmpty){
  for (Shape re: reds){
 if(re.checkSelection()){
 break;
 } }  }if (!greensEmpty){
  for (Shape ge: greens){
 if(ge.checkSelection()){
 break; } }
  }if (!yellowsEmpty){
  for (Shape ye: yellows){
 if(ye.checkSelection()){
 break;
 }
 } }
  
  
  for(Button bn: buttons){
 
   if(bn.selected()){ //add blocks
   print(bn.col);
   if(redsEmpty && yellowsEmpty && greensEmpty && redsEmpty){
    sw.start(); 
   }
     bn.add(bn.col);
     break;
   }
  }
  


}

void mouseReleased(){
  if(!bluesEmpty){
  for(Shape s: blues){
    if (s.locked){
      totalMoves++;
    }
   s.locked = false; 
  }
  }
  
  if (!redsEmpty){
  for(Shape re: reds){
    if (re.locked){
      totalMoves++;
    }
   re.locked = false; 
  }
  }
   if (!greensEmpty){
  for(Shape ge: greens){
    if (ge.locked){
      totalMoves++;
    }
   ge.locked = false; 
  }
  }
   if (!yellowsEmpty){
  for(Shape ye: yellows){
    if (ye.locked){
      totalMoves++;
    }
   ye.locked = false; 
  }
  }
  
}
