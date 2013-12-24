#!/usr/bin/env ruby

require 'lyricit'

itunes = Lyricit::Itunes.new
itunes.find_by_name ARGV[0]

print "Enter the Id for which you want the lyrics: "

db_id = STDIN.gets

artist, name = itunes.song_and_artist_by_id db_id

a = Lyricit::LyricsApi.new artist, name
lyrics = a.get_lyrics

return if lyrics.nil?

print lyrics

print "Update on iTunes? [Y/n]: "
update = STDIN.gets

if update
    itunes.set_lyrics_by_id db_id, lyrics
    print "Updated on iTunes!"
else
    print "Exiting now"
end
