//       _   __      __  _                   __   ___          __  __                 
//      / | / /___ _/ /_(_)___  ____  ____ _/ /  /   |  ____  / /_/ /_  ___  ____ ___ 
//     /  |/ / __ `/ __/ / __ \/ __ \/ __ `/ /  / /| | / __ \/ __/ __ \/ _ \/ __ `__ \
//    / /|  / /_/ / /_/ / /_/ / / / / /_/ / /  / ___ |/ / / / /_/ / / /  __/ / / / / /
//   /_/ |_/\__,_/\__/_/\____/_/ /_/\__,_/_/  /_/  |_/_/ /_/\__/_/ /_/\___/_/ /_/ /_/ 
//
//                                         A Data Visualization by Daniel Mastretta Jimenez. 
//                                         Parsons the new School for Design 2014
//                                         MADE AND TESTED WITH PROCESSING rev 2.1.1
//


ArrayList<Concept> lyrics;                                // Define an ArrayList of concepts, this will be the lyrics.
PFont Courier;

void setup() {

  size(1280, 720);
  Courier = loadFont("Courier12.vlw");
  background(#FFFFFF);
  noStroke();
  lyrics = new ArrayList<Concept>();                      // make a name for the ArrayList of 'Concepts'
  String[] rawData = loadStrings("anthemTable.tsv");      // load the Anthem file
  parseData(rawData);                                     // run the Parsing function
}

void draw() {

  float textX = 30;
  float textY = 70;
  int stanzas = 0;

  for (int i=0; i<lyrics.size();  i++) {

    if (lyrics.get(i).colorNumber == 0) {
      fill(#000000);
    } 
    else if (lyrics.get(i).colorNumber == 1) {
      fill(#35F202);
    } 
    else if (lyrics.get(i).colorNumber == 2) {
      fill(#999999);
    }
else if (lyrics.get(i).colorNumber == 3) {
  fill(#DE0004);

}


textFont(Courier);
String txt = lyrics.get(i).words; // Creates a new String that adds the text and needed space, makes rest of code easier
boolean lineBreak = false;
boolean verseBreak = false;


if (txt.indexOf("%") != -1) {
  txt = txt.substring(0, txt.length()-1);
  lineBreak = true;
}
if (txt.indexOf("&") != -1) {
  txt = txt.substring(0, txt.length()-1);
  verseBreak = true;
}

rect(textX, textY-12, textWidth(txt), 15);
txt = txt+" ";
text(txt, textX, textY);              // Prints the words

textX = (textX + (textWidth(txt)));

if (lineBreak == true) {
  textX = 30;
  textY = textY + 20;
  lineBreak = false;
}
if (verseBreak == true) {
  textX = 30;
  textY = textY + 20;
  lineBreak = false;
  stanzas++;
  if (stanzas%3 == 0) {
    translate(320, 0);
    textY = 70;
  }
}
}
}



void parseData(String[] myTable) {                    // this is the function that parses the information into the objects

  for (int i=1; i<myTable.length; i++) {               // Runs from the second line of the table to the end (The first line is the descriptions row on the table)
    String[] thisRow = split(myTable[i], "\t");       // Splits the table into Rows
    String tempWords = thisRow[0];                    // Select the elements in columns and store them as temporary varibales
    int tempColor = parseInt(thisRow[1]);
    String tempTranslation = thisRow[2];
    Concept tempConcept = new Concept(tempWords, tempColor, tempTranslation);    // Create a new object of the type Concept
    lyrics.add(tempConcept);                                                   // Adds the information into the lyrics ArrayList
  }
}

