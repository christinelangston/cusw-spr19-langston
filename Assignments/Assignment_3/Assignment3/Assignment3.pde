MercatorMap map;

Raster raster;
boolean drawIncome = false;
boolean drawTransit = false;
boolean drawCar = true;

void setup(){
  CarPolygons = new ArrayList<Polygon>();
  Income = new ArrayList<Polygon>();
  Transit = new ArrayList<Polygon>();
  
  size(800, 600);
  //Intiailize your data structures early in setup 
  map = new MercatorMap(width, height, 40.0, 39.9, -83.1, -82.9, 0); //28, 26.5, -81.25, -80.5, 0);//
   pois = new ArrayList<POI>();

  loadData();
  parseData();
  raster = new Raster(20, 600, 600);
}

void draw(){
  background(0);

if(drawCar){
  for(int i = 0; i<CarPolygons.size(); i++){
  //  println(CarPolygons.get(i).score);
    CarPolygons.get(i).draw();
  }}
//  println(drawIncome);
  if(drawIncome){
  for(int i = 0; i<Income.size(); i++){
    Income.get(i).draw();
  }
  }
  if(drawTransit){
  for(int i = 0; i<Transit.size(); i++){
    Transit.get(i).draw();
  }
  }
  
  for(int i = 0; i < pois.size(); i++){
  pois.get(i).draw(); 
 }
  //raster.draw();
 // county.draw();
 fill(0);
  textSize(40);
  text("Columbus, Ohio", 30, 580);
//println("keypresed");
drawInfo();
//println("DoneDrawing");
}

void keyPressed(){ // determine what to draw
 if(key == 'i' || key == 'I'){ // activate buildings
  if(!drawIncome){
 drawIncome = true; 
}else{
 drawIncome = false; 
  
}}if(key == 't' || key == 'T'){ // activate buildings
  if(!drawTransit){
 drawTransit = true; 
}else{
 drawTransit = false; 
  
}}
if(key == 'c' || key == 'C'){ // activate buildings
  if(!drawCar){
 drawCar = true; 
}else{
 drawCar = false; 
  
}}
  
}
