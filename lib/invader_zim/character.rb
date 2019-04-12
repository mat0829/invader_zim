class Character
  attr_accessor :name, :debut, :character_url, :homeworld, :affiliation, :gender
  @@all = []

  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end

end
