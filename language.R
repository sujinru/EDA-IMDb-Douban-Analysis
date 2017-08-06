films=read.csv("~/Document/data_science/Visual/douban_imdb/db_im_film.csv", row.names=1)
#films=read.csv("~/Document/data_science/Visual/douban_imdb/movie_final.csv", row.names=1)

#films = subset(films, !is.na(db_score))
#films['adj_db_score']=(films$db_score-7.083597)/0.9945496+6.760735
#films['adj_im_score']=(films$imdb_score-6.437874)/1.127606+6.760735
languages = unique(films$language)

name = c('1', '2')
score=c(-0.25406899999999943,0.5735800000000006)
by_language = data.frame(name, score)
barplot(height = by_language$score, names.arg = by_language$name, width=0.5, xlim=c(0,2), space = 0.5, col=c('darkgreen', 'red'), border=NA,
        main='Score Difference By Language', xaxt='n', yaxt='n', cex.axis = 1.3, cex.main=1.3, las=1)
