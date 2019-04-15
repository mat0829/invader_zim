  require 'nokogiri'
  require 'open-uri'
        
        
  class Scraper

    def self.scrape_index_page(index_url)
    index_url = "https://zim.fandom.com/wiki/Characters"

    doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
      characters_array = []
    
      character_info.each do |character|
      characters_array << {
        :name => character.css(".lightbox-caption center b a[href]").text,
        :debut => character.css("[href]")[2].text,
        :profile_url => "www.zim.fandom.com" + character.css("b a").first["href"]
      }
        end
        characters_array
    end

    def self.scrape_profile_page(profile_url)
      #profile_url = "https://zim.fandom.com/wiki/Zim"
      html = open(profile_url)
      doc = Nokogiri::HTML(html)
      character_table = doc.css(".infobox")
      profile_page_traits = []

      character_table.each do |table|
      profile_page_traits << {
        :homeworld => table.css("a")[2].text,
        :affiliation => table.css("a[href]")[6].text,
        :gender => table.css("tr[6] td[2]").text.strip
      }
      end
        profile_page_traits
    end
    
  end
  