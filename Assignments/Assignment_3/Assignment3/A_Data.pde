Table CountyBoundary, CensusData,CensusBlocks, Trans;

void loadData(){
  CensusBlocks = loadTable("ohio_6_data/ohioACS-nodes.csv", "header");//loadTable("data/3-22-nodes_sample.csv", "header");//
  CensusData = loadTable("ohio_6_data/ohioACS-attributes.csv", "header");//loadTable("data/3-22-attributes_sample.csv", "header");//
  Trans = loadTable("ohio_6_data/trans-nodes.csv", "header");
  println("Data Loaded");
  
}

void parseData(){
  //First parse county polygon
    ArrayList<PVector> coords = new ArrayList<PVector>();
 for(int i=0; i < Trans.getRowCount(); i++){
  float lat = float(Trans.getString(i, 2));
  float lon = float(Trans.getString(i, 1)); 
  //coords.add(new PVector(lat,lon));
  POI poi = new POI(lat, lon);
  pois.add(poi);
 }

//Now we can parse the population polygons
  int previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<CensusBlocks.getRowCount(); i++){
    int shapeid = int(CensusBlocks.getString(i, 0));
       if(shapeid != previd){
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               CarPolygons.add(poly);
              // Income.add(poly); // income polygons
              // Transit.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
       }
       if(shapeid == previd){
         float lat = float(CensusBlocks.getString(i, 2));
         float lon = float(CensusBlocks.getString(i, 1));
         //println(lat, lon);
         coords.add(new PVector(lat, lon));
       }
  }
  
  previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<CensusBlocks.getRowCount(); i++){
    int shapeid = int(CensusBlocks.getString(i, 0));
       if(shapeid != previd){
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               //CarPolygons.add(poly);
               Income.add(poly); // income polygons
              // Transit.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
       }
       if(shapeid == previd){
         float lat = float(CensusBlocks.getString(i, 2));
         float lon = float(CensusBlocks.getString(i, 1));
         coords.add(new PVector(lat, lon));
       }
  }
  
    previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<CensusBlocks.getRowCount(); i++){
    int shapeid = int(CensusBlocks.getString(i, 0));
       if(shapeid != previd){
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               //CarPolygons.add(poly);
              /// Income.add(poly); // income polygons
               Transit.add(poly);
           }
           //clear coords
           coords = new ArrayList<PVector>();
           //reset variable
           previd = shapeid;
       }
       if(shapeid == previd){
         float lat = float(CensusBlocks.getString(i, 2));
         float lon = float(CensusBlocks.getString(i, 1));
         coords.add(new PVector(lat, lon));
       }
  }
  
  //Add attribute you want to your polygon (you can add more attributes if you want and look at the Tiger page for more info) 
  for(int i = 0; i<CarPolygons.size(); i++){
//    println(CensusData.getFloat(i, "AWATER"));
//B08301e1 = total workers over 16 
//B08301e2 = car, truck, van
//B08301e10 = # public transit
//B19013e1 = median income
    CarPolygons.get(i).opacity = CensusData.getFloat(i, "B08301e2")*255/CensusData.getFloat(i, "B08301e1");///CensusData.getFloat(i, "B01001e1");//int(CensusData.getFloat(i, "B01001e2")/CensusData.getFloat(i, "B01001e1"));//"ALAND")/(49191947)*255);//"AWATER10")); //this is ONLY if the IDs are accurate"B19113"
  //    println(int(CensusData.getFloat(i, "AWATER")/903837*255));
//    CarPolygons.get(i).colorByScore();
    CarPolygons.get(i).makeShape();
    
  }
  // create Transit polygons
  for(int i = 0; i<Transit.size(); i++){
   // Income.get(i).score = CensusData.getFloat(i, "B19013e1")*255 /250001;//*255/CensusData.getFloat(i, "B08301e1");///CensusData.getFloat(i, "B01001e1");//int(CensusData.getFloat(i, "B01001e2")/CensusData.getFloat(i, "B01001e1"));//"ALAND")/(49191947)*255);//"AWATER10")); //this is ONLY if the IDs are accurate"B19113"
   // Income.get(i).opacity = 50;
  // Income.get(i).fill = 
  // divide number of transit users / total workers
   Transit.get(i).opacity = CensusData.getFloat(i, "B08301e10")*255/CensusData.getFloat(i, "B08301e1");//*255/CensusData.getFloat(i, "B08301e1");///CensusData.getFloat(i, "B01001e1");//int(CensusData.getFloat(i, "B01001e2")/CensusData.getFloat(i, "B01001e1"));//"ALAND")/(49191947)*255);//"AWATER10")); //this is ONLY if the IDs are accurate"B19113"
//  println(Transit.get(i).opacity);
  Transit.get(i).r = 0;//(204, 102, 0);
  Transit.get(i).g = 255;//
  Transit.get(i).b = 255;
    //Income.get(i).colorByScore();
    Transit.get(i).makeShape();
    
  }
  // create income polygons
  for(int i = 0; i<Income.size(); i++){

   Income.get(i).opacity =  2*CensusData.getFloat(i, "B19013e1")*255/250001;//*255/CensusData.getFloat(i, "B08301e1");///CensusData.getFloat(i, "B01001e1");//int(CensusData.getFloat(i, "B01001e2")/CensusData.getFloat(i, "B01001e1"));//"ALAND")/(49191947)*255);//"AWATER10")); //this is ONLY if the IDs are accurate"B19113"
  println(Income.get(i).opacity);
    Income.get(i).r = 204;//= (204, 102, 0, Transit.get(i).opacity);
  Income.get(i).g = 102;
  Income.get(i).b = 0;
    //Income.get(i).colorByScore();
    Income.get(i).makeShape();
    
  }

  println("Data Parsed");
}
