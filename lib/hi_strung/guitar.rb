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

    def self.mass_create_electrics(electric_hash)
        electric_hash.each do |e_hash|
            electric = HiStrung::Guitar.new(e_hash[:name], e_hash[:url])
            @@electrics << electric
        end
    end

    def self.mass_create_acoustics(acoustic_hash)
        acoustic_hash.each do |a_hash|
            acoustic = HiStrung::Guitar.new(a_hash[:name], a_hash[:url])
            @@acoustics << acoustic
        end
    end

    def initialize(name, url)
        @name, @url = name, url
    end
end
