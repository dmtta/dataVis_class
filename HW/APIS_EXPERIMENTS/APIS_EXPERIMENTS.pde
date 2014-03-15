// Data Visualization . Parsons D+T
// D.Mastretta, March 2014
// APIS Project
// Data extracted from Twitter's API by request. Latest tweets will be pulled.
// Credentials are removed from the file for security, to use get TEMBOO TWITTER CREDENTIALS HERE: https://temboo.com/library/Library/Twitter/
// The program fetches tweets, divides them by influential and non influential users 
// by using RED for people with less than 200 followers, Green for people over 2000 followers and white for users in between.


import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;

String searchText; 
String[] creds; // String Array that fetched my CSV credentials
JSONObject searchResults;
JSONArray statuses;
ArrayList<String> myQuery; 
ArrayList<Integer> followers;
PFont font;
PFont bigFont;
String newSearch;

TembooSession session; // Included in the Temboo Library, creates a TembooSession object.
int start;//keeps track of time only when we update, not continuously

void setup() {

  size(1200, 800);
  colorMode(HSB);
  creds = loadStrings("creds.csv");
  newSearch = "";
  font = loadFont("Nove.vlw");
  bigFont = loadFont("CourierBig.vlw");
  textFont(font);
  start = millis();//update the 'stop-watch'
  myQuery = new ArrayList<String>();
  followers = new ArrayList<Integer>();

  session = new TembooSession(creds[0], creds[1], creds[2]); //Temboo's way of asking for my credentials.
}

void runTweetsChoreo() {

  Tweets tweetsChoreo = new Tweets(session);  // Create the Choreo object using your Temboo session
  tweetsChoreo.setCredential(creds[3]);  // Set credential
  tweetsChoreo.setCount("25");
  tweetsChoreo.setQuery(newSearch);   // Set inputs
  TweetsResultSet tweetsResults = tweetsChoreo.run();   // Run the Choreo and store the results
  searchResults = parseJSONObject(tweetsResults.getResponse());
  getTweets();
}

void getTweets() {

  statuses = searchResults.getJSONArray("statuses"); // Create a JSON array of the Twitter statuses in the object

  for (int i=0; i<statuses.size();i++) {
    
    JSONObject tweet = statuses.getJSONObject(i); // Grab the first tweet and put it in a JSON object
    JSONObject user = tweet.getJSONObject("user"); // Grab the user name from the json object of the first tweet and grab the "user" 
    //println ("NUEVO: " + tweet);
    int influence = user.getInt("followers_count");
    String screen_name = user.getString("screen_name");
    String tweetText = tweet.getString("text"); // Pull the tweet text from tweet JSON object
    tweetText = tweetText.replaceAll("[\r\n]+", " ");
    String tweetLine = ("@"+ screen_name + " : " + tweetText);
    myQuery.add(tweetLine);

    followers.add(influence);
  }
}

void draw() {
  background(0);
  if (myQuery.size() == 0) {
    fill(255);
    rect(100,360,700,3);
    rect(100,490,700,3);
    textFont(bigFont);
    text("Data Visualization: API Twitter Demo.", 100, height/2-50);
    text("Latest Tweets Influence Check\nType your search and press ENTER: \n\nSearch: "+ newSearch + "_", 100, height/2);
    textFont(font);
  }
  else
  {
    drawTweets();
  }
}


void keyPressed() {
    if (keyCode == ENTER) {
      runTweetsChoreo();
    }else if (keyCode == BACKSPACE){
      newSearch = newSearch.substring(0,newSearch.length()-1);
}else{
      newSearch += key;
    }
  }


void drawTweets() {
  fill(255);
  rect (20, 5, width-40, 25);
  fill(0);
  text(" Latest 25 Tweets pulled from the search: " + newSearch + " // Influence is displayed by the brightness of the text", 20, 22);
  int tweetYPos = 50 ;
  for (int i=0; i<myQuery.size();i++) {
    float textColor = map(followers.get(i), 0, 5000, 50, 255);
    fill(10,textColor,255);
    text(myQuery.get(i), 20, tweetYPos);
    fill(100);
    text("---------------------------------------------------------------------------------------------------------------------------------------------------------------------", 20, tweetYPos + 15);
    tweetYPos += 30;
   
  }
}

