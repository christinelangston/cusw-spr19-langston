// tab for all objects of POIs

ArrayList<POI> pois;

class POI{
  //coordinate
  PVector coord;
  //lat, lon values
  float lat;
  float lon;
  
  // is ATM?
  boolean ATM;
  
//  noStroke();
  int poi_fill;
  
  //Type - may use later
  String type;
  //make the constructor
  POI(float _lat, float _lon){
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
    type = null;
    ATM = false;
  }
  
  void draw(){
      PVector screenLocation = map.getScreenLocation(coord);
    fill(poi_fill);
    noStroke();
    if (ATM) fill(atm);
    ellipse(screenLocation.x, screenLocation.y, 6, 6);
  }
  
}
