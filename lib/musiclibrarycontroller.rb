require 'pry'
class MusicLibraryController

    def initialize(path= "./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        gets 

        gets== "exit" ? return : call
    end

    def list_songs
        counter = 1
        sorted_song_array = Song.all.sort_by do |song| 
            song.name
        end
        # binding.pry
            sorted_song_array.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
        end
    end

    def list_artists
        counter = 1
        sorted_artist_array = Artist.all.sort_by do |artist| 
            artist.name
        end
        # binding.pry`
            sorted_artist_array.each do |artist|
            puts "#{counter}. #{artist.name}"
            counter += 1
        end
    end

    def list_genres
        counter = 1
        sorted_genre_array = Genre.all.sort_by do |genre| 
            genre.name
        end
        # binding.pry
        sorted_genre_array.each do |genre|
        puts "#{counter}. #{genre.name}"
        counter += 1
        end
    end


    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp
        # counter = 1
            if artist = Artist.find_by_name(user_input)
                artist 
                sorted_song_names= artist.songs.sort do |a,b|
                a.name<=>b.name
                #you can also do this method with sort_by, sorting by |song| if you don't want to do a.name<=>b.name
                #sorted_song_names= artist.songs.sort_by do |song|
                # song.name
                end
                sorted_song_names.each.with_index(1) do |song,i|
                puts "#{i}. #{song.name} - #{song.genre.name}"
                    # counter += 1
                end
            else
                nil
            end

    end


    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp
        if genre = Genre.find_by_name(user_input)
           sorted_songs = genre.songs.sort_by do |song|
                song.name
            end
            sorted_songs.each.with_index(1) do|song, i|
                puts "#{i}. #{song.artist.name} - #{song.name}"
            end
        end

    end

    def play_song
        puts "Which song number would you like to play?"
        input= gets.strip
        if song= Song.find_by_name(input)
            puts "Playing #{song.name} by #{song.artist.name}"
        end
        

    end


end