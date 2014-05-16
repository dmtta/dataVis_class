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


ArrayList<Concept> mexico;                                // Define an ArrayList of concepts.
ArrayList<Concept> usa;
ArrayList<Concept> brazil;
ArrayList<Concept> france;
PFont Courier;
PFont ACaslon32;
PFont ACaslon24;
PFont GUI;
int textHeight;
float myScale;

int selectedMeaning;



void setup() {

  size(1280, 720);
  
  selectedMeaning = -1;
  
  myScale = 2.2;
  
  Courier = loadFont("Courier12.vlw");
  ACaslon24 = loadFont("ACaslon24.vlw");
  ACaslon32 = loadFont("ACaslon32.vlw");
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
  background(#050505);

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
  
  textAlign(LEFT, TOP);
  textFont(ACaslon32);
  fill(#FFFFFF);
  text("National\nAnthems", 30, 30);
  
  textFont(ACaslon24);
  text("Mexico", 294, 30);
  rect(294,55,580,1);
  text("USA", 944, 30);
  rect(944,55,300,1);
  text("Brazil", 294, 380);
  rect(294,405,580,1);
  text("France", 944, 380);
   rect(944,405,300,1);
  
  textFont(Courier);
  textAlign(LEFT, TOP);
  fill(#FFFFFF);
  textFont(GUI);
  text ("Depicted here are the lyrics\nof four Official National Anthems.\n\n\nAnthems carry narratives that\ncan be inferred and read\nby analyzing in detail the intention\nof the words written in them.\n\n\nWhat national narratives can be seen by\nthe concept behind their words?\n\n\n What differences and similarities\nlie within the songs that represent\neach of the countries?\n\n\nScroll over any word to separate\neach topic and reveal\nwhat every hymn is talking about.", 30, 150);

 
}

void setAllPositions() {
  
  float originX = 650;
  float originY = 150;
  float lineSpace = 19;
 
  
  float texColMex = originX;
  float textXMex = texColMex;
  float textYMex = originY;
  int stanzasMex = 0;

  float texColUSA = width+originX+150;
  float textXUSA = texColUSA;
  float textYUSA = originY;
  int stanzasUSA = 0;
  
  float texColBRA =originX;
  float textXBRA = texColBRA;
  float textYBRA = height+originY+50;
  int stanzasBRA = 0;
  
  float texColFRA =width+originX+150;
  float textXFRA = texColFRA;
  float textYFRA = height+originY+50;
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
      textYMex = textYMex + lineSpace;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYMex = textYMex + lineSpace;

      //Increase stanzasMex
      stanzasMex++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasMex%3 == 0) {
        texColMex += 320;  //Jump to next column on x
        textYMex = originY;     //Reset y
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
      textYUSA = textYUSA + lineSpace;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYUSA = textYUSA + lineSpace;

      //Increase stanzasMex
      stanzasUSA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasUSA%4 == 0) {
        texColUSA += 540;  //Jump to next column on x
        textYUSA = originY;     //Reset y
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
      textYBRA = textYBRA + lineSpace;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYBRA = textYBRA + lineSpace;

      //Increase stanzasMex
      stanzasBRA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasBRA%6 == 0) {
        texColBRA += 330;  //Jump to next column on x
        textYBRA = height+originY+50;     //Reset y
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
      textYFRA = textYFRA + lineSpace;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textYFRA = textYFRA + lineSpace;

      //Increase stanzasMex
      stanzasFRA++;

      //Have we reached 3 stanzasMex in this column? If so...
      if (stanzasFRA%4 == 0) {
        texColFRA += 330;  //Jump to next column on x
        textYFRA = height+originY+50;     //Reset y
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

void mousePressed(){
  Boolean somethingSelected = false;
  for(Concept c : mexico){
    if(c.isOver()){
        selectedMeaning = c.meaning;
        println(selectedMeaning);
        somethingSelected = true;      
    }  
  }
  for(Concept c : usa){
    if(c.isOver()){
        selectedMeaning = c.meaning;
        println(selectedMeaning);
        somethingSelected = true;      
    }  
  }
  for(Concept c : brazil){
    if(c.isOver()){
        selectedMeaning = c.meaning;
        println(selectedMeaning);
        somethingSelected = true;      
    }  
  }
   for(Concept c : france){
    if(c.isOver()){
        selectedMeaning = c.meaning;
        println(selectedMeaning);
        somethingSelected = true;      
    }  
  }
  if(!somethingSelected){
    selectedMeaning = -1;
  }
}

void keyPressed() {
  println(key);
  if(key == '1' ){
//    println("hey" );
    myScale = 1;
  }else if(key == '2' ){
    myScale = 2.2;
  }else if(key == '3' ){
    myScale = 3;
  }
    if (keyCode == ENTER) {
    }
}
