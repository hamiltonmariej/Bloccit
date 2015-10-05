require 'rails_helper'

RSpec.describe Post, type: :model do
  20.times do
    Post.create(title: "New Post Title", body: "New Post Body")
  end
  let(:posts) {
    Post.all
  }

  describe "set_spam_titles" do

    it "sets post[:title] for every fifth post to expected_title" do
      Post.set_spam_titles
      expected_title = "SPAM"
      @posts = Post.all
      @posts.each_with_index do |post, index|
        count = index + 1
        if count % 5 == 0
            expect(post[:title]).to eq(expected_title)
        end
      end
    end
  end
end
