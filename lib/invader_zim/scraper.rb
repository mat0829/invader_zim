require 'nokogiri'
require 'open-uri'
        
        
  class Scraper

    def self.scrape_index_page(index_url)
    index_url = "https://zim.fandom.com/wiki/Characters"

      doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
      characters = []
    
      character_info.each do |character|
      characters << {
        :name => character.css(".lightbox-caption center b a[href]").text,
        :debut => character.css("[href]")[2].text,
        :profile_url => "https://zim.fandom.com" + character.css("b a").first["href"]
      }
        end
        characters
    end

    def self.scrape_profile_page(character)
     html = open(character.profile_url)
     doc = Nokogiri::HTML(html)
     character_table = doc.css(".infobox")
     
     character_table.each do |table|
       character << {
       :homeworld => table.css("a")[2].text,
       :affiliation => table.css("a[href]")[6].text,
       :gender => table.css("tr[6] td[2]").text.strip
       }
     end
     character
    end
    
  end