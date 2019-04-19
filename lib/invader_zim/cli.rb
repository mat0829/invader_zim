class InvaderZim::CLI 
  
  
  def start
    make_characters
    add_attributes_to_characters
    
    introduction
    show_characters
  end
  
  
  def introduction
    CatpixMini::print_image "zim.gif",
    :limit_x => 0.4,
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
    puts ""
    sleep(4)
  
    puts CLIColorize.colorize("Would you like to learn more about the amazingness that is me, ZIM, or a different, far less superior character?", :red)
    puts ""
    sleep(4)
  end
  
  def show_characters
    puts CLIColorize.colorize("Welcome human! It is I, ZIM!", :red).strip
    characters = Character.all
    characters.each.with_index(1) do |character, i|
    puts "#{i}. #{character.name}"
    end
  end
  
  def make_characters
    characters_array = Scraper.scrape_index_page('index.html')
    Character.create_from_collection(characters_array)
  end
  
  def add_attributes_to_characters
    Character.all.each do |character|
      attributes = Scraper.scrape_profile_page(character)
      character.add_character_attributes(attributes)
    end
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")
