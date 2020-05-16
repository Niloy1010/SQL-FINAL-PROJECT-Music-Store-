/* QUERY 1 Average rating of a singer's songs available in the store in the store */

select singer_name, count(song_id) as "total songs", ROUND(avg(rating),2) as "Average rating" from music_store_view group by singer_name;


/* QUERY 2 : ALL THE SONGS AVAILABLE FOR A PARTICULAR ALBUM WITH RATINGS*/
select singer_name,album_name,song_name,rating from albums a JOIN song s ON a.album_id = s.album_id JOIN song_ratings sr ON s.song_ratings_id = sr.song_ratings_id  order by singer_name;

/* QUERY 3 : How many songs are there in a particular album with album rating*/
select singer_name,count(song.album_id) as "Number of songs",album_name,rating from song,albums,album_ratings where
album_ratings.album_ratings_id=albums.album_ratings_id and song.album_id=albums.album_id group by singer_name,song.album_id order by count(song.album_id);