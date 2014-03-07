// simple pie chart with real data
// source = research.gov 

// simple pie chart with real data set
// Federal Science Funding by Agency
// Source = research.org

String filename = "awards_cleaned.csv";
String[] rawData;

void setup() {
  size(500, 500); 
  println("***BEGIN***");
  rawData = loadStrings(filename);
  printArray(rawData);
  processData();
}

void draw() {
  
}

void processData() {
  for(int i=0; i<rawData.length; i++) {
    if(!rawData[i].contains("NSF") && !rawData[i].contains("NASA")) {
      println(rawData[i]); 
    }
  }
  println("SEARCH COMPLETE");
}

//float calcRadians(float f) {
//  float arcPercent = (f/100) * 360;
//  float arcRadians = radians(arcPercent); 
//  return arcRadians;
//}
