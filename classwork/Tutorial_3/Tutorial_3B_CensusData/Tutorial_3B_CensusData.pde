MercatorMap map;

Raster raster;

void setup(){
  CensusPolygons = new ArrayList<Polygon>();
  size(600, 800);
  //Intiailize your data structures early in setup 
  map = new MercatorMap(width, height, 28, 26.5, -81.25, -80.5, 0);//42, 38, -85, -80, 0); //28, 26.5, -81.25, -80.5, 0);//
  loadData();
  parseData();
  raster = new Raster(20, 600, 600);
}

void draw(){
  background(0);
  for(int i = 0; i<CensusPolygons.size(); i++){
    //println(CensusPolygons.get(i).score);
    CensusPolygons.get(i).draw();
  }
  //raster.draw();
 // county.draw();
}
