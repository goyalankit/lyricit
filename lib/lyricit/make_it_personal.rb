module Lyricit
    module MakeItPersonal
        def self.get_lyrics name, artist
            print "Getting Lyrics for:\nSong: #{name.strip}\nArtist: #{artist}"
            return :incomplete_info if name.strip == "" || artist.strip == ""
            res = Faraday.get("http://makeitpersonal.co/lyrics?artist=#{artist.strip}&title=#{name.strip}")

            return nil if res.status.to_i != 200

            return :not_found if res.body.include?("Sorry")

            return res.body
        end
    end
end
