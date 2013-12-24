module Lyricit
    module MakeItPersonal
        def self.get_lyrics name, artist
            res = Faraday.get("http://makeitpersonal.co/lyrics?artist=#{artist}&title=#{name}")

            return nil if res.status.to_i != 200

            return :not_found if res.body.include?("Sorry")

            return res.body
        end
    end
end
