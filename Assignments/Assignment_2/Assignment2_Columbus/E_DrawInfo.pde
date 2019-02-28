color poi_fill = color(255, 255, 0);
color station = color(255, 99, 71) ;
color polygon_fill = color(236, 11, 252);
color rail_color = color(100, 149, 237); // rbg format 
color bridge_color = color(32, 178, 170) ;


void drawInfo(){
  //create legend
  fill(255);
  textSize(12);
  rect(1000-125, 20, 105, 90, 10); // 1000, 650
  fill(station);
  text("S - Stations", 1000 - 105, 40);
  fill(bridge_color);
  text("R - Bridges", 1000 - 105, 60);
  fill(rail_color);
  text("R - Rail", 1000 - 105, 80);
  fill(polygon_fill);
  text("B - Buildings", 1000 - 105, 100);
  
}
