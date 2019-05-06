class InvaderZim::Character
  attr_accessor :name, :homeworld, :gender, :affliation, :debut, :profile_url, :introduction, :appearance, :facts_of_doom
  
  @@all = []

  def initialize(character_hash)
    character_hash.each {|k, v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.create_from_collection(characters_array)
    characters_array.each {|character| InvaderZim::Character.new(character)}
  end

  def add_character_attributes(attributes_hash)
    attributes_hash.each {|k, v| self.send("#{k}=", v)}
  end
  
  def add_attributes_to_characters(character)
      attributes = InvaderZim::Scraper.scrape_profile_page(character)
      character.add_character_attributes(attributes)
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def self.all
    @@all
  end
  
end