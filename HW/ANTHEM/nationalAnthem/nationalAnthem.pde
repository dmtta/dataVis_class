//       _   __      __  _                   __   ___          __  __                 
//      / | / /___ _/ /_(_)___  ____  ____ _/ /  /   |  ____  / /_/ /_  ___  ____ ___ 
//     /  |/ / __ `/ __/ / __ \/ __ \/ __ `/ /  / /| | / __ \/ __/ __ \/ _ \/ __ `__ \
//    / /|  / /_/ / /_/ / /_/ / / / / /_/ / /  / ___ |/ / / / /_/ / / /  __/ / / / / /
//   /_/ |_/\__,_/\__/_/\____/_/ /_/\__,_/_/  /_/  |_/_/ /_/\__/_/ /_/\___/_/ /_/ /_/ 
//
//       .A Data Visualization by Daniel Mastretta Jimenez. Parsons the new School for Design 2014
//       MADE AND TESTED WITH PROCESSING rev 2.1.1
//


ArrayList<Concept> lyrics;   // Define an ArrayList

void setup(){
  
  lyrics = new ArrayList<Concept>();                      // make a name for the ArrayList of 'Concepts'
  String[] rawData = loadStrings("anthemTable.tsv");      // load the Anthem file
  parseData(rawData);                                     // run the Parsing function
  
}

void draw(){
  
}

void parseData(String[] myTable){ // this is the function that parses the information into the objects
 
 for (int i=1; i<myTable.length; i++){               // Runs from the second line of the table to the end
   String[] thisRow = split(myTable[i], "\t");       // Splits the table into Rows
   String tempWords = thisRow[0];                    // Select the elements in columns and store them as temporary varibales
   int tempColor = parseInt(thisRow[1]);
   String tempTranslation = thisRow[2];
   Concept tempConcept = new Concept(tempWords,tempColor,tempTranslation);    // Create a new object of the type Concept
   lyrics.add(tempConcept);                                                   // Adds the information into the lyrics ArrayList
                                                                           
 }
 
}
