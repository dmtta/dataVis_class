String filename = "results.csv";
String[] rawData;

float NSFtotal, NASAtotal;

void setup() {
  size(500, 500);
  rawData = loadStrings(filename);
  //printArray(rawData);
  processData();
}

void draw() {
  background(40);
  noStroke();
  
  // calculate the % of a grand total for each agency
  // in radians
  float NSFpos = calcRadians(NSFtotal);
  float NASApos = calcRadians(NASAtotal);
  
  float startPos = radians(270);
    
  pushMatrix();
  
  translate(width/2, height/2);
    
  rotate(startPos);  
    
  fill(255,0,0);
  arc(0, 0, 400, 400, 0, NSFpos);
  
  rotate(NSFpos);
  
  fill(255);
  arc(0, 0, 400, 400, 0, NASApos);
  
  popMatrix();
}

void processData() {
  for(int i=0; i<rawData.length; i++) {
     String[] thisRow = split(rawData[i], ",");
     
     if(thisRow[2].contains("NSF")) {
       NSFtotal += float(thisRow[1]); 
     } else if(thisRow[2].contains("NASA")) {
       NASAtotal += float(thisRow[1]); 
     } else {
       println("ERROR " + i); 
     }
  }
  println(NSFtotal);
  println(NASAtotal);
  println("DONE");
}

float calcRadians(float f) {
  // f = x% of grandTotal
  float percentage = (f / (NSFtotal + NASAtotal)) * 100;
  float arcPercent = (percentage/100) * 360;
  float arcRadians = radians(arcPercent);
  return arcRadians;
}
