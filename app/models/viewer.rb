class Viewer
  attr_accessor :first_name, :last_name

  @@all = []
  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
    @@all << self
  end

  def self.all
  # should return all of the viewers
    @@all
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.find_by_name(name)
  # given a string of a full name, returns the first customer whose full name matches
    self.all.find {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
  # given a score and a movie, creates a new Rating and associates it with that viewer and that movie
    new_rating = Rating.new(score, movie, self)
  end
end
