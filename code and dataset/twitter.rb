require "rubygems"
require "twitter"

# Get current year
time = Time.new
YEAR = time.year

# Define Active Period
PERIOD = 31

# Create file for writing info to 
pFile = File.new("twitter_dataset.csv", "a")

Twitter.configure do |config|
  config.consumer_key ="qW1qVVBo5z93rdago5PI7Q"
  config.consumer_secret = "xkEImuRh3WhOrp6q2cmirOKM2jdeTsl7nXZWvTtqI"
  config.oauth_token = "783801600-sQiavEawypG08bo8Qk63LlxG0adVuYuO2iDFChTX"
  config.oauth_token_secret = "OjzseHQ7hMtHovPhSGbTlgtBAKACvcrZuYONDQBLpw"
end

# Header
puts "@#{ARGV[0]}'s Follower Information:"

Twitter.follower_ids(ARGV[0]).ids[0..50].each{|a|

  # Time Since Last 5 Tweets
  tweet_time_since_1 = 0 # Last Tweet
  tweet_time_since_2 = 0
  tweet_time_since_3 = 0
  tweet_time_since_4 = 0
  tweet_time_since_5 = 0

  begin
    # Counter
    counter = 1
  
    # User
    user = Twitter.user(a)
    
    # Print Screen Name
    puts "Screen Name : " + user.screen_name.to_s + " (" + user.id.to_s + ")"
    
    # 1 Print Twitter Age
    twitter_age = user.created_at.year
    puts "User since      : " + twitter_age.to_s + " [#{YEAR - twitter_age} year(s)]"
    
    # 2 Print Number of Followers
    followers = user.followers_count
    puts "Followers       : " + followers.to_s
    
    # 3 Print Number of Friends
    friends = user.friends_count 
    puts "Friends         : " + friends.to_s

    # 4 Print Number of Tweets
    tweet_count = user.statuses_count
    puts "Tweet Count     : " + tweet_count.to_s    
 
    # 5 Print Number of Tweets User has Favorited
    favourites_count = user.favourites_count
    puts "Favourite Count : " + favourites_count.to_s    
 
    # 6 Print Number of Lists Author Appears On
    listed_count = user.listed_count
    puts "Listed Count    : " + listed_count.to_s
    
    # 7 Last Five Tweet Timings
    puts "Last 5 Tweets at:"
    bool = false
    Twitter.user_timeline(user, :count => 5).each do |tweet|
      time_since = tweet.created_at
      bool = true
      tweet_text = tweet.text
          
      # Calculate Date Since Last Tweet
      time_since_day = time_since.day
      time_since_month = time_since.month
      time_since_year = time_since.year
      days_since1 = (365 * time_since_year + time_since_year/4 - time_since_year/100 + time_since_year/400 + time_since_day + (153 * time_since_month + 8)/5)
      days_since2 = (365 * time.year + time.year/4 - time.year/100 + time.year/400 + time.day + (153 * time.month + 8)/5)
      
      puts "#{time_since} [#{days_since2 - days_since1} day(s)]"
      puts tweet_text
      
      case counter
        when 1
          tweet_time_since_1 = days_since2 - days_since1
        when 2
          tweet_time_since_2 = days_since2 - days_since1
        when 3  
          tweet_time_since_3 = days_since2 - days_since1
        when 4 
          tweet_time_since_4 = days_since2 - days_since1
        when 5
          tweet_time_since_5 = days_since2 - days_since1
      end
      
      counter += 1
    
    end  
  end
  
  # Inactive
  if(bool == false)
    pFile.syswrite("2,#{YEAR - twitter_age},#{followers},#{friends},#{tweet_count},#{favourites_count},#{listed_count},#{tweet_time_since_1}\r\n")
    puts "Status: INACTIVE"
  # Active
  elsif(PERIOD > tweet_time_since_1)
    pFile.syswrite("1,#{YEAR - twitter_age},#{followers},#{friends},#{tweet_count},#{favourites_count},#{listed_count},#{tweet_time_since_1}\r\n") 
    puts "Status: ACTIVE"
  # Inactive
  else                                                        
    pFile.syswrite("2,#{YEAR - twitter_age},#{followers},#{friends},#{tweet_count},#{favourites_count},#{listed_count},#{tweet_time_since_1}\r\n")
    puts "Status: INACTIVE"
  end
  
  puts "-----------------------------------------------------------------------------" 
  
  sleep 5  
}

pFile.close


