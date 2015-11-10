require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:label) { Label.create!(name: 'Label') }
  let(:rating) { Rating.create!(severity: 'PG') }
  let(:new_rating) {Rating.create!(severity: 'R') }

  it { should belong_to :ratingable }
  it { should have_many :ratelings }
  it { should have_many :topics }
  it { should have_many :posts }

  describe "ratingable" do
    it "allows the same rating to be associated with a different topic and post" do
      topic.rating << rating
      post.rating << rating

      topic_rating = topic.rating[0]
      post_rating = post.rating[0]

      expect(topic_rating).to eql(post_rating)
    end
  end

  describe ".update_rating" do
    it "takes a new string and returns an updated Rating" do
      new_rating = self.update_rating(rating_string)
      expect(rating_string).to eq(new_rating)
    end
  end
end
