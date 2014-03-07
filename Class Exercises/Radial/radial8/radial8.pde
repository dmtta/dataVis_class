// simple pie chart with real data
// + finding mousePos for interaction with radians
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
  
  float startPos = radians(35);
  float currPos = startPos;
  
  pushMatrix();
  translate(width/2, height/2);
  
  rotate(currPos);
  
  fill(255,0,0);
  arc(0, 0, 400, 400, 0, NSFpos);
  currPos = NSFpos;
  
  rotate(currPos);
  fill(255);
  arc(0, 0, 450, 450, 0, NASApos);
  
  float mouseAngle = atan2(mouseY-height/2, mouseX-width/2) - NASApos;
  if(mouseAngle < 0) {
    mouseAngle = TWO_PI - abs(mouseAngle); 
  }
  fill(100, 70);
  //float mouseRadius = dist(0, 0, mouseY-height/2, mouseX-width/2)*2;
  arc(0, 0, 100, 100, 0, mouseAngle);


  popMatrix();
  
  
  textSize(20);
  if(mouseAngle > 0 && mouseAngle < NASApos) {
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

void checkMousePos(float angle, String s) {
  fill(0);
  
}
