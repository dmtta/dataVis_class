String filename ="olympic_medals.csv";
String[] rawData;
Country[] allCountries;

void setup() {
  size (800,600);
  rawData = loadStrings(filename);
  allCountries = new Country[rawData.length-1];

  for (int i=1; i<rawData.length; i++) {
    String[] thisRow = rawData[i].split(",");
    Country c = new Country();
    c.name = thisRow[0];
    c.gold = int(thisRow[1]);
    c.silver = int(thisRow[2]);
    c.bronze = int(thisRow[3]);
    c.total = c.gold + c.silver + c.bronze;
    allCountries[i-1] = c;
  }

  //  for(Country c : allCountries){ // For loop to do just one thing, research into this soon Daniel 
  //    println(c.name);
  //  }
}

void draw() {
  //BarGraph
  float vertOffset = height/allCountries.length;
  
  for (int i=0; i<allCountries.length; i++){
  Country c = allCountries[i];
  rect(0, vertOffset*i, c.total*50, vertOffset);
  }
  
}

