class HiStrung::Scraper

    def self.get_categories
        doc = Nokogiri::HTML(open("https://reverb.com"))
        categories = doc.css("li.tiles__tile a.category-item").text

        category_array = []
        counter = 0

        while counter < doc.css("li.tiles__tile a.category-item").length
        categories = doc.css("li.tiles__tile a.category-item")[counter].text
        counter += 1
        category_array << categories
        end
        array = category_array.take(2)
        return array
        binding.pry
    end

    def self.get_electric
        doc = Nokogiri::HTML(open("https://reverb.com/c/electric-guitars"))

        electrics = []
        counter = 0

        while counter < doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile").length
        electric = {
            name: doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile")[counter].text,
            url: doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile a.marketing-callout__inner")[counter]["href"]
        }
        counter += 1
        electrics << electric
        end
        electrics
    end

    def self.get_acoustic
        doc = Nokogiri::HTML(open("https://reverb.com/c/acoustic-guitars"))

        acoustics = []
        counter = 0

        while counter < doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile").length
            acoustic = {
                name: doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile")[counter].text,
                url: doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile a.marketing-callout__inner")[counter]["href"]
            }
            counter += 1
            acoustics << acoustic
        end
        acoustics
    end

    def self.get_electric_info
    end

    def self.get_acoustic_info
    end
end




# def self.get_electric
#     doc = Nokogiri::HTML(open("https://reverb.com/c/electric-guitars"))

#     guitars = []
#     counter = 0

#     electric = doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile")
#     electric.each do |li|
#     li = HiStrung::Guitar.new
#     li.name = doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile").text.take(5)
#     li.url = doc.css("h2:contains('Popular Electric Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile a.marketing-callout__inner").first["href"]
#     binding.pry
#     end
# end

# def self.get_acoustic
#     doc = Nokogiri::HTML(open("https://reverb.com/c/acoustic-guitars"))
#     acoustic = doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile")
#     acoustic.each do |li|
#     li = HiStrung::Guitar.new
#     li.name = doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile").first.text
#     li.url = doc.css("h2:contains('Popular in Acoustic Guitars')+div.overflowing-row__items ul.tiles.tiles--single-row.tiles--grow.tiles--three-wide li.tiles__tile a.marketing-callout__inner").first["href"]
#     end
# end