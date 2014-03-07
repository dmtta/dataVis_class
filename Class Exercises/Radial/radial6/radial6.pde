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
  
  float currPos = 0;
  
  fill(255, 0, 0);
  arc(width/2, height/2, 400, 400, currPos, NSFpos);
  currPos += NSFpos;
  
  fill(255);
  arc(width/2, height/2, 450, 450, currPos, currPos + NASApos);
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
