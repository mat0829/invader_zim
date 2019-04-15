require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_index_page
    index_url = "https://zim.fandom.com/wiki/Characters"

    doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
    
      character_info.each do |character|
        name = character.css(".lightbox-caption center b a[href]").text,
        debut = character.css("[href]")[2].text,
        character_url = "www.zim.fandom.com" + character.css("b a").first["href"]
        

        Character.new(name, debut, character_url)
      end
    end
    
    def self.scrape_profile_page
      profile_url = "https://zim.fandom.com/wiki/Zim"
      html = open(profile_url)
      doc = Nokogiri::HTML(html)
      character_table = doc.css(".infobox")

      character_table.each do |table|
        homeworld = table.css("a")[2].text,
        affiliation = table.css("a[href]")[6].text,
        gender = table.css("tr[6] td[2]").text.strip
        
        Character.new(homeworld, affiliation, gender)
      end
    end
  
end