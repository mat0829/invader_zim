class Character
  attr_accessor :name, :debut, :character_url, :homeworld, :affiliation, :gender
  @@all = []

  def initialize(character_array)
    @@all << self
  end
  
  def self.create_from_collection(character_array_array)
    character_array.each {|character| Character.new(character)}
  end

  def self.all
    @@all
  end
  
  def self.create_from_collection(students_array)
    students_array.each {|student| Student.new(student)}
  end

end