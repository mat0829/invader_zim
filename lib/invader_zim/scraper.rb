require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_index_page
    index_url = "https://zim.fandom.com/wiki/Characters"

    doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
      characters = []
      character_info.each do |character|
        character = {}
        character.name = character.css(".lightbox-caption center b a[href]").text,
        character.debut = character.css("[href]")[2].text,
        character.character_url = "www.zim.fandom.com" + character.css("b a").first["href"]
        characters << character
      end
    end
    
    def self.scrape_profile_page
      profile_url = "https://zim.fandom.com/wiki/Zim"
      html = open(profile_url)
      doc = Nokogiri::HTML(html)
      character_table = doc.css(".infobox")
      characters = []
      character_table.each do |table|
        character = {}
        character.homeworld = table.css("a")[2].text,
        character.affiliation = table.css("a[href]")[6].text,
        character.gender = table.css("tr[6] td[2]").text.strip
        characters << character
      end
    end
  
end