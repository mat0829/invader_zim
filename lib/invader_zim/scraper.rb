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

   character_table = doc.css(".WikiaArticle")
   character_page_traits = {} # NOW AN OBJECT NOT AN ARRAY! END GAME FOR THIS METHOD IS A HASH OF ATTRIBUTES, NOT AN ARRAY WITH A HASH OF ATTRIBUTES, NOR A HASH WITH ANOTHER HASH OF ATTRIBUTES

   character_table.each do |table|
     # character_page_traits << { # SO WE DON'T WANT TO PUT ANOTHER HASH INSIDE IT, REALLY
       # :introduction => table.css("p")[2].text.strip.gsub(/[\"\n\u00A0]/, ' '),
       # :appearence => table.css("p")[4].text.gsub(/[\"\n]/, ''),
       # :personality => table.css("p")[6].text.gsub(/[\"\n]/, '')
     # }



  # INSTEAD, LET'S DIRECTLY ADD NEW KEY/VALUE PAIRS TO OUR NICE NEW CHARACTER_PAGE_TRAITS HASH

     character_page_traits[:information] = table.css(".infobox tr td").text.strip.gsub(/[\n]/, '-')
     #character_page_traits[:appearence] = table.css("p")[4].text.gsub(/[\"\n]/, '')
     #character_page_traits[:personality] = table.css("p")[6].text.gsub(/[\"\n]/, '') if table.css("p")[6]

# LOOKS LIKE SOMETIMES THERE IS NO PERSONALITY p SO WE'LL CHECK TO SEE IF IT EXISTS - WE'LL ONLY ADD A :personality KEY IF THE p EXISTS ON THE WEB PAGE
   end

   character_page_traits

 end
    
end
  