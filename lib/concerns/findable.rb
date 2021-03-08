module Concerns::Findable

    def find_by_name(name_property)
        self.all.find do |s|
            s.name == name_property
         end
    end

    def find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

end