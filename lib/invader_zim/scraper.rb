      require 'nokogiri'
      require 'open-uri'
        
        
        
      class Scraper

        def self.scrape_main_page
        doc = Nokogiri::HTML(open("https://zim.fandom.com/wiki/Characters"))
        character_info = doc.css(".wikia-gallery-item")
    
         character_info.each do |character|
          
         character_object = Character.new
         name = character.css(".lightbox-caption center b a[href]").text,
         debut = character.css("[href]")[2].text,
         character_page = "www.zim.fandom.com" + character.css("b a").map { |anchor| anchor["href"] }.first
        end
        
      end
        
        