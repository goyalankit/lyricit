module Lyricit
    class Itunes
        def song_and_artist_by_current_track
            artist=%x(osascript -e 'tell application "iTunes" to artist of current track as string');
            name=%x(osascript -e 'tell application "iTunes" to name of current track as string');
            [artist, name]
        end

        def song_and_artist_by_id db_id
            return nil if db_id.strip == ""
            artist = %x(osascript -e "tell application \\"iTunes\\" to get artist of (every track where database ID is #{db_id.strip})")
            name = %x(osascript -e "tell application \\"iTunes\\" to get name of (every track where database ID is #{db_id.strip})")
            [artist, name]
        end

        def db_id_of_current_track
            %x(osascript -e 'tell application "iTunes" to database id of current track as string')
        end

        def add_lyrics lyrics, track
            %x(osascript -e "tell application \\"iTunes\\" to set lyrics of current track to \\"#{lyrics}\\" ")
        end

        def set_lyrics_by_id db_id, lyrics
            %x(osascript -e "tell application \\"iTunes\\" to set lyrics of (every track where database ID is #{db_id.strip}) to \\"#{lyrics}\\" ")
        end

        def find_by_name input

            dirty_track_names = %x(osascript -e "tell application \\"iTunes\\" to name of tracks of library playlist 1")
            track_names = dirty_track_names.split(',').map(&:strip)

            matching_names = track_names.select{|v| v.downcase.match(/#{input.downcase}/)}
            name_id = {}
            matching_names.each do |name|
                temp = %x(osascript -e "tell application \\"iTunes\\" to database id of (some track of library playlist 1 whose name is \\"#{name}\\")")
                name_id[name] = temp.strip
            end

            print_matching_results name_id
        end

        def print_matching_results name_id_hash
            if name_id_hash.empty?
                print "No results found. Please try again." 
                return
            end
            maxk = 0
            maxv = 0
            name_id_hash.map {|k,v| maxk = k.length if k.length > maxk; maxv = v.length if v.length > maxv}
            maxv += 4; maxk += 4

            print "\n#{name_id_hash.count} results found\n"
            print "|#{'-'* (maxk + maxv + 2)}|\n"
            print "|Id#{' '*(maxv - 2)}| Name#{' '*(maxk -4)}|\n\n"
            print "|#{'-'* (maxk + maxv + 2)}|\n"

            name_id_hash.each do |name, id|
                print "|#{id}#{' ' * (maxv - id.length)}| #{name}#{' '* (maxk - name.length)}|\n" 
            end

            print "|#{'-'* (maxk + maxv + 2)}|\n"
            return 0
        end
    end
end
