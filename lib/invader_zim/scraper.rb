require 'nokogiri'
require 'open-uri'
        
        
  class InvaderZim::Scraper

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
      character_page_traits = {} 

      character_table.each do |table|

        character_page_traits[:information] ||= table.css(".infobox tr td").text.strip.gsub(/[\n]/, '-')
        
          if character.name == "Zim"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[5..10].text.strip.gsub(/[\"\n\t]/, '') #if table.css(".mw-content-text ul li")[0..8]
          elsif
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[0..5].text.strip.gsub(/[\"\n\t]/, '') #if table.css(".mw-content-text ul li")[0..5]
          else
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[0..8].text.strip.gsub(/[\"\n\t]/, '') #if table.css(".mw-content-text ul li")[0..8]
          #character_page_traits[:personality] = table.css("p")[6].text.gsub(/[\"\n]/, '') if table.css("p")[6]
          end
        end
      character_page_traits
    end
    
  end
  