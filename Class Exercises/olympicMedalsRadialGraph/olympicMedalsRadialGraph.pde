String filename ="olympic_medals.csv";
String[] rawData;
Country[] allCountries;

void setup() {
  size (800, 600);
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
  // When drawing circles you are visualizing area, the value we want to visualize is the total medals number, therefore total medals should equal the area of the circle.
  // Area = PI * r^2.
  // total = PI * r^2.
  // r = sqrt(total/PI)
for(int i=0; i<allCountries.length;i++){
  Country c = allCountries[i];
  float radius = sqrt(c.total/PI);
  int mult = 100;
  fill(i*20,i*10,i*50);
  ellipse(220+i*50, height/2, radius*2*mult, radius*2*mult);
}

}
