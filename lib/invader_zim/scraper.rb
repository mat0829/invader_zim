require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_index_page
    index_url = "https://zim.fandom.com/wiki/Characters"

    doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
      character_array = []
    
      character_info.each do |character|
        name = character.css(".lightbox-caption center b a[href]").text,
        debut = character.css("[href]")[2].text,
        character_url = "www.zim.fandom.com" + character.css("b a").map { |anchor| anchor["href"] }.first

        Character.new(name, debut, character_url)
      end

    end
  
end