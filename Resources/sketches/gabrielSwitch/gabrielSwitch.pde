// fast Switch for transitions
// Gabriel "Son of Fry" Gianordoli 

float value = 0;
float targetValue = 0;
float speed = 0.1;

void setup(){

}

void draw(){
  background(0);
  value += (targetValue - value) * speed;
  println(value);
  float x = map(value, 0, 1, 0, width);
  ellipse(x, height/2, 20, 20);
}

void keyPressed(){
  targetValue = (targetValue == 0) ? (1) : (0); // ninja code for compressed else if magic {it does the same thing that the code under this line but cleaner)

//  if(targetValue == 0){ // nice switching technique ninja 
//    targetValue = 1;
//  }else{
//    targetValue = 0;
//  }
//  println(targetValue);

}
