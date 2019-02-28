// tab for parsing data

JSONObject example;
JSONArray features;
JSONObject wholeArea;
//Look at https://processing.org/reference/JSONObject.html for more info

void loadData(){
  background = loadImage("data/background.png");
  background.resize(width, height);
  
  wholeArea = loadJSONObject("data/wholeArea.json");
features = wholeArea.getJSONArray("features");
  
  //small example
//   example = loadJSONObject("data/example.json");
//  features = example.getJSONArray("features");

  println("There are: ", features.size(), " features");
  
}

void parseData(){
  // illustrative example
for(int i=0; i < features.size(); i++){
  // Identity 2 properties: geometry and type
  String type = features.getJSONObject(i).getJSONObject("geometry").getString("type"); // point, line, polygon 
  JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
  JSONObject properties = features.getJSONObject(i).getJSONObject("properties");
  
  //identify more information
  String dataAmenity = properties.getJSONObject("tags").getString("amenity");
  String amenity = "";
  if(dataAmenity != null) amenity = dataAmenity; // check that its not null incase it throws an error
  
  //makePOIs
  if(type.equals("Point")){
   //create poi
   float lat = geometry.getJSONArray("coordinates").getFloat(1);
   float lon = geometry.getJSONArray("coordinates").getFloat(0); // note lon then lat
   
   POI poi = new POI(lat, lon);
   poi.type = amenity;
   if(amenity.equals("atm")) poi.ATM = true;
   pois.add(poi);
  }
  
  // make polygons! 
  if(type.equals("Polygon")){
   //make a polygon!
   ArrayList<PVector> coords = new ArrayList<PVector>(); //initalize everytime so no carry over
   JSONArray coordinates = geometry.getJSONArray("coordinates").getJSONArray(0);
   for (int j = 0; j < coordinates.size(); j++){
      //make sure its in correct order - listed by JSON in order by OSM
      float lat = coordinates.getJSONArray(j).getFloat(1);
      float lon = coordinates.getJSONArray(j).getFloat(0);
      PVector coordinate = new PVector(lat, lon);
      coords.add(coordinate);

   }
   Polygon poly = new Polygon(coords);
   polygons.add(poly);
   
  }
  // make lines / roads /ways
  if(type.equals("LineString")){
   ArrayList<PVector> coords = new ArrayList<PVector>(); 
   // dont need last nest
   JSONArray coordinates = geometry.getJSONArray("coordinates");//.getJSONArray(0);
   for(int j=0; j<coordinates.size(); j++){
    float lat = coordinates.getJSONArray(j).getFloat(1);
    float lon = coordinates.getJSONArray(j).getFloat(0);
    //make a pvector
    PVector coordinate = new PVector(lat, lon);
    coords.add(coordinate);
   }
   Way way = new Way(coords);
   ways.add(way);
   
  }
  
  
  
}

}
