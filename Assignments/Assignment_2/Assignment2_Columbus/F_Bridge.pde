// object for bridges, based off of Way object
ArrayList<Bridge>  bridges;

class Bridge{
ArrayList<PVector> coordinates;

Bridge(){}

Bridge(ArrayList<PVector>coords){
 coordinates = coords;
}

void draw(){
 strokeWeight(4);
 stroke(bridge_color);
 for(int i=0; i<coordinates.size() -1; i++){ // dont go outside of array with -1
  PVector screenStart = map.getScreenLocation(coordinates.get(i));
  PVector screenEnd = map.getScreenLocation(coordinates.get(i+1)); // iterate through i and next i 
  line(screenStart.x, screenStart.y, screenEnd.x, screenEnd.y);

 }
}


}
