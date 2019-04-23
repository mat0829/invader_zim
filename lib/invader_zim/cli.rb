class InvaderZim::CLI 
  
  
  def call
    puts `clear`
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
    sleep(3)
    puts CLIColorize.colorize("Welcome human! It is I, ZIM!", :green).strip
    puts ""
    sleep(4)
    puts CLIColorize.colorize("Type in your name human so I can check your worthiness." , :green).strip
    puts ""
    input = gets.strip
    $human = Human.new(input)
    puts CLIColorize.colorize("Congratulations #{$human.name}. I have checked your AMAZINGNESS and found you to be at a suitable level to be friends with ZIM! Praise you! PRAISE YOU!!!", :green)
    sleep(5)
    puts CLIColorize.colorize("If you are here #{$human.name} then no doubt you know of my AMAZINGNESS and wish to learn more from me, ZIM!", :green)
    sleep(4)
    puts CLIColorize.colorize("Would you like to learn more about the amazingness that is me, ZIM, or another, far less superior character?" , :green)
    sleep(5)
  end
  
  def menu
    puts `clear`
    show_characters_list
    puts ""
    puts CLIColorize.colorize("#{$human.name}, choose a character's number from the list and hit enter.", :blue)
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
       puts CLIColorize.colorize("Would you like to gain more knowledges about a different character #{$human.name}? Enter Y or N or Exit", :red).strip
     
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
          puts "No! You lie! [makes wild scratching motions with his arms] YOU LIIIIIIIIIEEEEEEEEEE!!!!!"
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
       puts "Children, your performance was miserable! Your parents will all receive phone calls instructing them to love you less now."
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
