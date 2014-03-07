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
  
  float startPos = radians(55);
  println(startPos);
    
  pushMatrix();
  translate(width/2, height/2); 
  rotate(startPos);  
  fill(255,0,0);
  arc(0, 0, 400, 400, 0, NSFpos);
  rotate(NSFpos);
  fill(255);
  arc(0, 0, 400, 400, 0, NASApos); 
  
  rotate(NASApos);
  rotate(TWO_PI - startPos);
  
  float mouseAngle = atan2(mouseY-height/2, mouseX-width/2);
  if(mouseAngle < 0) {
    mouseAngle = TWO_PI - abs(mouseAngle); 
  }
  
  fill(100, 70);
  arc(0, 0, 100, 100, 0, mouseAngle);
  
  popMatrix();
  
  
  textSize(20);
  float start = startPos - NASApos;
  float end   = start + NASApos;
  
  if(mouseAngle > start && mouseAngle < end) {
    fill(255);
    text("NASA", 25, 25); 
    fill(0);
    text("NSF", 100, 25);
  } else {
    fill(0);
    text("NASA", 25, 25); 
    fill(255);
    text("NSF", 100, 25);
  }
  println(NSFpos + " : " + NASApos + " : " + mouseAngle);
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
//  println(NSFtotal);
//  println(NASAtotal);
//  println("DONE");
}

float calcRadians(float f) {
  // f = x% of grandTotal
  float percentage = (f / (NSFtotal + NASAtotal)) * 100;
  float arcPercent = (percentage/100) * 360;
  float arcRadians = radians(arcPercent);
  return arcRadians;
}
