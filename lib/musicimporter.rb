class MusicImporter
    @@files = []

    def initialize(path)
        @path = path
        files
    end

    def path
        @path
    end

    def files
        @@files << self
    end

end