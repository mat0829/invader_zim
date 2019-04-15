class Character
  attr_accessor :name, :debut, :profile_url
  
  @@all = []

  def initialize(name, debut, character_url)
     @name = name
     @debut = debut
     @character_url = character_url
     @@all << self
  end
  
  def self.all
    @@all
  end

end