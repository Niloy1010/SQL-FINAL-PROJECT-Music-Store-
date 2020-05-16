CREATE OR REPLACE VIEW `music_store_view` AS
select song_id,singer_name,album_name,song_name,song_ratings.rating AS "Rating" from song JOIN song_ratings
ON song_ratings.song_ratings_id=song.song_ratings_id JOIN albums ON song.album_id = albums.album_id;

select * from music_store_view;