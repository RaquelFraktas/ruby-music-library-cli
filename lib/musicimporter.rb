require 'pry'
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
        temp_files = Dir.glob("#{path}/*") #splits every different path name. "grab every file that has this name"
        @@files = temp_files.map do |file|
            file.gsub("#{path}/", "") #the gsub deletes the unecessary path info.
        end
    end

    def import
        files.map do |file|
            Song.create_from_filename(file)
        end
    end

end