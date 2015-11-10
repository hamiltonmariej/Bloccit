require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatingsHelper. For example:
#
# describe RatingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RatingsHelper, type: :helper do
  describe "ratings_to_buttons" do
    it "turns ratings into HTML buttons"
    PG = Rating.create!(severity: "PG")
    R = Rating.create!(severity: "R")
    expected_html = '<a class="btn-lg btn-primary" href="/ratings/PG">PG</a> <a class="btn-lg btn-primary" href="/ratings/R">R</a>'
    expect(ratings_to_buttons(PG, R)).to eq expected_html
  end
end
