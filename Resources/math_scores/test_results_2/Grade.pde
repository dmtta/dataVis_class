class Grade {

  int level;
  int[] years = {
    2006, 2007, 2008, 2009, 2010, 2011, 2012
  };
  int[] scores = new int[7];
  PVector[] pos = new PVector[7];
  int min, max;

  Grade() {
  } 

  void display() {
    if (currLevel == level) {
      text(overallMin, xSpacer - 50, height - ySpacer);
      text(overallMax, xSpacer - 50, ySpacer);

      fill(255);
      stroke(255);

      
      for (int i=0; i<pos.length; i++) {
        if (i < pos.length-1) {
          line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
        }
        ellipse(pos[i].x, pos[i].y, 10, 10);
      }
    }  
  }


  void setMinMax() {
    min = min(scores);
    max = max(scores);
  }

  void setValues() {
    float graphHeight = (height - ySpacer) - ySpacer;

    for (int i=0; i<scores.length; i++) {
      float adjVal = map(scores[i], overallMin, overallMax, 0, graphHeight);
      pos[i] = new PVector();
      pos[i].y = (height - ySpacer) - adjVal;
      pos[i].x = xSpacer * (i+1);
    }
  }
}

