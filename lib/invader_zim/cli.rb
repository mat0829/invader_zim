class InvaderZim::CLI 
  
  
  def call
    make_characters
    introduction
    menu
  end
  
  def menu
    puts CLIColorize.colorize("Would you like to learn more about the amazingness that is me, ZIM, or another, far less superior character?", :red)
    sleep(4)
    show_characters_list
    puts CLIColorize.colorize("Choose a character's number from the list and hit enter.", :red)
    input = gets.strip
    character = Character.find(input.to_i)
    add_attributes_to_characters(character)
    show_character(character)
    
  end
  
  def introduction
    CatpixMini::print_image "zim.gif",
    :limit_x => 1,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
    sleep(3)
    puts CLIColorize.colorize("Welcome human! It is I, ZIM!", :red).strip
    puts ""
    sleep(4)
    puts CLIColorize.colorize("If you are here then no doubt you know of my AMAZINGNESS and wish to learn more from me, ZIM!", :red)
    sleep(4)
  end
  
  def show_characters_list
    characters = Character.all
    Character.all.each.with_index(1) do |character, index|
      puts CLIColorize.colorize("#{index}. #{character.name}", :green)
    end
  end
  
  def show_character(character)
     puts ""
     puts "Name:  #{character.name}"
     puts ""
     puts "Episode Debut:  #{character.debut}"
     puts ""
     puts CLIColorize.colorize("Would you like to know more even more!? Enter Y or N", :red).strip
     input = gets.strip.downcase
     if input == "y"
       CatpixMini::print_image "gir.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       sleep(3)
       puts CLIColorize.colorize("Would you like to gain more knowledges about a different character? Enter Y or N", :yellow).strip
      puts "Character Information: #{character.information}"
     elsif input == "n"
      puts ""
      puts "No! You lie! [makes wild scratching motions with his arms] YOU LIIIIIIIIIEEEEEEEEEE!!!!!"
      exit
     else
      puts ""
      puts "Have you the brain worms!? Let me try this again."
      menu
     end
     
     
     puts CLIColorize.colorize("Would you like to gain more knowledges about a different character? Enter Y or N", :red).strip
     
     input = gets.strip.downcase
     if input == "y"
      menu
     elsif input == "n"
      puts ""
      puts "No! You lie! [makes wild scratching motions with his arms] YOU LIIIIIIIIIEEEEEEEEEE!!!!!"
      exit
     else
      puts ""
      puts "Have you the brain worms!? Let me try this again."
      menu
     end
  end
  
  def make_characters
    characters_array = Scraper.scrape_index_page('index.html')
    Character.create_from_collection(characters_array)
  end
  
  def add_attributes_to_characters(character)
    #Character.all.each do |character|
      attributes = Scraper.scrape_profile_page(character)
      character.add_character_attributes(attributes)
    #end
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")
