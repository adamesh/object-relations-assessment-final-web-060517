# Please copy/paste all three classes into this file to submit your solution!
class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
  # returns an array of all movies
    @@all
  end

  def self.find_by_title(title)
  # given a string of movie title, returns the first movie that matches
    self.all.find {|movie| movie.title == title}
  end

  def ratings
  # returns an array of all ratings for that movie
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
  # should return all of the viewers who have left ratings for that movie.
    Rating.all.select {|rating| rating.viewer == self}
  end

  def average_rating
  # should return the average of all of the scores for the ratings of that particular movie.
    all_ratings = self.ratings.map {|rating| rating.score}
    all_ratings.inject{ |sum, rating| sum + rating }.to_f / all_ratings.size
  end

end

class Rating
  attr_accessor :score

  @@all = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all << self
  end

  def self.all
  #   returns all of the ratings
    @@all
  end

  def viewer
  # returns the viewer for that given rating
    @viewer
  end

  def movie
  # returns the movie for that given rating
    @movie
  end

end

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
