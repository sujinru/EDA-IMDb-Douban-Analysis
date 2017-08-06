name = c('Sci-Fi', 'Crime', 'Romance', 'Animation', 'Music', 'Comedy', 'War', 'Horror', 'Film-Noir', 'Adventure', 'Thriller', 'Western', 'Mystery', 'Drama', 'Action', 'Documentary', 'Musical', 'History', 'Family', 'Fantasy', 'Sport', 'Biography')
score=c(0.07502249413025254, 0.16593480023491489, -0.02831753596828096, -0.20629912608223333, -0.30026946535898197, -0.081203415292832481, 0.053857297706026853, 0.19659295115326664, 0.11506051767887619, -0.022351972181009871, 0.18150706114913723, 0.20139021802549117, 0.18173799120562165, 0.067179907726971841, 0.084833502788525805, -0.33292581758459966, -0.30288245590415747, 0.07045073989166542, -0.35495950484205063, -0.017855827358302837, -0.13592740119694513, 0.039315107280427634)
by_genre = data.frame(name, score)
by_genre<-by_genre[order(by_genre$score, decreasing = TRUE), ]
colors = c(replicate(12, 'red'), replicate(10,'darkgreen'))

#png(filename="~/Document/data_science/Visual/douban_Imdb/png/score_by_genre.png")
par(mar=c(5,2,3,3))
barplot(height = by_genre$score, names.arg = by_genre$name, space = 0.5, horiz=TRUE, col=colors, border=NA,
        main='Score Difference By Genre', yaxt='n', xaxt='n',cex.axis = 1.3, cex.main=1.3, las=1)
x=replicate(10, 0.055)
y=seq(32.5, 19, by=-1.5)
texts = rev(by_genre$name)[1:10]
text(x, y, texts, cex = 0.7, col='darkgreen')

x=replicate(12, -0.055)
y=seq(17.5, 1, by=-1.5)
texts = rev(by_genre$name)[11:22]
text(x, y, texts, cex = 0.7, col='red')
text(-0.04, 32.5, 'Family', cex = 0.7, col=col1)

lines(x=c(-0.1, -0.1),y=c(18.25, 35), col='grey', lwd=2.5, lty='dashed')
lines(x=c(0.1, 0.1),y=c(-6, 18.25), col='grey', lwd=2.5, lty='dashed')
lines(x=c(-0.32, -0.28), y=c(6.5, 6.5), col='grey', lwd=2.5, lty='dashed')
text(-0.19, 6.5, '0.1 Difference', col='black', cex=0.9)
legend("bottomleft", inset=.05, c("Higher on Douban", "Higher on IMDb"), fill=c("darkgreen", "red"), cex=0.9, bty='n', horiz=FALSE, text.col='black')

dev.off()

