ArrayList<Way> ways; 

class Way{
ArrayList<PVector> coordinates;

Way(){}

Way(ArrayList<PVector>coords){
 coordinates = coords;
}

void draw(){
 strokeWeight(4);
 stroke(road_color);
 for(int i=0; i<coordinates.size() -1; i++){ // dont go outside of array with -1
  PVector screenStart = map.getScreenLocation(coordinates.get(i));
  PVector screenEnd = map.getScreenLocation(coordinates.get(i+1)); // iterate through i and next i 
  line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);

 }
}


}
