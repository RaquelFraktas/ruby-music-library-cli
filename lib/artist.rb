class Artist
    attr_accessor :name, :song, :genre
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(create_artist)
       create_artist = Artist.new(create_artist)
       create_artist.name = name
       create_artist
    end

    def songs
        Song.all.detect do |song|
            song.artist == self
        end
        
    end

    def add_song
        
    end

end