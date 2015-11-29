require 'rails_helper'
require 'spec_helper'
include SessionsHelper

RSpec.describe "users/show.html.erb", type: :view do
  let(:current_user) { create(:user) }
  let(:user_post) { create(:post, topic: my_topic, user: other_user) }

  describe 'users/show.html.erb' do
    it 'displays current user favorited posts correctly' do
      assign(:post, Post.create(title: 'Testing', body: 'Testing this out.'))

      render

      rendered.should contain('Testing')
      rendered.should contain('Testing this out.')
    end

    it 'displays only the favorited posts of current user' do
      assign(:favorite, Favorite.create(post_id: @post, user_id: @user)

      render

      rendered.should contain(post_id: @post)
      rendered.should contain(user_id: @user)
    end

    it 'displays the user gravatar next to each favorited post' do
      assign(:avatar_url, User.create(avatar_url: @user))

      render

      rendered.should contain(avatar_url: @user)
    end

    it 'displays the count of votes and comments for author of favorited post' do
      assign(:vote, Vote.create(user_id: @user, user_post: @post, vote.count = 7, comment.count = 5)
    end
  end
end
