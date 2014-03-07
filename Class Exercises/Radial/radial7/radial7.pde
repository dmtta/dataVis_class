// simple pie chart with real data
// source = research.gov 

// simple pie chart with real data set
// Federal Science Funding by Agency
// Source = research.org

String filename = "awards_obliged_2013.csv";
String[] rawData;

int NSFtotal  = 0;
int NASAtotal = 0;
float NSFpos, NASApos;


void setup() {
  size(500, 500); 
  rawData = loadStrings(filename);
  processData();
}

void draw() {
  background(40);
  noStroke();
  
  // this will work as long as you start drawing at 0
  // if not, you need to rotate
  // in general, this is the prefered method
  
  float currPos = radians(35);
  
  pushMatrix();
  translate(width/2, height/2);
  
  rotate(currPos);
  fill(255, 0, 0);
  arc(0, 0, 400, 400, 0, NSFpos);
  currPos = NSFpos;
  
  rotate(currPos);
  fill(255);
  arc(0, 0, 450, 450, 0, NASApos);
  
  popMatrix();
}

void processData() {
  for(int i=0; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    if(thisRow[2].contains("NSF")) {
      NSFtotal += int(thisRow[1]);
    } else if(thisRow[2].contains("NASA")) {
      NASAtotal += int(thisRow[1]);
    } else {
     print("ERROR: " + i + " ");
     printArray(thisRow); 
    }
  }
  
  NSFpos = calcRadians(NSFtotal);
  NASApos = calcRadians(NASAtotal);

}

float calcRadians(float f) {
  // f = x% of grandTotal
  // x = f/grandTotal
  float percentage = (f/(NSFtotal + NASAtotal)) * 100;
  float arcDegrees = (percentage/100) * 360;
  float arcRadians = radians(arcDegrees); 
  return arcRadians;
}
