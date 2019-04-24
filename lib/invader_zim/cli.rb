class InvaderZim::CLI 
  
  
  def call
    puts `clear`
    make_characters
    introduction
    menu
  end
  
  def introduction
    CatpixMini::print_image "girgood.gif",
    :limit_x => 1,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
    sleep(3)
    
    puts CLIColorize.colorize("Welcome human! It is I, ZIM!", :green).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("Type in your name so I can check if you are WORTHY of being friends with ZIM." , :green).strip
    puts ""
    input = gets.strip
    @@human = Human.new(input)
    puts ""
    sleep (3)
    puts CLIColorize.colorize("Computer, give me all the information you have on #{@@human.name}.", :green).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("#{@@human.name} is a disgruntled human.", :white).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("Continue.", :green).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("Insufficient data.", :white).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("Insufficient data? Can't you just make an educated guess?", :green).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("O... kay... Um, #{@@human.name} was born in a year between 1940 and.....now to, uh... demons, and trained to... uh, I dunno, fight... ninjas and rain DOOM?", :white).strip
    puts ""
    sleep(6)
    
    puts CLIColorize.colorize("I KNEW IT!", :green).strip
    puts ""
    sleep(4)
    
    puts CLIColorize.colorize("Congratulations #{@@human.name}. I have checked your AMAZINGNESS and found you to be WORTHY, SO VERY WORTHY, to be friends with ZIM! Praise you! PRAISE YOU!!!", :green)
    puts ""
    sleep(8)
    
    puts CLIColorize.colorize("Follow us to the secret lair #{@@human.name}.", :green)
    puts ""
    sleep(7)
    puts `clear`
    CatpixMini::print_image "zim_and_gir.gif",
    :limit_x => 1,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
    puts CLIColorize.colorize("*You stand on the platform and start descending*" , :white)
    puts ""
    sleep(8)
    
    puts `clear`
    puts CLIColorize.colorize("Would you like to learn more about the amazingness that is me, ZIM, or another, far less superior character?" , :green)
    puts ""
    sleep(5)
  end
  
  def menu
    puts `clear`
    show_characters_list
    puts CLIColorize.colorize("#{@@human.name}, choose a character's number from the list and hit enter.", :blue)
    input = gets.strip
    character = Character.find(input.to_i)
    add_attributes_to_characters(character)
    show_character(character)
  end
  
  
  
  def show_character(character)
     puts `clear`
     puts "Name:  #{character.name}"
     puts ""
     puts "Episode Debut:  #{character.debut}"
     puts ""
     puts "Character Information:  #{character.information}"
     sleep(7)
     puts ""
     puts CLIColorize.colorize("Would you like to know some Facts of Doom!? Enter Y or N", :red).strip
     
     input = gets.strip.downcase
       puts ""
     if input == "y"
       CatpixMini::print_image "girdisguise.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       puts CLIColorize.colorize("Yay-I'm gonna' be sick!", :yellow).strip
       sleep(5)
       puts `clear`
       puts "Facts of Doom: #{character.facts_of_doom}"
       sleep(10)
       puts ""
       puts CLIColorize.colorize("Would you like to gain more knowledges about a different character #{@@human.name}? Enter Y or N or Exit", :red).strip
     
        input = gets.strip.downcase
        if input == "y"
          CatpixMini::print_image "gir_red.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          puts CLIColorize.colorize("The knowledge, it fills me. It is neat.", :yellow).strip
          sleep(5)
          menu
        elsif input == "n"
          menu
        elsif input == "exit"
           puts `clear`
          CatpixMini::print_image "zim2.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          puts "No! You lie! YOU LIIIIIIIIIEEEEEEEEEE!!!!!"
          puts ""
          puts "*makes wild scratching motions with his arms*"
          sleep(5)
          exit
        else
          puts `clear`
          CatpixMini::print_image "gir_transformation.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          puts CLIColorize.colorize("Leprechauns!", :yellow).strip
          sleep(5)
          menu
        end
       
     elsif input == "n"
       puts ""
       CatpixMini::print_image "ms_bitters.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       puts "#{@@human.name}, your performance was miserable! Your parents will receive a phone call instructing them to love you less now."
       sleep(5)
       puts `clear`
       menu
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
  
  def show_characters_list
    characters = Character.all
    Character.all.each.with_index(1) do |character, index|
      puts CLIColorize.colorize("#{index}. #{character.name}", :red)
    end
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")
