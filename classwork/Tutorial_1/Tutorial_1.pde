
//Step 1: create /allocate memory for person 

ArrayList<Person> people;
ArrayList<Connection> frands;

//Person ira;
//Person eric;
//Person christine;


// Runs Oncde
void setup() {
  
  people = new ArrayList<Person>();
  frands = new ArrayList<Connection>();
  
  size(800, 600);
  background(0); // black background
  //background(255); //white background
  for (int i = 0; i < 10; i++){
     Person p = new Person("Person " + str(i), str(int(random(1,5))));
     p.randomLocation();
     people.add(p);
  
  }
  
  //who are friends?
  for (Person origin: people){
  for (Person destination: people){ 
    // is person the same? 
    if(!origin.name.equals(destination.name)){
      if (origin.year.equals(destination.year)){
      frands.add(new Connection(origin, destination, "frands"));
      }
    }
  }
  }
  
  
}
// Runs repeatedly, 60 frames per second 
void draw() {
  clear();
  //background(0); // black background

  fill(255);
  //ellipse(mouseX, mouseY, 50, 50);
  //ira.draw();
 // christine.draw();
 
 for (Person p: people){
   p.updateLocation();
  p.drawPerson(); 
 }
 
 for (Connection c: frands){
   c.draw(); 
 }
  
}


void mousePressed(){
 for (Person p: people){
   if(p.checkSelection()){
    break; 
   }// only selects one person when mouse is clicked
 }
}


void mouseReleased(){ // if released mouse then executes
  for (Person p: people) { 
    p.locked = false;
  }
  
}
