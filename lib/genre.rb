class Genre
    attr_accessor :name
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

    def self.create(create_genre)
       create_genre = Genre.new(create_genre)
       create_genre.name = name
       create_genre
    end

    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    def artists
        songs.map do |song|
            song.artist
        end.uniq
    end

end