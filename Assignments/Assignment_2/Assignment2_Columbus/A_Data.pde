JSONObject example;
JSONArray features;
JSONObject buildings;
JSONObject stations;
JSONArray features_build;
JSONObject rail;
JSONArray features_rail;
JSONObject bridge;
JSONArray features_bridge;



void loadData(){
  zoom_6 = loadImage("data/zoom_6.png");
  zoom_6.resize(width,height);
  zoom_5 = loadImage("data/zoom_5.png");
  zoom_5.resize(width,height);
  zoom_4 = loadImage("data/zoom_4.png");
  zoom_4.resize(width,height);
  zoom_3 = loadImage("data/zoom_3.png");
  zoom_3.resize(width,height);
  zoom_2 = loadImage("data/zoom_2.png");
  zoom_2.resize(width,height);
  zoom_1 = loadImage("data/zoom_1.png");
  zoom_1.resize(width,height);
  
  background = loadImage("data/columbus_background2.png");
  background.resize(width, height);
  
  stations = loadJSONObject("data/ohio_data_2/stations.geojson");
  features = stations.getJSONArray("features");
  
  buildings = loadJSONObject("data/ohio_data_2/buildings.geojson");
  features_build = buildings.getJSONArray("features");
  
  rail = loadJSONObject("data/ohio_data_2/railways.geojson");
  features_rail = rail.getJSONArray("features");

  bridge = loadJSONObject("data/ohio_data_2/bridges.geojson");
  features_bridge = bridge.getJSONArray("features");
  
  
  
  

}

void parseData(){
  // parse stations 
  for(int i=0; i < features.size(); i++){
  // Identity 2 properties: geometry and type
  String type = features.getJSONObject(i).getJSONObject("geometry").getString("type"); // point, line, polygon 
  JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
 
   //makePOIs
  if(type.equals("Point")){
   //create poi
   float lat = geometry.getJSONArray("coordinates").getFloat(1);
   float lon = geometry.getJSONArray("coordinates").getFloat(0); // note lon then lat  
   POI poi = new POI(lat, lon);
   pois.add(poi);
  }
  }
  //parse rail
  for(int i=0; i < features_rail.size(); i++){
  // Identity 2 properties: geometry and type
  String type = features_rail.getJSONObject(i).getJSONObject("geometry").getString("type"); // point, line, polygon 
  JSONObject geometry = features_rail.getJSONObject(i).getJSONObject("geometry");

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
 } }
  
  //parse bridges
  for(int i=0; i < features_bridge.size(); i++){
  // Identity 2 properties: geometry and type
  String type = features_bridge.getJSONObject(i).getJSONObject("geometry").getString("type"); // point, line, polygon 
  JSONObject geometry = features_bridge.getJSONObject(i).getJSONObject("geometry");
  // make lines / roads /ways
  if(type.equals("LineString")){
   ArrayList<PVector> coords = new ArrayList<PVector>(); 
   JSONArray coordinates = geometry.getJSONArray("coordinates");//.getJSONArray(0);
   for(int j=0; j<coordinates.size(); j++){
    float lat = coordinates.getJSONArray(j).getFloat(1);
    float lon = coordinates.getJSONArray(j).getFloat(0);
    //make a pvector
    PVector coordinate = new PVector(lat, lon);
    coords.add(coordinate);
   }
   Bridge b = new Bridge(coords);
   bridges.add(b);  
  }
  }
 
 //parse buildings
 for(int i=0; i < features_build.size(); i++){
  // Identity 2 properties: geometry and type
  String type = features_build.getJSONObject(i).getJSONObject("geometry").getString("type"); // point, line, polygon 
  JSONObject geometry = features_build.getJSONObject(i).getJSONObject("geometry");
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
   
  }  }}
