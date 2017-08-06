films=read.csv("~/Document/data_science/Visual/douban_imdb/movie_final.csv", row.names=1)

im_film = films
db_film = subset(films, !is.na(db_score))
rt_film = subset(films, !is.na(rt_score))
me_film = subset(films, !is.na(me_score))

db_film['adj_db_score']=(db_film$db_score-7.083597)/0.9945496+6.760735
im_film['adj_im_score']=(im_film$imdb_score-6.437874)/1.127606+6.760735

#png(filename="~/Document/data_science/Visual/douban_Imdb/png/distribution.png")

hist(db_film$db_score, xlim=c(0,10),col=scales::alpha('green',.5), yaxt='n', xaxt='n', xlab='', cex.axis=1.3, cex.main=1.3, ylab='', main='Scoring Distribution', border=F)
axis(side=1,labels=F) 
hist(films$imdb_score, add=T,col=scales::alpha('skyblue',.5),border=F)

hist(rt_film$rt_score/10, add=T, breaks = 25, col=scales::alpha('red',.5),border=F)
hist(me_film$me_score/10, add=T, breaks=25, col=scales::alpha('yellow',.5), border=F)
legend("topleft", inset=.05, c("Douban", "IMDb","Rotten Tomatoes", "Metacritic"), 
       fill=c("#00FF0080", "#87CEEB80", "#FF000080","#FFFF0080"), bty='n', horiz=FALSE, cex=1.05, text.col='black', pt.lwd=15)
#dev.off()

hist(im_film$adj_im_score,col=scales::alpha('skyblue',.5), border=F)
hist(db_film$adj_db_score, add=T, breaks = 25, col=scales::alpha('green',.5),border=F)

#plot adjusted
d <- density(db_film$adj_db_score)
d1 <- density(im_film$adj_im_score)
d2 <- density(db_film$db_score)
d3 <- density(im_film$imdb_score)
#png(filename="~/Document/data_science/Visual/douban_Imdb/png/adj_distribution.png")
plot(d$x, d$y, yaxt='n', main='Adjusted Scoring Distribution', col='darkgreen', cex.main=1.3, lwd=2.5, xlab='', cex.axis=1.3, type='l', xlim=c(1, 10), ylim=c(0, 0.5), ylab='', bty='n')
lines(d1, col="red", lwd=2.5)
#lines(d2, col="darkgreen", lty='dashed', lwd=2.5)
legend("topleft", inset=.05, c("Douban", "IMDb"), fill=c("darkgreen", "red"), bty='n', horiz=FALSE, cex=1.3, text.col='black', pt.lwd=15)
#dev.off()

#scatter plot
#png(filename="~/Document/data_science/Visual/douban_Imdb/png/1:1line.png")
db_im_film = subset(films, !is.na(db_score)&num_voted_users>5000)
db_im_film['adj_db_score']=(db_im_film$db_score-7.083597)/0.9945496+6.760735
db_im_film['adj_im_score']=(db_im_film$imdb_score-6.437874)/1.127606+6.760735
plot(db_im_film$adj_db_score, db_im_film$adj_im_score, pch=20, xlim=c(3,10), las=1, cex=0.3, ylim=c(3,10), xlab='Douban Rating', ylab='IMDb Rating', cex.axis=1.3, col='black', col.axis='black', bty='n')
lm(db_im_film$imdb_score~db_im_film$db_score)
#abline(0.9659, 0.7819, col='blue', lwd=2.5)
abline(0, 1, col='red', lwd=2.5, lty='dashed')
#legend("topleft", inset=.05, c("Linear Regression", "1:1 Line"),  bty='n', horiz=FALSE,  text.col='black', pt.lwd=15)
#lines(x=c(0,1), y=c(9.2,9.2), col='blue', lwd=2.5)
lines(x=c(3,4), y=c(9.2,9.2), col='red', lty='dashed', lwd=2.5)
#text(x=2.75, y=9.2, labels = 'Linear Regression', col='black')
text(x=4.7, y=9.2, labels = '1:1 Line', col='black')
grid()
dev.off()

#scatter plot on percentile
plot(db_im_film$db_score_per, db_im_film$imdb_score_per, pch=20, las=1, cex=0.3, xlab='Douban Rating', ylab='IMDb Rating', cex.axis=1.3, col='black', col.axis='black', bty='n')
lm(db_im_film$imdb_score_per~db_im_film$db_score_per)
abline(13.5565, 0.7219, col='blue', lwd=2.5)
abline(0, 1, col='red', lwd=2.5, lty='dashed')
legend("topleft", inset=.05, c("Linear Regression", "1:1 Line"), fill=c("blue", "red"), bty='n', horiz=FALSE,  text.col='black', pt.lwd=15)

#use percentile
db_im_film['db_score_per']=-1
db_im_film['imdb_score_per']=-1
for (i in 1:3812){
  curr_score = db_im_film[i, 'db_score']
  db_im_film[i, 'db_score_per']=length(subset(db_im_film, db_score<curr_score)[,1])/3812.0*100
  curr_score = db_im_film[i, 'imdb_score']
  db_im_film[i, 'imdb_score_per']=length(subset(db_im_film, imdb_score<curr_score)[,1])/3812.0*100
  #print(length(subset(db_im_film, db_score<curr_score)[,1])/3812.0)
  
}
db_im_film['db_score_per']=perc.rank(db_im_film['db_score'], db_im_film$db_score)
quantile(db_im_film$imdb_score, 0.5)
