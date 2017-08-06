films=read.csv("~/Document/data_science/Visual/douban_imdb/db_im_film.csv", row.names=1)
#films=read.csv("~/Document/data_science/Visual/douban_imdb/movie_final.csv", row.names=1)

#films = subset(films, !is.na(db_score))
films['adj_db_score']=(films$db_score-7.083597)/0.9945496+6.760735
films['adj_im_score']=(films$imdb_score-6.437874)/1.127606+6.760735

europe = c('Sweden', 'Germany', 'France', 'Spain', 'Czech Republic', 'Italy', 'Denmark', 'Ireland', 'Switzerland',
           'Hungary', 'Belgium', 'Greece', 'Netherlands', 'Norway', 'Poland', 'Finland')
europe_film['continent']='A'
europe_film=films
for (i in 1:3812){
  if (europe_film[i, 'country'] %in% europe){
    europe_film[i, 'continent']='europe'
  }
}
europe_film=subset(europe_film, continent=='europe')
plot(europe_film$adj_db_score, europe_film$adj_im_score, main = '', pch=20, xlim=c(3,10), las=1, cex=0.3, ylim=c(3,10), xlab='Douban Rating', ylab='IMDb Rating', cex.axis=1.3, col='black', col.axis='black', bty='n')
abline(0, 1, col='red', lwd=2.5, lty='dashed')

australian_film = subset(films, country=='New Zealand'|country=='Australia')
plot(australian_film$adj_db_score, australian_film$adj_im_score, main = '', pch=20, xlim=c(3,10), las=1, cex=0.3, ylim=c(3,10), xlab='Douban Rating', ylab='IMDb Rating', cex.axis=1.3, col='black', col.axis='black', bty='n')
abline(0, 1, col='red', lwd=2.5, lty='dashed')

par(mfrow=c(1,1))
other_country=c('UK', 'Russia', 'USA', 'Canada', 'France', 'Australia', 'India', 'China', 'Japan', 'Hong Kong', 'South Korea')
for (i in 1:length(other_country)){
  curr_country=other_country[i]
  curr_film=subset(films, country==curr_country)
  plot(curr_film$adj_db_score, curr_film$adj_im_score, main = curr_country, pch=20, xlim=c(3,10), las=1, cex=0.3, ylim=c(3,10), xlab='Douban Rating', ylab='IMDb Rating', cex.axis=1.3, col='black', col.axis='black', bty='n')
  abline(0, 1, col='red', lwd=2.5, lty='dashed')
}

films['score_gap']=films$adj_im_score-films$adj_db_score

for (i in 1:length(other_country)){
  if (europe_film[i, 'country'] %in% europe){
    europe_film[i, 'continent']='europe'
  }
}
