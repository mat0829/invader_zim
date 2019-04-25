class InvaderZim::CLI 
  
  
  def call
    system "clear"
    make_characters
    introduction
    menu
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
    sleep(2)
    puts CLIColorize.colorize("Greetings human! It is I, ZIM!", :green).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("Type in your name so I can check if you are WORTHY of being friends with ZIM." , :green).strip
    puts ""
    input = gets.strip
    @human = Human.new(input)
    puts ""
    sleep (1)
    puts CLIColorize.colorize("Computer, give me all the information you have on #{@human.name}.", :green).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("#{@human.name} is a disgruntled human.", :red).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("Continue.", :green).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("Insufficient data.", :red).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("Insufficient data? Can't you just make an educated guess?", :green).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("O... kay... Um, #{@human.name} was born in a year between 1940 and.....now to, uh... demons, and trained to... uh, I dunno, fight... ninjas and rain DOOM?", :red).strip
    puts ""
    sleep(5)
    
    puts CLIColorize.colorize("I KNEW IT!", :green).strip
    puts ""
    sleep(3)
    
    puts CLIColorize.colorize("Congratulations #{@human.name}. I have checked your AMAZINGNESS and found you to be WORTHY, SO VERY WORTHY, to be friends with ZIM! Praise you! PRAISE YOU!!!", :green)
    puts ""
    sleep(5)
    
    puts CLIColorize.colorize("Follow us to the secret lair #{@human.name}.", :green)
    puts ""
    sleep(4)
    system "clear"
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
    
    system "clear"
    puts CLIColorize.colorize("#{@human.name}, would you like to learn more about the amazingness that is me, ZIM, or another, far less superior character?" , :green)
    puts ""
    sleep(5)
  end
  
  def menu
    system "clear"
    show_characters_list
    puts ""
    puts CLIColorize.colorize("#{@human.name}, choose a character's number from the list and hit enter.", :red)
    input = gets.strip.to_i
    
    if input.between?(1,14)
      character = Character.find(input.to_i)
      add_attributes_to_characters(character)
      show_character(character)
    else 
      system "clear"
      CatpixMini::print_image "almighty_tallest.gif",
      :limit_x => 1,
      :limit_y => 0,
      :center_x => false,
      :center_y => false,
      :bg => "white",
      :bg_fill => false,
      :resolution => "high"
      sleep(3)
      puts CLIColorize.colorize("Almighty Tallest Purple: 'What are you doing?'" , :magenta)
      puts ""
      sleep(4)
      puts CLIColorize.colorize("Almighty Tallest Red: 'I am running a diagnostic to find the problem! YOU! Save the doughnuts!'" , :red)
      puts ""
      sleep(4)
      puts CLIColorize.colorize("Almighty Tallest Red: 'I found the problem. #{@human.name} put in something other then 1 to 14.'" , :red)
      puts ""
      sleep(4)
      puts CLIColorize.colorize("Tallest Purple: '#{@human.name}, You should have tried harder!'" , :magenta)
      puts ""
      sleep(4)
      menu
    end
  end
  
  
  
  def show_character(character)
     system "clear"
     puts CLIColorize.colorize("Name:  #{character.name}", :cyan).strip
     puts ""
     puts CLIColorize.colorize("Episode Debut:  #{character.debut}", :cyan).strip
     puts ""
     puts CLIColorize.colorize("Character Information:  #{character.information}", :cyan).strip
     sleep(5)
     puts ""
     puts CLIColorize.colorize("#{@human.name}, would you like to know some Facts of Doom!? Enter Y or N", :red).strip
     
     input = gets.strip.downcase
       puts ""
     if input == "y"
       system "clear"
       CatpixMini::print_image "girdisguise.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       puts CLIColorize.colorize("Yay! I'm gunna sing The Doom Song now!", :yellow).strip
       sleep(3)
       puts ""
       puts CLIColorize.colorize("Doom doom doom doom doom, doom doom do DOOM, DOOOM doom do-doom, DOOM do-doom doom doooom, doom doom dooom, do-do-DOOOM!", :yellow).strip
       sleep(5)
       puts ""
       puts CLIColorize.colorize("(6 months later...)", :white).strip
       sleep(3)
       puts ""
       puts CLIColorize.colorize("Doom doom doo doom doom, DOOMY-DOOMY-DOOM, doom do do DOOM, Do do DOOM, doomy-doomy-doomy, Doom doom doom THE END." , :yellow).strip
       sleep(6)
       system "clear"
       if character.facts_of_doom == ""
         puts CLIColorize.colorize("Sorry #{@human.name}, this character has no Facts of Doom.", :red).strip
         sleep(5)
       else
         puts CLIColorize.colorize("Facts of Doom:                                                                      #{character.facts_of_doom}", :cyan).strip
         sleep(10)
       end
       
       puts ""
       puts CLIColorize.colorize("#{@human.name}, would you like to gain more knowledges about a different character? Enter Y or N", :red).strip
     
        input = gets.strip.downcase
        if input == "y"
          system "clear"
          CatpixMini::print_image "gir_red.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          puts ""
          puts CLIColorize.colorize("The knowledge, it fills me. It is neat.", :yellow).strip
          sleep(6)
          menu
        elsif input == "n"
           system "clear"
          CatpixMini::print_image "zim2.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          puts CLIColorize.colorize("No! You lie! YOU LIIIIIIIIIEEEEEEEEEE!!!!!", :green).strip
          puts ""
          puts "*makes wild scratching motions with his arms*"
          sleep(6)
          exit
        else
          system "clear"
          CatpixMini::print_image "gir_transformation.gif",
          :limit_x => 1,
          :limit_y => 0,
          :center_x => false,
          :center_y => false,
          :bg => "white",
          :bg_fill => false,
          :resolution => "high"
          sleep(3)
          puts CLIColorize.colorize("Leprechauns!", :yellow).strip
          sleep(6)
          menu
        end
       
     elsif input == "n"
       system "clear"
       CatpixMini::print_image "ms_bitters.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       puts ""
       puts CLIColorize.colorize("#{@human.name}, your performance was miserable! Your parents will receive a phone call instructing them to love you less.", :magenta).strip
       sleep(6)
       menu
     else
       system "clear"
       CatpixMini::print_image "mini_moose.gif",
       :limit_x => 1,
       :limit_y => 0,
       :center_x => false,
       :center_y => false,
       :bg => "white",
       :bg_fill => false,
       :resolution => "high"
       puts CLIColorize.colorize("You have entered an incorrect key. Minimoose judges you. The Shame....", :white).strip
       sleep(6)
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
      puts CLIColorize.colorize("#{index}. #{character.name}", :cyan)
    end
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")
