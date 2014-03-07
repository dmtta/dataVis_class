String filename = "math_scores.csv";
String[] rawData;
int[] years = new int[7];
int[] scores = new int[7];

void setup() {
  rawData = loadStrings(filename);
  //printArray(rawData);
  for(int i=1; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    //printArray(thisRow); 
    years[i-1] = int(thisRow[1]);
    scores[i-1] = int(thisRow[2]);
  }
  
  printArray(years);
  printArray(scores);
}

void draw() {
  
}


