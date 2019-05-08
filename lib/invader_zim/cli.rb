class InvaderZim::CLI 
  
  def call
    system "clear"
    InvaderZim::Character.make_characters
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
      sleep(6)
    
      system "clear"
      puts CLIColorize.colorize("#{@human.name}, would you like to learn more about the amazingness that is me, ZIM, or a     different, far less superior character?" , :green)
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
      if character.homeworld == nil
        character.add_attributes_to_characters(character)
        show_character(character)
      else
        show_character(character)
      end
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
      puts CLIColorize.colorize(" None\n", :cyan).strip
     else
      print CLIColorize.colorize("Affliation:", :red).strip
      puts CLIColorize.colorize(" #{character.affliation}\n", :cyan).strip
     end
     print CLIColorize.colorize("Debut:", :red).strip
     puts CLIColorize.colorize(" #{character.debut}\n", :cyan).strip
     puts CLIColorize.colorize("Introduction:", :red).strip
     puts CLIColorize.colorize("   #{character.introduction}\n", :cyan).strip
     puts CLIColorize.colorize("Appearance:", :red).strip
     puts CLIColorize.colorize("   #{character.appearance}\n", :cyan).strip
     sleep(3)
     puts CLIColorize.colorize("#{@human.name}, would you like to know some Facts of Doom!? Enter Y or N", :red).strip
     
     input = gets.strip.downcase
     if input == "y"
       system "clear"
       print_image("girdisguise.gif")
       puts CLIColorize.colorize("Yay! I'm gunna sing The Doom Song now!\n", :yellow).strip
       sleep(3)
       puts CLIColorize.colorize("Doom doom doom doom doom, doom doom do DOOM, DOOOM doom do-doom, DOOM do-doom doom doooom, doom doom dooom, do-do-DOOOM!\n", :yellow).strip
       sleep(5)
       puts CLIColorize.colorize("(6 months later...)\n", :white).strip
       sleep(3)
       puts CLIColorize.colorize("Doom doom doo doom doom, DOOMY-DOOMY-DOOM, doom do do DOOM, Do do DOOM, doomy-doomy-doomy, Doom doom doom THE END." , :yellow).strip
       sleep(6)
       system "clear"
       if character.facts_of_doom == ""
         puts CLIColorize.colorize("Sorry #{@human.name}, this character has no Facts of Doom.", :red).strip
         sleep(3)
       else
         puts CLIColorize.colorize("Facts of Doom:", :red).strip
         puts CLIColorize.colorize("   #{character.facts_of_doom}\n", :cyan).strip
         sleep(3)
       end
       
       puts CLIColorize.colorize("#{@human.name}, would you like to gain knowledge about a different character? Enter Y or N", :red).strip
     
        input = gets.strip.downcase
        if input == "y"
          system "clear"
          print_image("gir_red.gif")
          puts CLIColorize.colorize("\nThe knowledge, it fills me. It is neat.", :yellow).strip
          sleep(5)
          menu
        elsif input == "n" || input == "exit"
           system "clear"
          print_image("zim2.gif")
          puts CLIColorize.colorize("Nooooo! You lie! YOU LIIIIIIIIIEEEEEEEEEE!!!!!\n", :green).strip
          puts "*makes wild scratching motions with his arms*"
          sleep(5)
          exit
        else
          system "clear"
          print_image("gir_transformation.gif")
          sleep(3)
          puts CLIColorize.colorize("Leprechauns!", :yellow).strip
          sleep(5)
          menu
        end
       
     elsif input == "n"
       system "clear"
       print_image("ms_bitters.gif")
       puts CLIColorize.colorize("\n#{@human.name}, your performance was miserable! Your parents will get a phone call instructing them to love you less.\n", :magenta).strip
       sleep(5)
       system "clear"
       puts CLIColorize.colorize("#{@human.name}, would you like to learn about a different character? Enter Y or N", :red).strip
       
       input = gets.strip.downcase
       if input == "y"
         print_image("recap_kid.gif")
         puts CLIColorize.colorize("Previously at Invader Zim'm Secret Lair...", :white).strip
         sleep(4)
         menu
       elsif input == "n" || input == "exit"
         system "clear"
         print_image("sad_gir.gif")
         puts CLIColorize.colorize("\nWhy!? Why!? I loveded you! I loveded you!\n", :white).strip
         sleep(5)
         exit
       else
         system "clear"
         print_image("professor.gif")
         puts CLIColorize.colorize("[transmitting from his lab on a floating monitor]\n", :white).strip
         sleep(3)
         puts CLIColorize.colorize("I'm sorry, but I'm very busy right now.\n", :red).strip
         sleep(3)
         puts CLIColorize.colorize("We're testing some highly unstable- \n", :red).strip
         sleep(3)
         puts CLIColorize.colorize("[gasps, alerts going off]\n", :white).strip
         sleep(3)
           puts CLIColorize.colorize("OH NO!! YOU PRESSED AN INCORRECT KEY!!\n", :red).strip
         sleep(3)
         puts CLIColorize.colorize("[A large explosion occurs across town and the screen plays elevator music with  'Please Stand By' appearing]\n", :white).strip
         sleep(4)
         menu
       end
     else
       system "clear"
       print_image("mini_moose.gif")
       puts CLIColorize.colorize("You have entered an incorrect key. Minimoose judges you. The Shame....", :white).strip
       sleep(6)
       menu
     end
  
  end
  
  def show_characters_list
    characters = InvaderZim::Character.all
    characters.each.with_index(1) do |character, index|
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