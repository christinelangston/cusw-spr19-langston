/*
Template for Assignment 2 for 11.S195 Spring 2019 
Nina Lutz, nlutz@mit.edu 

This template is just a suggested structure but feel free to modify it, use code from class, etc
*/
// Christine Langston Feb 28 2019

MercatorMap map;
PImage background;
PImage zoom_6;
PImage zoom_5;
PImage zoom_4;
PImage zoom_3;
PImage zoom_2;
PImage zoom_1;



boolean drawBuildings = false;
boolean drawRail = false; //draw rail and bridges
boolean drawStations = false;
int zoom = 1;

void setup(){
  size(1000, 650);
  map = new MercatorMap(width, height, 39.9653, 39.9571, -83.0110, -82.9926 , 0);
  pois = new ArrayList<POI>();
  polygons = new ArrayList<Polygon>();
  ways = new ArrayList<Way>();
  bridges = new ArrayList<Bridge>();
  
  loadData();
  parseData();
}

void draw(){
   
  // zooming ability
  if(zoom == 1){
      image(zoom_1, 0, 0); 
  }else if(zoom ==2){
  image(zoom_2, 0, 0); 
  }else if(zoom ==3){
  image(zoom_3, 0, 0); 
  }else if(zoom ==4){
    image(zoom_4, 0, 0); 
  }else if(zoom ==5){
    image(zoom_5, 0, 0); 
  }else if(zoom ==6){
    image(zoom_6, 0, 0); 
  }else if(zoom >6){
   image(background, 0, 0); 
 
  }fill (0, 40); // 120 is opacity so signifies a tint
  rect(0,0, width, height);
  fill(0);
  textSize(40);
  text("Columbus, Ohio", 30, 620);
   if(zoom >6){
 if(drawBuildings){
 for(int i = 0; i < polygons.size(); i++){
  polygons.get(i).draw(); 
 }}
 if(drawStations){
 for(int i = 0; i < pois.size(); i++){
  pois.get(i).draw(); 
 }}
 if(drawRail){
 for(int i = 0; i < ways.size(); i++){
  ways.get(i).draw(); 
 }for(int i = 0; i < bridges.size(); i++){
  bridges.get(i).draw(); 
 }}
 
  noStroke();

 drawInfo();
   }
  
}

void keyPressed(){ // determine what to draw
 if(key == 'b' || key == 'B'){ // activate buildings
  if(!drawBuildings){
 drawBuildings = true; 
}else{
 drawBuildings = false; 
  
}}

if(key == 'r' || key == 'R'){ //activate roads and bridges
  if(!drawRail){
 drawRail = true; 
}else{
 drawRail = false; 
  
}}
if(key == 's' || key == 'S'){ //activate stations
  if(!drawStations){
 drawStations = true; 
}else{
 drawStations = false; 
  
}}


  if(zoom <7){
    zoom +=1;
    
 }

}
