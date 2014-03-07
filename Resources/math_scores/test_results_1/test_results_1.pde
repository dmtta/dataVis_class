// Line graph of NYC education data
// using Processing v2.1
// source: https://nycopendata.socrata.com/Education/Math-Test-Results-2006-2012-Citywide-SWD/ufu7-zp25?

String filename = "test_results.csv";
String[] rawData;
ArrayList<Grade> allGrades = new ArrayList<Grade>();
int[] mins = new int[6];
int[] maxs = new int[6];
int overallMin, overallMax;


void setup() {
  size(800, 500);
  smooth();

  rawData = loadStrings(filename);
  //printArray(rawData);
  processData();
}

void draw() {
  background(40);

}


void processData() {
  // create objects for grade levels
  for (int i=1; i<rawData.length; i+=7) {
    Grade g = new Grade();
    String[] firstRow = split(rawData[i], ",");
    //printArray(splitData);
    g.level = int(firstRow[0]);
    for (int j=0; j<7; j++) {
      String[] splitRow = split(rawData[i+j], ",");
      g.scores[j] = int(splitRow[2]);
    }
    g.setMinMax();
    allGrades.add(g);
  }

  for (int i=0; i<6; i++) {
    Grade g = allGrades.get(i);
    mins[i] = g.min;
    maxs[i] = g.max;
  }

  overallMin = min(mins);
  overallMax = max(maxs);

  for (Grade g : allGrades) {
    println("Level = " + g.level);
    printArray(g.scores);
  }
}

