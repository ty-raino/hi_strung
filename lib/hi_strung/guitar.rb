class HiStrung::Guitar
    attr_accessor :name, :url

    @@electrics = []
    @@acoustics = []
   

    def self.electrics
        @@electrics
    end

    def self.acoustics
        @@acoustics
    end

    def self.mass_create_guitars(guitar_hash, category)
        guitar_hash.each do |g_hash|
         guitars = HiStrung::Guitar.new(g_hash[:name], g_hash[:url])
         
         if category == "electric"
            @@electrics << guitars
         elsif category == "acoustic"
            @@acoustics << guitars
        end
     end
    
    end

    def initialize(name, url)
        @name, @url = name, url
    end
end


