module RatingsHelper
  def ratings_to_buttons(ratings)
    raw rating.map { |r| link_to r.severity, rating_path(id: r.id), class: 'btn-lg btn-primary' }
  end
end
