class Character
  attr_accessor :name, :debut, :profile_url, :homeworld, :affiliation, :gender
  
  @@all = []

  def initialize(character_hash)
    character_hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_collection(characters_array)
    characters_array.each {|character| Character.new(character)}
  end

  #def add_character_attributes(attributes_hash)
    #attributes_hash.each {|k, v| self.send("#{k}=", v)}
  #end

  def self.all
    @@all
  end
  
end