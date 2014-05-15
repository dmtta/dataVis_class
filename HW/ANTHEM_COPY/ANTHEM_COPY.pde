//
//        _   __      __  _                   __   ___          __  __                 
//       / | / /___ _/ /_(_)___  ____  ____ _/ /  /   |  ____  / /_/ /_  ___  ____ ___ 
//      /  |/ / __ `/ __/ / __ \/ __ \/ __ `/ /  / /| | / __ \/ __/ __ \/ _ \/ __ `__ \
//     / /|  / /_/ / /_/ / /_/ / / / / /_/ / /  / ___ |/ / / / /_/ / / /  __/ / / / / /
//    /_/ |_/\__,_/\__/_/\____/_/ /_/\__,_/_/  /_/  |_/_/ /_/\__/_/ /_/\___/_/ /_/ /_/ 
//   --------------------------------------   ---------------------------------------
//  --------------------------------------   ---------------------------------------
//
//                                         A Data Visualization Project by Daniel Mastretta Jimenez. 
//                                         Parsons the new School for Design 2014
//                                         MADE AND TESTED WITH PROCESSING rev 2.1.1
//                                         Special thanks. Gabriel Gianordoli, Namreta Kumar.
//


ArrayList<Concept> mexico;                                // Define an ArrayList of concepts, this will be the mexico.
ArrayList<Concept> usa;
ArrayList<Concept> brazil;
ArrayList<Concept> france;
PFont Courier;
PFont Novecento;
PFont GUI;
int textHeight;
float myScale;

void setup() {

  size(1280, 720);
  
  myScale = 1;
  
  Courier = loadFont("Courier12.vlw");
  Novecento = loadFont("Novecento.vlw");
  GUI = loadFont("GUI.vlw");
  textHeight = 15; 
  noStroke();
  mexico = new ArrayList<Concept>();  
  usa = new ArrayList<Concept>();
    brazil = new ArrayList<Concept>();
      france = new ArrayList<Concept>();
  // make a name for the ArrayList of 'Concepts'
  String[] rawDataMex = loadStrings("anthemMEX.tsv");      // load the Anthem file
  String[] rawDataUSA = loadStrings("anthemUSA.tsv");      // load the Anthem file
    String[] rawDataBRA = loadStrings("anthemBRA.tsv");      // load the Anthem file
String[] rawDataFRA = loadStrings("anthemFRA.tsv");      // load the Anthem file

  parseData(rawDataMex, "mexico");        // run the Parsing function
  parseData(rawDataUSA, "usa"); 
  parseData(rawDataBRA, "brazil"); 
    parseData(rawDataFRA, "france"); 
  setAllPositions();
}

void draw() {
  //title
  background(#000000);

  textFont(Courier);
  textAlign(LEFT, TOP);
  fill(#FFFFFF);
  textFont(GUI);

  for(Concept c : mexico){
    c.display();  
  }
    for(Concept c : usa){
    c.display();  
  }
  for(Concept c : brazil){
    c.display();  
  }
   for(Concept c : france){
    c.display();  
  }
}

void setAllPositions() {
  
  float texColMex = 30;
  float textXMex = texColMex;
  float textYMex = 55;
  int stanzasMex = 0;

  float texColUSA = width+30;
  float textXUSA = texColUSA;
  float textYUSA = 55;
  int stanzasUSA = 0;
  
  float texColBRA =30;
  float textXBRA = texColBRA;
  float textYBRA = height+55;
  int stanzasBRA = 0;
  
  float texColFRA =width+30;
  float textXFRA = texColFRA;
  float textYFRA = height+55;
  int stanzasFRA = 0;
//-------------------------------------------------------------------------------------------- MEXICO
  for (int i=0; i<mexico.size();  i++) {

    Concept c = mexico.get(i);

    String txt = c.words; // Creates a new String that adds the text and needed space, makes rest of code easier
    boolean lineBreak = false;
    boolean verseBreak = false;

    if (txt.indexOf("%") != -1) { // Searches each word, if the % is present then the code is executed. I used that as a line break in tables
      txt = txt.substring(0, txt.length()-1);
      lineBreak = true;
    }

    if (txt.indexOf("&") != -1) { // Searches each word, if the & is present then the code is executed. I used that as a verse break in tables
      txt = txt.substring(0, txt.length()-1);
      verseBreak = true;
    }

    c.words = txt;
    textFont(Courier);    
    c.setPosAndSize(textXMex, textYMex, textWidth(txt), textHeight);
    txt = txt+" ";
    textXMex = (textXMex + (textWidth(txt)));

    if (lineBreak == true) {
      textXMex = texColMex;
      textYMex = textYMex + 20;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYMex = textYMex + 20;

      //Increase stanzasMex
      stanzasMex++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasMex%3 == 0) {
        texColMex += 320;  //Jump to next column on x
        textYMex = 55;     //Reset y
      }      

      textXMex = texColMex;   //Set (next) x to column
    }
  }
//-------------------------------------------------------------------------------------------- USA
   for (int i=0; i<usa.size();  i++) {

    Concept c = usa.get(i);

    String txt = c.words; // Creates a new String that adds the text and needed space, makes rest of code easier
    boolean lineBreak = false;
    boolean verseBreak = false;

    if (txt.indexOf("%") != -1) { // Searches each word, if the % is present then the code is executed. I used that as a line break in tables
      txt = txt.substring(0, txt.length()-1);
      lineBreak = true;
    }

    if (txt.indexOf("&") != -1) { // Searches each word, if the & is present then the code is executed. I used that as a verse break in tables
      txt = txt.substring(0, txt.length()-1);
      verseBreak = true;
    }

    c.words = txt;
    textFont(Courier);    
    c.setPosAndSize(textXUSA, textYUSA, textWidth(txt), textHeight);
    txt = txt+" ";
    textXUSA = (textXUSA + (textWidth(txt)));

    if (lineBreak == true) {
      textXUSA = texColUSA;
      textYUSA = textYUSA + 20;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYUSA = textYUSA + 20;

      //Increase stanzasMex
      stanzasUSA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasUSA%4 == 0) {
        texColUSA += 540;  //Jump to next column on x
        textYUSA = 55;     //Reset y
      }      
  
      textXUSA = texColUSA;   //Set (next) x to column
    }
  }
//--------------------------------------------------------------------------------------- BRAZIL
  for (int i=0; i<brazil.size();  i++) {

    Concept c = brazil.get(i);

    String txt = c.words; // Creates a new String that adds the text and needed space, makes rest of code easier
    boolean lineBreak = false;
    boolean verseBreak = false;

    if (txt.indexOf("%") != -1) { // Searches each word, if the % is present then the code is executed. I used that as a line break in tables
      txt = txt.substring(0, txt.length()-1);
      lineBreak = true;
    }

    if (txt.indexOf("&") != -1) { // Searches each word, if the & is present then the code is executed. I used that as a verse break in tables
      txt = txt.substring(0, txt.length()-1);
      verseBreak = true;
    }

    c.words = txt;
    textFont(Courier);    
    c.setPosAndSize(textXBRA, textYBRA, textWidth(txt), textHeight);
    txt = txt+" ";
    textXBRA = (textXBRA + (textWidth(txt)));

    if (lineBreak == true) {
      textXBRA = texColBRA;
      textYBRA = textYBRA + 20;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYBRA = textYBRA + 20;

      //Increase stanzasMex
      stanzasBRA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasBRA%6 == 0) {
        texColBRA += 330;  //Jump to next column on x
        textYBRA = height+55;     //Reset y
      }      

      textXBRA = texColBRA;   //Set (next) x to column
    }
  }
  //--------------------------------------------------------------------------------------- FRANCE
  for (int i=0; i<france.size();  i++) {

    Concept c = france.get(i);

    String txt = c.words; // Creates a new String that adds the text and needed space, makes rest of code easier
    boolean lineBreak = false;
    boolean verseBreak = false;

    if (txt.indexOf("%") != -1) { // Searches each word, if the % is present then the code is executed. I used that as a line break in tables
      txt = txt.substring(0, txt.length()-1);
      lineBreak = true;
    }

    if (txt.indexOf("&") != -1) { // Searches each word, if the & is present then the code is executed. I used that as a verse break in tables
      txt = txt.substring(0, txt.length()-1);
      verseBreak = true;
    }

    c.words = txt;
    textFont(Courier);    
    c.setPosAndSize(textXFRA, textYFRA, textWidth(txt), textHeight);
    txt = txt+" ";
    textXFRA = (textXFRA + (textWidth(txt)));

    if (lineBreak == true) {
      textXFRA = texColFRA;
      textYFRA = textYFRA + 20;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYFRA = textYFRA + 20;

      //Increase stanzasMex
      stanzasFRA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasFRA%4 == 0) {
        texColFRA += 330;  //Jump to next column on x
        textYFRA = height+55;     //Reset y
      }      

      textXFRA = texColFRA;   //Set (next) x to column
    }
  }
}




void parseData(String[] myTable, String country) {                    // this is the function that parses the information into the objects

  for (int i=1; i<myTable.length; i++) {              // Runs from the second line of the table to the end (The first line is the descriptions row on the table)
    String[] thisRow = split(myTable[i], "\t");       // Splits the table into Rows, when you split a table you use \t
    String tempWords = thisRow[0];                    // Select the elements in columns and store them as temporary varibales
    int tempColor = parseInt(thisRow[1]);
    String tempTranslation = thisRow[2];
    Concept tempConcept = new Concept(tempWords, tempColor, tempTranslation);   // Create a new object of the type Concept
    if (country.equals("mexico")){
    mexico.add(tempConcept);                                                   // Adds the information into the mexico ArrayList
    } else if (country.equals("usa")) {
      usa.add(tempConcept);
    }else if (country.equals("brazil")) {
      brazil.add(tempConcept);
    }else if (country.equals("france")) {
      france.add(tempConcept);
    }
  }
}



void keyPressed() {
  println(key);
  if(key == '1' ){
//    println("hey" );
    myScale = 1;
  }else if(key == '2' ){
    myScale = 2;
  }else if(key == '3' ){
    myScale = 3;
  }
    if (keyCode == ENTER) {
    }
}
