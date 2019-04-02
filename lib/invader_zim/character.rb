class Character
  attr_accessor :name
  @@all = []

  def initialize(character_array)
    @@all << self
  end

  def self.all
    @@all
  end

end