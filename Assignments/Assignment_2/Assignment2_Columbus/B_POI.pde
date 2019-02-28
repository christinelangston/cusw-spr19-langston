// make stations

ArrayList<POI> pois;

class POI{
  //coordinate
  PVector coord;
  //lat, lon values
  float lat;
  float lon;
  int poi_fill;
  
  //Type - may use later
  String type;
  //make the constructor
  POI(float _lat, float _lon){
    lat = _lat;
    lon = _lon;
    coord = new PVector(lat, lon);
    type = null;
  }
  
  void draw(){
      PVector screenLocation = map.getScreenLocation(coord);
    fill(station);
    noStroke();
    ellipse(screenLocation.x, screenLocation.y, 6, 6);
  }
  
}
