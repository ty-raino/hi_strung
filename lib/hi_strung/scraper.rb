require 'nokogiri'
require 'open-uri'

class Scraper

    def self.get_guitars
        html = "https://www.guitarcenter.com/Acoustic-Guitars.gc"
        guitars = Nokogiri::HTML(open(html))
    end


end