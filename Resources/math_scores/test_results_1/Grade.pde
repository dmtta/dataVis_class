class Grade {

  int level;
  int[] years = {
    2006, 2007, 2008, 2009, 2010, 2011, 2012
  };
  int[] scores = new int[7];
  int min, max;

  Grade() {
  } 


  void setMinMax() {
    min = min(scores);
    max = max(scores);
  }

}

