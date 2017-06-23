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
