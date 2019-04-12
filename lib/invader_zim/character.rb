class Character
  attr_accessor :name, :debut, :character_url, :homeworld, :affiliation, :gender
  @@all = []

  def initialize(name, debut, character_url, homeworld, affiliation, gender)
     @name = name
     @debut = debut
     @character_url = character_url
     @homeworld = homeworld
     @affiliation = affiliation
     @gender = gender
     @@all << self
  end
  
  def self.all
    @@all
  end

end
