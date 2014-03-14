import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;

String searchText;
String[] creds;
JSONObject searchResults;
JSONArray statuses;
ArrayList<String> myQuery;
ArrayList<Integer> retweet;
PFont font;
String newSearch;
int tweetYPos;
TembooSession session;

void setup() {
  // Run the Tweets Choreo function
  size(1800, 800);
  creds = loadStrings("creds.csv");
  println(creds[0]);
  newSearch = "RT please";
  font = loadFont("Nove.vlw");
  textFont(font);
  myQuery = new ArrayList<String>();
  retweet = new ArrayList<Integer>();
  tweetYPos = 50;
  session = new TembooSession(creds[0],creds[1],creds[2]);
  runTweetsChoreo();
  getTweets();
  background(0);
}

void runTweetsChoreo() {
  // Create the Choreo object using your Temboo session
  Tweets tweetsChoreo = new Tweets(session);

  // Set credential
  tweetsChoreo.setCredential(creds[3]);

  // Set inputs
  tweetsChoreo.setQuery(newSearch);

  // Run the Choreo and store the results
  TweetsResultSet tweetsResults = tweetsChoreo.run();

  searchResults = parseJSONObject(tweetsResults.getResponse());

  // Print results
  //  println(tweetsResults.getRemaining());
  //  println(tweetsResults.getReset());
  //  println(tweetsResults.getResponse());
  //  println(tweetsResults.getLimit());
}

void getTweets() {

  statuses = searchResults.getJSONArray("statuses"); // Create a JSON array of the Twitter statuses in the object

  for (int i=0; i<statuses.size();i++) {
    JSONObject tweet = statuses.getJSONObject(i); // Grab the first tweet and put it in a JSON object
    JSONObject user = tweet.getJSONObject("user"); // Grab the user name from the json object of the first tweet and grab the "user" 
    //      println ("NUEVO: " + tweet);
    int RTs = user.getInt("followers_count");
    String screen_name = user.getString("screen_name");
    String tweetText = tweet.getString("text"); // Pull the tweet text from tweet JSON object
    String tweetLine = ("@"+ screen_name + " : " + tweetText);
    myQuery.add(tweetLine);
    retweet.add(RTs);
  }
}

void draw() {
  fill(255);
  rect (20,5,1500,20);
    fill(0);
   text(" Latest Tweets pulled from the search: " + newSearch + " // Tweets in green are considered INFLUENTIAL and tweets in red are considered NOT INFLUENTIAL.", 20,20);
  
  for (int i=0; i<myQuery.size();i++) {

      if (retweet.get(i) <= 200 ){
        fill(200, 50, 50);
      
      } else if (retweet.get(i) <= 2000){
        fill(255);
      } else {
        fill(#2CF700);
      }
        
        

      text(myQuery.get(i), 20, tweetYPos);
      tweetYPos += 30;
    }
  }

