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
