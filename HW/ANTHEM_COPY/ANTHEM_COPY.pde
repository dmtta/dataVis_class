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
//


ArrayList<Concept> lyrics;                                // Define an ArrayList of concepts, this will be the lyrics.
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
  lyrics = new ArrayList<Concept>();                      // make a name for the ArrayList of 'Concepts'
  String[] rawData = loadStrings("anthemTable.tsv");      // load the Anthem file
  parseData(rawData);        // run the Parsing function
  setAllPositions();
}

void draw() {
  //title
  background(#000000);
  float texCol = 30;
  float textX = texCol;
  float textY = 123;
  int stanzas = 0;
  textAlign(LEFT, BOTTOM);
  textFont(Novecento);
  fill(#FFFFFF);
  text("Anthem", 30, 95);

  //GUI
  textFont(Courier);
  textAlign(LEFT, TOP);
  fill(#FFFFFF);
  textFont(GUI);
  text ("Depicted here is a graphical\nrepresentation of a real \nNational Anthem.\n\n\nThe country this anthem is from\nforbids the partial or full \npublication of it's lyrics anywhere\noutside of official events.\n\n\nWhat narrative can be read from\nthe concept behind it's words?", 990, 445);

  for(Concept c : lyrics){
    c.display();  
  }
  
}

void setAllPositions() {
  
  float texCol = 30;
  float textX = texCol;
  float textY = 123;
  int stanzas = 0;

  for (int i=0; i<lyrics.size();  i++) {

    Concept c = lyrics.get(i);

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
    c.setPosAndSize(textX, textY, textWidth(txt), textHeight);
    txt = txt+" ";
    textX = (textX + (textWidth(txt)));

    if (lineBreak == true) {
      textX = texCol;
      textY = textY + 20;

      // No need to set the lineBreak back to false;
      // It is created as false in every loop iteration
    }

    if (verseBreak == true) {

      // Leaves a blank line...
      textY = textY + 20;

      //Increase stanzas
      stanzas++;

      //Have we reached 3 stanzas in this column? If so...
      if (stanzas%3 == 0) {
        texCol += 320;  //Jump to next column on x
        textY = 55;     //Reset y
      }      

      textX = texCol;   //Set (next) x to column
    }
  }
}




void parseData(String[] myTable) {                    // this is the function that parses the information into the objects

  for (int i=1; i<myTable.length; i++) {              // Runs from the second line of the table to the end (The first line is the descriptions row on the table)
    String[] thisRow = split(myTable[i], "\t");       // Splits the table into Rows, when you split a table you use \t
    String tempWords = thisRow[0];                    // Select the elements in columns and store them as temporary varibales
    int tempColor = parseInt(thisRow[1]);
    String tempTranslation = thisRow[2];
    Concept tempConcept = new Concept(tempWords, tempColor, tempTranslation);   // Create a new object of the type Concept
    lyrics.add(tempConcept);                                                   // Adds the information into the lyrics ArrayList
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
  
//  myScale = 48 - parseFloat(key);
//  println(myScale);
//  PVector thisPos = new PVector(320, 20);
//  thisPos.mult(myScale);
//  println(thisPos);
    if (keyCode == ENTER) {
    }
}
