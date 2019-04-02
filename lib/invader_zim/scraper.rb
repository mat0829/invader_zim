        require 'nokogiri'
        require 'open-uri'
        
        
        
        def Scraper

        doc = Nokogiri::HTML(open("https://zim.fandom.com/wiki/Characters"))
        character_info = doc.css(".wikia-gallery-item")
        character_array = []
    
        character_info.each do |character|
          
         name => character.css(".lightbox-caption center b a[href]").text,
         debut => character.css("[href]")[2].text,
         character_page => "www.zim.fandom.com" + character.css("b a").map { |anchor| anchor["href"] }.first
    
        # game_object = self.new
        # home_and_team = game.css("div.game-info").text.split
        # game_object.team = home_and_team[1]
        # game_object.home = home_and_team[0]
        # game_object.date =  game.css("div.game-date").text
        # game_object.score = game.css("div.score").text
        # game_object.result = game.css("div.game-result").text
      
     
    end
 
#end
        
        