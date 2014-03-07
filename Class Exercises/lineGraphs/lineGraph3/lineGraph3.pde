String filename = "math_scores.csv";
String[] rawData;
int[] years = new int[7];
int[] scores = new int[7];

int margin, graphHeight;
float xSpacer;
PVector[] positions = new PVector[7];
int overallMin, overallMax;


void setup() {
  size(800, 300);
  processData();
}

void draw() {
  background(20);
  
  drawGUI();
  
  fill(200);
  for(int i=0; i<positions.length; i++) {
    ellipse(positions[i].x, positions[i].y, 15, 15); 
  }
}


void drawGUI() {
  for(int i=0; i<positions.length; i++) {
    stroke(200, 100);
    line(positions[i].x, margin, positions[i].x, height - margin);
    text(years[i], positions[i].x - 15, height - margin + 20); 
   
    if(i > 0) {
      stroke(200);
      line(positions[i].x, positions[i].y, positions[i-1].x, positions[i-1].y); 
    }
  } 
  
  text(overallMax, 5, margin);
  text(overallMin, 5, height - margin);
  
}


void processData() {
  rawData = loadStrings(filename);
  for (int i=1; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    years[i-1] = int(thisRow[1]);
    scores[i-1] = int(thisRow[2]);
  }
  
  overallMin = min(scores);
  overallMax = max(scores);
  
  margin = 50;
  graphHeight = (height-margin) - margin;
  xSpacer = (width - margin - margin) / (years.length - 1);
  
  for(int i=0; i<scores.length; i++) {
     float adjScore = map(scores[i], overallMin, overallMax, 0, graphHeight);
     float yPos = height -margin - adjScore;
     float xPos = margin + (xSpacer * i);
     positions[i] = new PVector(xPos, yPos);
  }
}

