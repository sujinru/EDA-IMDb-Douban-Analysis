films = read.csv("~/Document/data_science/Visual/douban_imdb/movie_final.csv", row.names=1)

par(mar=c(5, 4, 4, 2))
actors=read.csv("~/Document/data_science/Visual/douban_imdb/actors.csv", row.names=1)
actors=subset(actors, name!='Bruce'& name!='nan')
actors=subset(actors, roi_count>8)
plot(actors$roi, actors$im_score, pch=16, cex=actors$im_count/20, las=1, xlim=c(-0.5, 11), ylim=c(4.5, 9), xaxt='n', yaxt='n', xlab='ROI', ylab='Rating', col.lab='grey', cex.lab=1.2, cex.axis=0.8, col='lightgreen', col.axis='grey', bty='n')
axis(side = 1, col = "white", col.axis='grey', tcl = 0, cex.axis=0.8)
axis(side = 2, col = "white", col.axis='grey', tcl = 0, cex.axis=0.8, las=1)
outlier_actor = subset(actors, name=='Carmen Electra' | name=='Larry Miller' | name=='John Ratzenberger' | name=='amie Lee Curtis' |
                         name=='Harrison Ford' | name=='Lin Shaye' | name=='Ethan Suplee'| name=='Leonardo DiCaprio'|
                         name=='Mark Margolis' | name=='Clint Eastwood' | name=='Stockard Channing')
text(outlier_actor$roi, outlier_actor$im_score+0.12, labels=outlier_actor$name, cex= 0.6)
points(outlier_actor$roi, outlier_actor$im_score, col='red', pch=16, cex=outlier_actor$im_count/20)

lines(y=c(mean_im_score, mean_im_score), x=c(-1,10), col='#ff4500', lty='dashed')
lines(y=c(4.5, 11), x=c(mean_roi, mean_roi), col='#ff4500', lty='dashed')
grid()

points(7.1565381, 6.597533, col='red', pch=16, cex=26/20)
text(7.1565381, 6.597533-1, 'Sylvester Stallone', cex=0.6)
lines(x=c(7.1565381, 7.1565381), y=c(6.7-1.05, 6.54))

points(2.1586675, 7.199438, col='red', pch=16, cex=43/20)
text(2.1586675, 7.199438-2, 'Morgan', cex=0.6)
text(2.1586675, 7.199438-2.12, 'Freeman', cex=0.6)

#points(1.6450284, 6.913849, col='red', pch=16)
#text(1.6450284, 6.913849+1, 'Bruce Willis', cex=0.6)
#lines(x=c(1.6450284, 1.6450284), y=c(6.98, 7.82))

points(2.9765572, 7.328756, col='red', pch=16, cex=37/20)
text(2.9765572, 5.8, 'Matt', cex=0.6)
text(2.9765572, 5.8-0.12, 'Damon', cex=0.6)
lines(x=c(2.9765572, 2.9765572), y=c(5.82, 7.3))

points(2.2495048, 7.064637, col='red', pch=16, cex=36/20)
text(2.25, 7.48, 'Johnny Depp', cex=0.6)
lines(x=c(2.26, 2.26), y=c(7.46, 7.12))

points(1.1075387, 6.590091, col='red', pch=16, cex=33/20)
text(1.1075387, 4.5, 'Nicolas Cage', cex=0.6)
lines(x=c(1.1075387, 1.1075387), y=c(4.55, 6.53))


#text(1.2150519, 8.5, 'Brad Pitt', cex=0.6)
#lines(x=c(1.2150519, 1.2150519), y=c(7.36, 8.44))

text(0, 8.5, 'Brad Pitt', cex=0.6)
lines(x=c(-0.2, -0.2), y=c(7.337182, 8.42))
lines(x=c(-0.2, 1.3), y=c(7.337182, 7.337182))
points(1.2150519, 7.337182, col='red', pch=16, cex=33/20)
lines(x=c(2.1586675, 2.1586675), y=c(7.15, 5.28)) #Freeman
points(1.3830595, 7.719557, col='red', pch=16, cex=21/20)
#leonardo



#points(actors$db_score, actors$roi, pch=20, cex=0.3, cex.axis=1.3, col='red', col.axis='black', bty='n')
mean_roi=median(actors$roi)
mean_im_score=median(actors$im_score) #6.771057
mean_db_score=median(actors$db_score) #6.795262



text(-0.2, 7, 'Median', col='#ff4500', cex=0.8)
text(-0.2, 6.78, 'Rating', col='#ff4500', cex=0.8)

text(2.4, 9, 'Median', col='#ff4500', cex=0.8)
text(2.4, 8.78, 'ROI', col='#ff4500', cex=0.8)


