class Rating < ActiveRecord::Base

  belongs_to :ratingable, polymorphic: true
  has_many :ratelings
  has_many :topics, through: :ratelings, source: :ratingable, source_type: :Topic
  has_many :posts, through: :ratelings, source: :ratingable, source_type: :Post

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    new_rating = []
    unless rating_string.nil? || rating_string.empty?
      rating_change = Rating.find_or_create_by(severity: rating_severity)
      new_rating << rating_change
    end
  end
  new_rating
end
