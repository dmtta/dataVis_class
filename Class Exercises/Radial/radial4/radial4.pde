// simple pie chart with real data
// source = research.gov 

// simple pie chart with real data set
// Federal Science Funding by Agency
// Source = research.org

String filename = "awards_obliged_2013.csv";
String[] rawData;

int NSFtotal  = 0;
int NASAtotal = 0;


void setup() {
  size(500, 500); 
  rawData = loadStrings(filename);
  processData();
}

void draw() {
  
}

void processData() {
  for(int i=0; i<rawData.length; i++) {
    String[] thisRow = split(rawData[i], ",");
    // problems with commas in CSVs
    // edit the Cells in Excel 
    // 1 - copy the column and paste in another column
    // 2 - click the clipboard icon that appears and select "Values Only"
    // 3 - click the yellow warning icon that appears and select "Convert to Numbers"
    // 4 - If the $ is still there, go to Format>Cells and choose "Number" and apply
    // 4 - replace the original column with the new column and save
    printArray(thisRow); 
    
    if(thisRow[2].contains("NSF")) {
      NSFtotal += int(thisRow[1]);
    } else if(thisRow[2].contains("NASA")) {
      NASAtotal += int(thisRow[1]);
    } else {
     println("ERROR: index = " + i); 
    }
  }
  println("Data Processing Complete!");
  println("NSFtotal = " + NSFtotal);
  println("NASAtotal = " + NASAtotal);
}

//float calcRadians(float f) {
//  float arcPercent = (f/100) * 360;
//  float arcRadians = radians(arcPercent); 
//  return arcRadians;
//}
