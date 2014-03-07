String filename = "olympic_medals.csv";
String[] rawData;
Country[] allCountries;


void setup() {
  size(800, 500);
  
  // load the comma separated values file (CSV)
  rawData = loadStrings(filename);
  
  // initialize the Country array
  allCountries = new Country[rawData.length-1];
  
  // for each row in the CSV, create a Country object
  // and populate its variables with data from the file
  for(int i=1; i<rawData.length; i++) {
    String[] thisRow = rawData[i].split(",");
    
    Country c = new Country();
    c.name = thisRow[0];
    c.gold = int(thisRow[1]);
    c.silver = int(thisRow[2]);
    c.bronze = int(thisRow[3]);
    c.total = c.gold + c.silver + c.bronze;
    
    // add the Country to the array
    // offset by one since we have the header row in there
    allCountries[i-1] = c;
  }
  
  // just to check we have them all
  // this is a shortcut for iterating through an array
  for(Country c : allCountries) {
    //println(c.name); 
  }
  
}

void draw() {
  // bar graph
//  float vertOffset = height/allCountries.length;
//  
//  for(int i=0; i<allCountries.length; i++) {
//     Country c = allCountries[i];
//     rect(0, vertOffset * i, c.total * 50, vertOffset);
//     println( vertOffset * i );
//  }
  
  // circle area graph
  for(int i=0; i<allCountries.length; i++) {
    // when drawing circles, area is being visualized
    // the value we want to visualize is the total medals
    // so total medals = area
    // area = PI * diameter
    // total = PI * diameter
    // diamter = total/PI
    float diameter = allCountries[i].total / PI;
    
    // these will be small numbers so we need to make them bigger
    int multiplier = 100;
    
    ellipse(width/2, height/2, diameter * multiplier, diameter * multiplier);
  }
}
