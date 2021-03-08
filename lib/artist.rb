class Artist
    attr_accessor :name, :genre
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
        Song.all.select do |song|
            song.artist == self
        end
        
    end

    def add_song(song)
        if !song.artist
        song.artist = self
        end  
    end

    def genres
        songs.map do |song|
            song.genre
        end.uniq
    end

end