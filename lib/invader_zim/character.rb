class Game
  
  attr_accessor :name, :debut, :character_page
  @@all = []

  def initialize
     @@all << self
  end

  def self.all
    @@all
  end

end