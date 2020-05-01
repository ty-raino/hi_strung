class HiStrung::Guitar
    attr_accessor :name, :url

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, url)
        @name, @url = name, url
        @@all << self
    end
    
end
