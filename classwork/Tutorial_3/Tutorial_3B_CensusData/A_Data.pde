Table CountyBoundary, CensusData,CensusBlocks;

void loadData(){
  CountyBoundary = loadTable("data/FloridaNodes.csv", "header");//("data/FloridaNodes.csv", "header");
  CensusBlocks = loadTable("data/CensusNodes.csv", "header");//loadTable("data/3-22-nodes_sample.csv", "header");//
  CensusData = loadTable("data/CensusAttrs.csv", "header");//loadTable("data/3-22-attributes_sample.csv", "header");//
  println("Data Loaded");
}

void parseData(){
  //First parse county polygon
    ArrayList<PVector> coords = new ArrayList<PVector>();
    for(int i = 0; i<CountyBoundary.getRowCount(); i++){
         float lat = float(CountyBoundary.getString(i, 2));
         float lon = float(CountyBoundary.getString(i, 1));
         coords.add(new PVector(lat, lon));
    }
   county = new Polygon(coords);
   county.outline = true;
   county.makeShape();  

//Now we can parse the population polygons
  int previd = 0;
  coords = new ArrayList<PVector>();
  for(int i = 0; i<CensusBlocks.getRowCount(); i++){
    int shapeid = int(CensusBlocks.getString(i, 0));
       if(shapeid != previd){
           if(coords.size() > 0){
               Polygon poly = new Polygon(coords);
               poly.id = shapeid;
               CensusPolygons.add(poly);
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
  
  //Add attribute you want to your polygon (you can add more attributes if you want and look at the Tiger page for more info) 
  for(int i = 0; i<CensusPolygons.size(); i++){
//    println(CensusData.getFloat(i, "AWATER"));
    CensusPolygons.get(i).score = CensusData.getFloat(i, "B01001e1")*255/10367;///CensusData.getFloat(i, "B01001e1");//int(CensusData.getFloat(i, "B01001e2")/CensusData.getFloat(i, "B01001e1"));//"ALAND")/(49191947)*255);//"AWATER10")); //this is ONLY if the IDs are accurate"B19113"
  //    println(int(CensusData.getFloat(i, "AWATER")/903837*255));
    CensusPolygons.get(i).colorByScore();
    CensusPolygons.get(i).makeShape();
    
  }
  

  //Test case for point in Polygon
  //println(county.pointInPolygon(new PVector(27.25, -80.85)));
  
  println("Data Parsed");
}
