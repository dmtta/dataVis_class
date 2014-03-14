// Data Visualization . Parsons D+T
// D.Mastretta, March 2014
// APIS Project
// Data extracted from Twitter's API by request. Latest tweets will be pulled.
// Credentials are removed from the file for security, to use get TEMBOO TWITTER CREDENTIALS.
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
String newSearch;
int tweetYPos;
TembooSession session; // Included in the Temboo Library, creates a TembooSession object.

void setup() {

  size(1800, 800);
  creds = loadStrings("creds.csv");
  println(creds[0]);
  newSearch = "Mexico ";
  font = loadFont("Nove.vlw");
  textFont(font);
  myQuery = new ArrayList<String>();
  followers = new ArrayList<Integer>();
  tweetYPos = 50;
  session = new TembooSession(creds[0],creds[1],creds[2]); //Temboo's way of asking for my credentials.
  runTweetsChoreo(); // Shit Temboo Does
  getTweets();
  background(0);
}

void runTweetsChoreo() {
 
  Tweets tweetsChoreo = new Tweets(session);  // Create the Choreo object using your Temboo session
  tweetsChoreo.setCredential(creds[3]);  // Set credential
  tweetsChoreo.setQuery(newSearch);   // Set inputs
  TweetsResultSet tweetsResults = tweetsChoreo.run();   // Run the Choreo and store the results
  searchResults = parseJSONObject(tweetsResults.getResponse());
  
}

void getTweets() {

  statuses = searchResults.getJSONArray("statuses"); // Create a JSON array of the Twitter statuses in the object

  for (int i=0; i<statuses.size();i++) {
    JSONObject tweet = statuses.getJSONObject(i); // Grab the first tweet and put it in a JSON object
    JSONObject user = tweet.getJSONObject("user"); // Grab the user name from the json object of the first tweet and grab the "user" 
    //      println ("NUEVO: " + tweet);
    int influence = user.getInt("followers_count");
    String screen_name = user.getString("screen_name");
    String tweetText = tweet.getString("text"); // Pull the tweet text from tweet JSON object
    String tweetLine = ("@"+ screen_name + " : " + tweetText);
    myQuery.add(tweetLine);
    followers.add(influence);
  }
}

void draw() {
  fill(255);
  rect (20,5,1500,20);
    fill(0);
   text(" Latest Tweets pulled from the search: " + newSearch + " // Blue: Very Influential // Green: Influential // Red: Not Influential.", 20,20);
  
  for (int i=0; i<myQuery.size();i++) {

      if (followers.get(i) <= 200 ){
        fill(200, 50, 50);
      } else if (followers.get(i) <= 2000){
        fill(255);
      } else if (followers.get(i) <= 10000){
        fill(#4896FF);
      } else {
        fill(#2CF700);
      }
      
      text(myQuery.get(i), 20, tweetYPos);
      tweetYPos += 30;
    }
  }

