// Data Visualization . Parsons D+T
// D.Mastretta
// World Health Organization: Number of deaths due to HIV/AIDS by WHO Region
// Countries with no published data are considered as 0 
// publication years of data vary from 2001 to 2011

String filename = "AIDSworldCLEAN.csv";
String[] newData;
PFont font;
PFont texts;

float AMRtotal, AFRtotal, EMRtotal, EURtotal, SEARtotal, WPRtotal; // why are we using floats? 

void setup() {

  size (800, 800);
  font = loadFont("DIN.vlw");
  texts = loadFont("ARIAL.vlw");
  textAlign(CENTER, CENTER);
  newData = loadStrings(filename); // using variable because filename may change
  processData(); // function that does all the data ordering
}


void draw() {

  background(0);
  smooth();

  // calculate the % of a grand total for each slice of the pie.
  float AMRpos = calcRads(AMRtotal); // THIS GUYS CALCULATE THE POSITION THE ARC WILL START... We use those mysterious Radians....
  float EURpos = calcRads(EURtotal);
  float AFRpos = calcRads(AFRtotal);
  float SEARpos = calcRads(SEARtotal);
  float EMRpos = calcRads(EMRtotal);
  float WPRpos = calcRads(WPRtotal);
  float startPos = radians(112); // This value decides the position where the circle will start, convenient! 
  float circSize = 500;
  float totalAIDS =  AMRtotal + AFRtotal + EMRtotal + EURtotal + SEARtotal + WPRtotal;
  
  pushMatrix(); // Matrix is the whole coordinate system moving to our will, this is very useful once it's been understood. 
  
  translate(width/2, height/2.4);
    
  rotate(startPos);  
  
  fill(255,0,0);
  arc(0, 0, circSize+50, circSize+50, 0, AFRpos);
  rotate(AFRpos);
  
  fill(255);
  arc(0, 0, circSize, circSize, 0, AMRpos);
  rotate(AMRpos);
  
  fill(225);
  arc(0, 0, circSize, circSize, 0, SEARpos);
  rotate(SEARpos);
  
  fill(200);
  arc(0, 0, circSize, circSize, 0, EMRpos);
  rotate(EMRpos);
  
  fill(175);
  arc(0, 0, circSize, circSize, 0, EURpos);
  rotate(EURpos);
  
  fill(150);
  arc(0, 0, circSize, circSize, 0, WPRpos);
  rotate(WPRpos);
  
  fill(0);
  ellipse(0, 0, circSize/3,circSize/3 );
  rotate(WPRpos);
  
  popMatrix();
  
  fill(255,0,0);
 textFont(texts);
  text("Of the " +int(totalAIDS)+ " deaths by AIDS reported from 2001 to 2011, Africa's WHO Region\nreports "+int(AFRtotal)+ ", adding up more than " + int(AFRtotal/AMRtotal) + " times above the Americas, \n region which holds the second highest incidence of this syndrome in the world.", width/2, height-95);
  }


void processData() {
  for (int i=0; i<newData.length; i++) {
    String[] thisRow = split(newData[i], ","); // This command splits every row into 3 sets of data

    if (thisRow[0].contains("AMR")) {  // thisRow[0] is the one holding the WHO names (1 countries, 2 deaths) 
      AMRtotal += float(thisRow[2]);  // Adds the value in DEATH section to total by continent
    }

    else if (thisRow[0].contains("AFR")) 
    {
      AFRtotal += float(thisRow[2]);
    } 

    else if (thisRow[0].contains("EMR")) 
    {
      EMRtotal += float(thisRow[2]);
    } 

    else if (thisRow[0].contains("EUR")) 
    {
      EURtotal += float(thisRow[2]);
    } 

    else if (thisRow[0].contains("SEAR")) 
    {
      SEARtotal += float(thisRow[2]);
    } 

    else if (thisRow[0].contains("WPR")) 
    {
      WPRtotal += float(thisRow[2]);
    } 

    else {
      println("ERROR " + i);
    }

    println("-----------------------------");
    println("AMERICA = " + AMRtotal);
    println("AFRICA = " + AFRtotal);
    println("EUROPE = " + EURtotal);
    println("E.MEDITERRANEAN = " + EMRtotal);
    println("S.E. ASIA = " + SEARtotal);
    println("WESTERN PACIFIC = " + WPRtotal);
    println("-----------------------------");
  }
}

float calcRads(float f) {          ///////// THIS WHOLE SECTION OF THE CODE IS KIND OF CONFUSING.
  // f = x% of grandTotal
  float percentage = (f / (AMRtotal + AFRtotal + EMRtotal + EURtotal + SEARtotal + WPRtotal)) * 100; // This calculates percentage of the whole circle for each thing???
  float arcPercent = (percentage/100) * 360; 
  float arcRadians = radians(arcPercent); 
  return arcRadians;
}

