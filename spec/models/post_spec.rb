require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

  describe "attributes" do

    it "should respond to title" do
      expect(post).to respond_to(:title)
    end

    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end

  describe "spam_id" do

    it "sets post[:title] for every fifth post to expected_title" do
      expected_title = "SPAM"
      expect(post[:title]).to eq(title: expected_title)
    end
  end
end
