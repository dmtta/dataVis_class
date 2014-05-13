// This class creates the objects that will be filled with the data from the .tsv

class Concept {

String words;
color myColor;
String translation;

  PVector pos;
  PVector size;
  
 Concept(String _words, int _colorNumber, String _translation) {
   
   words = _words;
//   colorNumber = _colorNumber;
   translation = _translation;
   
   fullColors(_colorNumber);
  }
  
  void fullColors(int i) {
  
    int colorNum =parseInt(i);
  
    if (colorNum == 0) {
      myColor = color(#222222);
    } 
    else if (colorNum == 2) {
      myColor = color(#35F202);
    } 
    else if (colorNum == 1) {
      myColor = color(#FFFFFF);
    }
    else if (colorNum == 3) {
      myColor = color(#DE0004);
    }
  }  
  
  void setPosAndSize(float _posX, float _posY, float _sizeX, float _sizeY){
    pos = new PVector(_posX, _posY);
    size = new PVector(_sizeX, _sizeY);
  }
  
  Boolean isOver(){
    Boolean checkOver = false;
    if(pos.x < mouseX && mouseX < pos.x + size.x && pos.y > mouseY && mouseY > pos.y - size.y){
      checkOver = true;
    }
    return checkOver;
  }
  
  void display(){
    textFont(Courier);
    fill(myColor);
    
    if(isOver()){
      fill(255, 255, 0);
    }
    
    float posX = pos.x;
    float posY = pos.y;
    float sizeX = size.x;
    float sizeY = size.y;
    
    posX /= myScale;
    posY /= myScale;
    sizeX /= myScale;
    sizeY /= myScale;
//     currPos.div(myScale);
//     currSize.div(myScale);
    
    float spacing = 2/myScale;
    
    rect(posX - spacing, posY, sizeX + 2*spacing, -sizeY); // Prints the Rectangles

    fill(0);
    words = words + " ";                        // adds one space to the words.
    textAlign(LEFT, BOTTOM);
    textSize(12/myScale);
    text(words, posX, posY);              // Prints the words
  }
}
