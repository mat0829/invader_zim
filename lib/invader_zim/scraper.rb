  require 'nokogiri'
  require 'open-uri'
        
        
  class Scraper

    def self.scrape_index_page
      index_url = "https://zim.fandom.com/wiki/Characters"

      doc = Nokogiri::HTML(open(index_url))
      character_info = doc.css(".wikia-gallery-item")
    
      character_info.each do |character|
        
        character_object = Character.new
        character_object.name = character.css(".lightbox-caption center b a[href]").text,
        character_object.debut = character.css("[href]")[2].text,
        character_object.character_url = "www.zim.fandom.com" + character.css("b a").map { |anchor| anchor["href"] }.first
        end
      
    end

    #def self.scrape_character_page
      
      #html = open(character_url)
      #doc = Nokogiri::HTML(html)
      #character_table = doc.css(".infobox")

      #character_table.each do |table|
      
        #character_page_object = Character.new
        #character_page_object.homeworld = table.css("a")[2].text,
        #character_page_object.affiliation = table.css("a[href]")[6].text,
        #character_page_object.gender = table.css("tr[6] td[2]").text.strip
      #end
    #end
    
end