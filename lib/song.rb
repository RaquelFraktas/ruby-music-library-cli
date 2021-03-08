class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist 
        self.genre = genre if genre
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

    def artist=(person)
        @artist = person
        artist.add_song(self)
        
    end

    def self.find_by_name(name_property)
        @@all.find do |song|
            song.name == name_property
            
        end
    end

end