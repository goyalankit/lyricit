module Lyricit
    class Itunes
        def current_track
            artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`;
            name=`osascript -e 'tell application "iTunes" to name of current track as string'`;
            [artist, name]
        end

        def add_lyrics lyrics, track
            `osascript -e "tell application \\"iTunes\\" to set lyrics of current track to \\"#{lyrics}\\" "`
        end

        def set_lyrics_by_id db_id, lyrics
            `osascript -e "tell application \\"iTunes\\" to set lyrics of (every track where database ID is #{db_id.strip}) to \\"#{lyrics}\\" "`
        end

        def find_by_name input

            dirty_track_names = `osascript -e "tell application \\"iTunes\\" to name of tracks of library playlist 1"`
            track_names = dirty_track_names.split(',').map(&:strip)

            matching_names = track_names.select{|v| v.match(/#{input}/)}
            name_id = {}
            matching_names.each do |name|
                temp = `osascript -e "tell application \\"iTunes\\" to database id of (some track of library playlist 1 whose name is \\"#{name}\\")"`
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
        end
    end
end


#Ids of all songs
#`echo "tell application \\"iTunes\\" to database ID of tracks of library playlist 1"  | /usr/bin/osascript`

#set lyrics by id
#`osascript -e "tell application \\"iTunes\\" to set lyrics of (every track where database ID is 215) to \\"sdf\\" "`

#db_ids = `osascript -e "tell application \\"iTunes\\" to (get database ID of every track in current playlist)"`
#
#`echo "tell application \\"iTunes\\" to database id of (some track of library playlist 1 whose artist is \\"Lorde\\")"  | /usr/bin/osascript`
#names[song_id] = `osascript -e "tell application \\"iTunes\\" to get name of (every track where database ID is #{song_id})"`
