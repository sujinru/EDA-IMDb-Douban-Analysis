# Pride and Prejudice in Douban & IMDb
It sometimes - if not often - happens when we see obvious gaps between ratings on IMDb and Douban. My work looks into 4,919 ratings of IMDb, 4,304 of Douban, 4,313 of Rotten Tomatoes and 3,758 of Metacritic to find how different these groups of audiences are rating movies and what is driving them.

<b>How are scores distributed?</b><br/>
* Douban and IMDb are close to a normal distribution with minor left skewness. Douban has its mean score 0.5 higher than IMDb, likely due to the different minimum scores (2 for Douban and 1 for IMDb).
* Metacritic resembles a strict normal distribution. This is because "it is a weighted average in that we assign more importance, or weight, to some critics and publications than others, based on their quality and overall stature."
* Rotten Tomatoes' score is the percentage of approved Tomatoers Critics who have given the movie a positive review, which may explain the close-to-uniform distribution<br/>
![distribution](https://user-images.githubusercontent.com/5430288/29005022-22f86588-7a98-11e7-83ae-665fd93a569d.png) <br/>
The article will continue to compare IMDb and Douban since they have the similar rating systems. Before we start, we need to adjust the IMDb and Douban scores to make them comparable. Thus, I adjusted them to have the same mean.

<b>How relevant are IMDb and Douban scores?</b>

Each movie with more than 5000 number of votes is plotted on the graph below. X axis is the adjusted Douban score and Y is the adjusted IMDb. 1:1 line is the line starting from (0, 0) with slope 1. Movies below it are those rated higher on Douban than on IMDb, while movies above the line are rated higher on IMDb. We see the points are randomly scattered around the 1:1 line. The correlation coefficient is 0.70, which indicates a strong uphill linear relationship.
<img align="center" width="442" alt="sss" src="https://user-images.githubusercontent.com/5430288/29005077-1a7c5a6c-7a99-11e7-9393-523992a6f0ab.png">

<b>What are the outliers far off the 1:1 line?</b>

<img width="500" alt="bbbb" src="https://user-images.githubusercontent.com/5430288/29005099-75c82522-7a99-11e7-962c-f050606e2150.png">

You may understand why Justin Bieber's film is rated so low on IMDb. But interestingly the other seven falls into a category of light entertainment. Are Douban ratings in favor of this kind?

<b>Well... It seems true... by looking into Genres.</b>

<img width="389" align="center" alt="aaa" src="https://user-images.githubusercontent.com/5430288/29005116-b1175b0c-7a99-11e7-8359-ae53a3abbe34.png">
By calculating the score difference on two platforms after grouping by genre, we reach the bar plot which shows the different appetites. Bars surpassing the gray dashed lines have more than 0.1 in the average score whose gaps are considered significant. Genres such as Family, Documentary, Music, Animation and Sport are more favorable by Douban, which verifies our impression for Douban as Xiao Qing Xin(小清新, indie hipster). Meanwhile, IMDb viewers prefer Film-Noir, Crime, Thriller, Mystery, Horror and Western. This is more about the culture difference as these genres have either longer history or different ways of cultural expression in U.S.




<b>Does the language matter?</b>

I examine how Douban and IMDb viewers rate the movies in their native or non-native languages. The result surprises: Douban voters rate movies in Chinese (Cantonese incl.) 0.25 HIGHER than non-Chinese movies, while IMDb viewers rate English movies 0.43 LOWER than non-English. It seems IMDb viewers are more "tolerate" about the language difference in the forms of films.

<b>Additional Facts: Who is the Lousy Movie King or the nightmare for the investors?</b>

I calculated the average IMDb rating and average ROI (Gross/Budget) for an actor based on every movie where he is listed as the top 3 characters in the cast. Only actors and actresses with more than eight appearances in the analysis pool are shown. The larger the dots are, the more times they appear in my analysis. The vertical dashed line is the median of ROI amongst all actors and the horizontal line is the median of IMDb rating.

<img width="440" alt="cccc" src="https://user-images.githubusercontent.com/5430288/29005128-022e0932-7a9a-11e7-9f2c-4d5383e949f6.png">

Big names, such as Morgan Freeman, Johnny Depp, Brad Pitt and Matt Damon are not top grossing stars as I expect, which may be caused by the large number of movies they participated in. Harrison Ford has acted in six of the Star Wars series and becomes the most attractive star for box office, which approves the influence of great movie series. Carmen Electra has the lowest score, 4.7, on the graph. No wonder she had been nominated for Gold Raspberry awards for 5 consecutive years. However, she may not be too bad to win the Lousy Movie King. Nicolas Cage is another strong candidate who makes the most number of movies in the left bottom quadrant. He has large chance to win for his incomparable consistency.
