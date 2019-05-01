class InvaderZim::CLI 
  
  
  def call
    system "clear"
    make_characters
    introduction
    menu
  end
  
  def introduction
    print_image("zim.gif")
    sleep(2)
    puts CLIColorize.colorize("Greetings human! It is I, ZIM!\n", :green).strip
    sleep(3)
    
    puts CLIColorize.colorize("Type in your name so I can check if you are WORTHY of being friends with ZIM.\n" , :green).strip
    input = gets.strip
    @human = InvaderZim::Human.new(input)
    puts CLIColorize.colorize("\nIf you would like to skip the introduction type 'skip' and hit Enter or type any key and Enter to continue.\n" , :white).strip
    input = gets.strip.downcase
    if input == "skip"
      system "clear"
      print_image("zim.gif")
    sleep(2)
      puts CLIColorize.colorize("\nOh, it's you #{@human.name}! I didn't recognize you my most worthy friend! Head down to the secret lair to some rain DOOM upon the DOOMED heads of our DOOMED enemies!" , :green)
    sleep(6)
      menu
    else
    system "clear"
    print_image("zim.gif")
    sleep(2)
    puts CLIColorize.colorize("\nComputer, give me all the information you have on #{@human.name}.\n", :green).strip
    sleep(3)
    
    puts CLIColorize.colorize("#{@human.name} is a disgruntled human.\n", :red).strip
    sleep(3)
    
    puts CLIColorize.colorize("Continue.\n", :green).strip
    sleep(3)
    
    puts CLIColorize.colorize("Insufficient data.\n", :red).strip
    sleep(3)
    
    puts CLIColorize.colorize("Insufficient data? Can't you just make an educated guess?\n", :green).strip
    sleep(3)
    
    puts CLIColorize.colorize("O... kay... Um, #{@human.name} was born in a year between 1940 and.....now to, uh... demons, and trained to... uh, I dunno, fight... ninjas and rain DOOM?\n", :red).strip
    sleep(5)
    
    puts CLIColorize.colorize("I KNEW IT!\n", :green).strip
    sleep(3)
    
    puts CLIColorize.colorize("Congratulations #{@human.name}. I have checked your AMAZINGNESS and found you to be WORTHY, SO VERY WORTHY, to be friends with ZIM! Praise you! PRAISE YOU!!!\n", :green)
    sleep(5)
    
    puts CLIColorize.colorize("Follow us to the secret lair #{@human.name}.\n", :green)
    sleep(4)
    system "clear"
    print_image("zim_and_gir.gif")
    puts CLIColorize.colorize("*You stand on the platform and start descending*\n" , :white)
    sleep(8)
    
    system "clear"
    puts CLIColorize.colorize("#{@human.name}, would you like to learn more about the amazingness that is me, ZIM, or a   different, far less superior character?" , :green)
    sleep(5)
    end
  end
  
  def menu
    system "clear"
    show_characters_list
    puts CLIColorize.colorize("\n#{@human.name}, choose a character's number from the list and hit enter.", :red)
    input = gets.strip.to_i
    
    if input.between?(1,14)
      character = InvaderZim::Character.find(input.to_i)
      add_attributes_to_characters(character)
      show_character(character)
    else 
      system "clear"
      print_image("almighty_tallest.gif")
      sleep(3)
      puts CLIColorize.colorize("Almighty Tallest Purple: 'What are you doing?'\n" , :magenta)
      sleep(4)
      puts CLIColorize.colorize("Almighty Tallest Red: 'I am running a diagnostic to find the problem! YOU! Save the doughnuts!'\n" , :red)
      sleep(4)
      puts CLIColorize.colorize("Almighty Tallest Red: 'I found the problem. #{@human.name} put in something other then 1 to 14.'\n" , :red)
      sleep(4)
      puts CLIColorize.colorize("Tallest Purple: '#{@human.name}, You should have tried harder!'\n" , :magenta)
      sleep(4)
      menu
    end
  end
  
  
  
  def show_character(character)
     system "clear"
     print CLIColorize.colorize("Name:", :red).strip
     puts CLIColorize.colorize(" #{character.name}\n", :cyan).strip
     if character.name == "Professor Membrane" || character.name == "Ms. Bitters" || character.name == "Recap Kid"
      print CLIColorize.colorize("Homeworld:", :red).strip
      puts CLIColorize.colorize(" Earth", :cyan).strip
     elsif character.name == "GIR" || character.name == "Minimoose" || character.name == "Roboparents"
      print CLIColorize.colorize("Homeworld:", :red).strip
      puts CLIColorize.colorize(" Irk", :cyan).strip
     else
      print CLIColorize.colorize("Homeworld:", :red).strip
      puts CLIColorize.colorize(" #{character.homeworld}", :cyan).strip
     end
     print CLIColorize.colorize("\nGender:", :red).strip
     puts CLIColorize.colorize(" #{character.gender}\n", :cyan).strip
     if character.affliation == ""
      print CLIColorize.colorize("Affliation:", :red).strip
      puts CLIColorize.colorize(" None", :cyan).strip
     else
      print CLIColorize.colorize("Affliation:", :red).strip
      puts CLIColorize.colorize(" #{character.affliation}\n", :cyan).strip
     end
     print CLIColorize.colorize("Debut:", :red).strip
     puts CLIColorize.colorize("  #{character.debut}\n", :cyan).strip
     puts CLIColorize.colorize("Introduction:", :red).strip
     puts CLIColorize.colorize("   #{character.introduction}\n", :cyan).strip
     puts CLIColorize.colorize("Appearance:", :red).strip
     puts CLIColorize.colorize("   #{character.appearance}\n", :cyan).strip
     sleep(3)
     puts CLIColorize.colorize("#{@human.name}, would you like to know some Facts of Doom!? Enter Y or N", :red).strip
     
     input = gets.strip.downcase
       puts ""
     if input == "y"
       system "clear"
       print_image("girdisguise.gif")
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
         sleep(3)
       else
         puts CLIColorize.colorize("Facts of Doom:", :red).strip
         puts CLIColorize.colorize("   #{character.facts_of_doom}", :cyan).strip
         sleep(3)
       end
       
       puts ""
       puts CLIColorize.colorize("#{@human.name}, would you like to gain more knowledge about a different character? Enter Y or N", :red).strip
     
        input = gets.strip.downcase
        if input == "y"
          system "clear"
          print_image("gir_red.gif")
          puts ""
          puts CLIColorize.colorize("The knowledge, it fills me. It is neat.", :yellow).strip
          sleep(6)
          menu
        elsif input == "n"
           system "clear"
          print_image("zim2.gif")
          puts CLIColorize.colorize("No! You lie! YOU LIIIIIIIIIEEEEEEEEEE!!!!!", :green).strip
          puts ""
          puts "*makes wild scratching motions with his arms*"
          sleep(5)
          exit
        else
          system "clear"
          print_image("gir_transformation.gif")
          sleep(3)
          puts CLIColorize.colorize("Leprechauns!", :yellow).strip
          sleep(6)
          menu
        end
       
     elsif input == "n"
       system "clear"
       print_image("ms_bitters.gif")
       puts ""
       puts CLIColorize.colorize("#{@human.name}, your performance was miserable! Your parents will receive a phone call instructing them to love you less.", :magenta).strip
       sleep(6)
       menu
     else
       system "clear"
       print_image("mini_moose.gif")
       puts CLIColorize.colorize("You have entered an incorrect key. Minimoose judges you. The Shame....", :white).strip
       sleep(6)
       menu
     end
  
  end
  
  def make_characters
    characters_array = InvaderZim::Scraper.scrape_index_page('index.html')
    InvaderZim::Character.create_from_collection(characters_array)
  end
  
  def add_attributes_to_characters(character)
    #Character.all.each do |character|
      attributes = InvaderZim::Scraper.scrape_profile_page(character)
      character.add_character_attributes(attributes)
    #end
  end
  
  def show_characters_list
    characters = InvaderZim::Character.all
    InvaderZim::Character.all.each.with_index(1) do |character, index|
      puts CLIColorize.colorize("#{index}. #{character.name}", :cyan)
    end
  end
  
  def print_image(img)
    CatpixMini::print_image img,
    :limit_x => 1,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "white",
    :bg_fill => false,
    :resolution => "high"
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")
