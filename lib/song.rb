require 'pry'

class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist 
        self.genre = genre if genre
        save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
         self.class.all << self
    end

    def self.create(create_song, artist=nil)
       created_song = Song.new(create_song, artist)
       created_song
    end

    def artist=(person)
        @artist = person
        artist.add_song(self)
        
    end

    def self.find_by_name(name_property)
        @@all.find do |song|
           song.name == name_property
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def self.new_from_filename(file_name)
        new_file = file_name.split(/ - |.mp3/)
        artist = Artist.find_or_create_by_name(new_file[0])
        genre = Genre.find_or_create_by_name(new_file[2])
        Song.new(new_file[1], artist, genre)
    end

    def self.create_from_filename(file_name)
        new_from_filename(file_name).save
    end

end