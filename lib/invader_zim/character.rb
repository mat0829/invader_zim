class Character
  attr_accessor :name, :debut, :profile_url, :homeworld, :affiliation, :gender
  
  @@all = []

  def initialize(name = nil, debut = nil, character_url = nil, homeworld = nil, affiliation = nil, gender = nil)
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