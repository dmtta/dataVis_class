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
int textHeight;

void setup() {

  size(1280, 720);
  Courier = loadFont("Courier12.vlw");
  Novecento = loadFont("Novecento.vlw");
  textHeight = 15; 
  noStroke();
  lyrics = new ArrayList<Concept>();                      // make a name for the ArrayList of 'Concepts'
  String[] rawData = loadStrings("anthemTable.tsv");      // load the Anthem file
  parseData(rawData);                                     // run the Parsing function
}

void draw() {

  background(#000000);
  float texCol = 30;
  float textX = texCol;
  float textY = 70;
  int stanzas = 0;
  textAlign(LEFT, BOTTOM);
  textFont(Novecento);
  fill(#000000);
  text("NATIONAL ANTHEM", 30, 50);

  for (int i=0; i<lyrics.size();  i++) {

    fullColors(i);

    textFont(Courier);
    textAlign(LEFT, BOTTOM);
    text ("The following is a graphical\nrepresentation of a national anthem.\n\nThe country this anthem is from\nforbids the partial or full \npublication of it's lyrics anywhere\noutside of official events.", 990, 550);

    String txt = lyrics.get(i).words; // Creates a new String that adds the text and needed space, makes rest of code easier
    String trans = lyrics.get(i).translation;
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

    if (mouseX > textX && mouseX < textX+textWidth(txt)&& mouseY > textY - 12 && mouseY < textY - 12 + textHeight) { 
      int colorNum =parseInt(lyrics.get(i).colorNumber);
      textFont(Novecento);
      textAlign(CENTER, CENTER);

      if (colorNum == 3) {


        text(trans, width/2, 670);
        fill(230, 230, 0);
      } 
      else if (colorNum == 2) {

        text(trans, width/2, 670);
        fill(230, 230, 0);
      }
      else if (colorNum == 1) {


        text(trans, width/2, 670);
        fill(230, 230, 0);
      }
    }

    textFont(Courier);
    rect(textX, textY-12, textWidth(txt), textHeight); // Prints the Rectangles
    txt = txt+" ";                        // adds one space to the words.
    textAlign(LEFT, BOTTOM);
    text(txt, textX, textY);              // Prints the words
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
        textY = 70;     //Reset y
      }      

      textX = texCol;   //Set (next) x to column
    }
  }
}



void parseData(String[] myTable) {                    // this is the function that parses the information into the objects

  for (int i=1; i<myTable.length; i++) {              // Runs from the second line of the table to the end (The first line is the descriptions row on the table)
    String[] thisRow = split(myTable[i], "\t");       // Splits the table into Rows
    String tempWords = thisRow[0];                    // Select the elements in columns and store them as temporary varibales
    int tempColor = parseInt(thisRow[1]);
    String tempTranslation = thisRow[2];
    Concept tempConcept = new Concept(tempWords, tempColor, tempTranslation);   // Create a new object of the type Concept
    lyrics.add(tempConcept);                                                   // Adds the information into the lyrics ArrayList
  }
}

void fullColors(int i) {

  int colorNum =parseInt(lyrics.get(i).colorNumber);

  if (colorNum == 0) {
    fill(#222222);
  } 
  else if (colorNum == 1) {
    fill(#35F202);
  } 
  else if (colorNum == 2) {
    fill(#FFFFFF);
  }
  else if (colorNum == 3) {
    fill(#DE0004);
  }
}

