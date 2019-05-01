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
          
          case character.name
          when "GIR", "Professor Membrane", "Ms. Bitters", "Recap Kid", "Minimoose", "Roboparents"
            character_page_traits[:homeworld] ||= table.css("td")[1].text.strip.gsub(/[\n]/, '')
          else
            character_page_traits[:homeworld] ||= table.css("td")[3].text.strip.gsub(/[\n]/, '')
          end
          
          if character.name == "Dib Membrane" || character.name == "Gaz Membrane" || character.name == "Keef" || character.name == "Roboparents"
            character_page_traits[:gender] ||= table.css("td")[5].text.strip.gsub(/[\n]/, '')
          elsif character.name == "Zim" || character.name == "Invader Skoodge"
            character_page_traits[:gender] ||= table.css("td")[9].text.strip.gsub(/[\n]/, '')
          else
            character_page_traits[:gender] ||= table.css("td")[7].text.strip.gsub(/[\n]/, '')
          end
          
          if character.name == "Roboparents"
            character_page_traits[:affliation] ||= table.css("td")[9].text.strip.gsub(/[\n]/, '')
          elsif character.name == "GIR" || character.name == "Minimoose"
            character_page_traits[:affliation] ||= table.css("td")[9].text[13..15].strip.gsub(/[\n]/, '')
          elsif character.name == "Dib Membrane" || character.name == "Gaz Membrane" || character.name == "Keef"
            character_page_traits[:affliation] ||= table.css("td")[11].text.strip.gsub(/[\n]/, '')
          elsif character.name == "Almighty Tallest Red" || character.name == "Almighty Tallest Purple" || character.name == "Tak"
            character_page_traits[:affliation] ||= table.css("td")[13].text.strip.gsub(/[\n]/, '')
          elsif character.name == "Zim" || character.name == "Invader Skoodge"
            character_page_traits[:affliation] ||= table.css("td")[17].text.strip.gsub(/[\n]/, '')  
          else
            character_page_traits[:affliation] ||= table.css("td")[1].text.strip.gsub(/[\n]/, '')
          end
          
          
          if character.name == "Roboparents" || character.name == "Recap Kid" || character.name == "Ms. Bitters"
            character_page_traits[:introduction] ||= table.css("p")[0].text.strip.gsub(/[\n]/, ' ')
          elsif character.name == "Invader Skoodge"
            character_page_traits[:introduction] ||= table.css("p")[1].text.strip.gsub(/[\n]/, ' ').delete("\"")
          elsif character.name == "Keef"
            character_page_traits[:introduction] ||= table.css("p")[7].text.strip.gsub(/[\n]/, ' ').delete("\"")
          elsif character.name == "Gaz Membrane"
            character_page_traits[:introduction] ||= table.css("p")[7..9].text.strip.gsub(/[\n]/, ' ').delete("\"").delete("\u2019")
          else
            character_page_traits[:introduction] ||= table.css("p")[2].text.strip.gsub(/[\n]/, ' ').gsub(/[\u00A0\u00E1\u2019]/, ' ').delete("\"")#.delete("[1]")
          end
          
          if character.name == "Keef"
            character_page_traits[:appearance] ||= table.css("p")[2].text.gsub(/[\"\n]/, '')
          elsif character.name == "Dib Membrane" || character.name == "Invader Skoodge" || character.name == "Minimoose"
            character_page_traits[:appearance] ||= table.css("p")[3].text.gsub(/[\"\n]/, '')
          elsif character.name == "Gaz Membrane" || character.name == "Tak"
            character_page_traits[:appearance] ||= table.css("p")[5].text.gsub(/[\"\n]/, '')
          elsif character.name == "Recap Kid"
            character_page_traits[:appearance] ||= table.css("p")[3].text.gsub(/[\"\n]/, '').delete("[1]")
          else
            character_page_traits[:appearance] ||= table.css("p")[4].text.gsub(/[\"\n]/, '').delete("\u00A0").delete("\u00E4").delete("\u00ED")
          end
          
          if character.name == "Minimoose"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[0..5].text.strip.gsub(/[\"\n\t]/, '') 
          elsif character.name == "Zim"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[5..10].text.strip.gsub(/[\"\n\t]/, '') 
          elsif character.name == "Dib Membrane"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[26..30].text.strip.gsub(/[\"\n\t]/, '') 
          elsif character.name == "Gaz Membrane"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[4..8].text.strip.gsub(/[\"\n]/, '').delete("\t")
          elsif character.name == "Ms. Bitters" || character.name == "Almighty Tallest Purple" || character.name == "Keef"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[0..6].text.strip.gsub(/[\"\n]/, '').delete("[1]").delete("[2]").delete("[3]")
          elsif character.name == "Recap Kid"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[42..45].text.strip.gsub(/[\"\n]/, '').delete("[2]")
          elsif character.name == "Tak"
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[17..19].text.strip.gsub(/[\"\n]/, '').delete("\"")
          else
            character_page_traits[:facts_of_doom] ||= table.css(".mw-content-text ul li")[0..8].text.strip.gsub(/[\"\n\t]/, '')
          end
        end
      character_page_traits
    end
    
  end