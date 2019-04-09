      require 'nokogiri'
      require 'open-uri'
        
        
        
      class Scraper

  def self.scrape_index_page(index_url)
    index_url = "https://zim.fandom.com/wiki/Characters"

    doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
      character_array = []
    
      character_info.each do |character|
      character_array << {
        :name => character.css(".lightbox-caption center b a[href]").text,
        :debut => character.css("[href]")[2].text,
        :character_url => "www.zim.fandom.com" + character.css("b a").map { |anchor| anchor["href"] }.first
      }
        end
      puts character_array
  end

    def self.scrape_character_page(character_url)
      html = open(character_url)
      doc = Nokogiri::HTML(html)
      character_table = doc.css(".infobox")
      character_page_traits = []

      character_table.each do |table|
      character_page_traits << {
        :homeworld => table.css("a")[2].text,
        :affiliation => table.css("a[href]")[6].text,
        :gender => table.css("")[2].text
      }
      end
      puts character_page_traits

    end
      
end