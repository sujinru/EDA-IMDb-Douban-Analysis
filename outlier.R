films=read.csv("~/Document/data_science/Visual/douban_imdb/movie_final.csv", row.names=1)
films['score_gap']=films['imdb_score']-films['db_score']
temp = subset(films, score_gap<=-3 )
temp = temp[c('movie_title', 'score_gap', 'adj_im_score', 'adj_db_score', 'db_score', 'imdb_score', 'genres')]
