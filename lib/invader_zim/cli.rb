class InvaderZim::CLI 
  
  def call
    
    CatpixMini::print_image "zim.gif",
  :limit_x => 1,
  :limit_y => 0,
  :center_x => false,
  :center_y => false,
  :bg => "white",
  :bg_fill => false,
  :resolution => "high"
  
    puts CLIColorize.colorize('Welcome pitiful human! It is I, ZIM!', :red)
    puts CLIColorize.colorize("If you are here then no doubt you know of my AMAZINGNESS and wish to learn more from me, ZIM!", :red).strip
  end
  
end
  
  
#image = MiniMagick::Image.open("https://img00.deviantart.net/4fa9/i/2005/008/2/1/mini_moose_by_chunhyaeng.gif")
#image.contrast
#image.write("mini_moose1.gif")









#puts ""

#puts CLIColorize.colorize("Which one of our FILTHY characters would you like to know more about?", :red).strip
#puts ""
