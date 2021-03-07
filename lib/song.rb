class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist= nil)
        @name = name
        @artist = artist
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

    def self.create(create_song, artist=nil)
       create_song = Song.new(create_song, artist)
       create_song.name = name
       create_song
    end

end