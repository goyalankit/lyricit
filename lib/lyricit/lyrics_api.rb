module Lyricit
    class LyricsApi

        def initialize song_artist, song_name
            @song = song_name
            @artist = song_artist
        end

        def get_lyrics
            try_make_it_personal_api
        end

        def try_make_it_personal_api
            lyrics = Lyricit::MakeItPersonal.get_lyrics @song, @artist

            case lyrics
            when nil
                puts "Something seems to be wrong with the API. Try after some time."
                return nil
            when :not_found
                puts "Sorry could not find the lyrics for the requested song."
                return nil
            else
                return lyrics
            end
        end
    end
end
