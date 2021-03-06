Summary 

Data mining is the process of analyzing data from different viewpoints and summarizing it into very important and useful information for an organization. This information can be used to increase revenue as well as cuts costs.  In recent years, the data mining industry is more focused on the information overload is increasing at an alarming rate.
After much deliberation, we planned to create an algorithm where our program fetches user information from the online social networking and micro-blogging service, Twitter. Since its creation in March 2006, Twitter has exploded to over 500 million registered users as of 2012 and is a hive of knowledge waiting to be mined. Information that our collection algorithm mines includes the age of the user’s Twitter account, number of followers, number of tweets, number of friends, and the timing of the last Tweet, among other data.
We plan to use the k-means clustering algorithm to assist in data analysis. It involves the partitioning of n observations into k clusters, in which each observation belongs to the cluster with the nearest mean. We have also used a tool, Waikato Environment for Knowledge Analysis (WEKA) as a comparison for our own algorithm. It is a workbench that contains a collection of visualization tools and algorithms for data analysis and predictive modeling, together with graphical user interfaces for easy accesses to this functionality. The Cluster section of WEKA includes the simple k-means algorithm, which can be applied to various data types. The main purpose of this project is to efficiently collect data from Twitter as well as re-create the k-means algorithm such that it produces similar results, and consequently, the most valuable and useful knowledge is obtained as a result of the clustering process.


Introduction

As highlighted earlier, information available on the internet is growing at a rapid rate on a daily basis. With over 340 million Tweets per day, the massive rise of Twitter can be viewed as an analogy for the growth of information on the internet. Using the Twitter API, we can gain access to the following user information:
Age of Twitter Account: Fetches the ages of a Twitter account, using the date of its creation.
Number of Followers: Fetches the Follower count of a specified user.
Number of Friends: Fetches the Friend count of a specified user.
Number of Tweets: Fetches the Tweet count of a specified user.
Number of Favorited Tweets: Fetches the count of Tweets a specified user has favorited.
Listed Count: Fetches number of lists a specified user appears on.
Last Tweets: Fetches the last Tweets of a specified user.

Reasons for Choosing Twitter

Twitter is excellent source of information, as evidenced by over 340 million Tweets per day. It is open and a real-time communication of information among individuals and groups. Yet, under the surface, it is a treasure trove of knowledge about the behavior of its users, and trends at the local and global levels. People go to Twitter to share what they know and learn in return. Twitter users are hungry for new ideas, opportunities, information, services, and products. Businesses of all sizes use Twitter for a variety of reasons, from marketing to customer service. If your business is not part of this exchange, you're leaving two huge opportunities untouched: growing your business, as well as improving it. Using the mined data, companies better understand the customer demographic, thereby improving their marketing content. Companies can use their money wisely by appropriately tailoring their advertising to this knowledge. What most businesses tend to do is to hire a young, bright intern whose assignment will be to create a Twitter account to perform data mining the old-fashioned manual way. This manual approach is slow and very inefficient and a large amount of valuable information could be missed due to human error. Our motivation was to create an inexpensive solution to mine data out of the social networking site, which can be useful for any startup business. We have decided on Twitter as it is narrowed by its 140 character user status updates and not as complex as larger social media services, such as Facebook. 



Data collection

To collect data from Twitter we have written a ruby program, which will collect data for us. This program makes use of the Twitter API which gives us a diverse array of functionalities in accessing user information. The created program takes in a single argument which specifies which user account to access. It then analyses the specified account and writes the abovementioned data to an output .CSV file type. This output file is then used as input for our data clustering process.
Data Mining is the computational process of discovering patterns in large data sets with an aim of extracting information from the data set and transforming it into an understandable structure for further use. Information, that is very valuable to businesses and organizations on a global scale. Data Mining did not emerged out of the blue. It arose from the evolution in information processing. This evolution led to a diverse range of data mining algorithms. In our project, we analyzed all the information mined from Twitter, by using data clustering.
