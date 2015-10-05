class Post < ActiveRecord::Base
  has_many :comments

  # def spam_id
  #   Post.where(post_id % 5 == 0).find_each do |post|
  #     title.update!("SPAM")
  #   end
  # end


  def self.set_spam_titles
    @posts = Post.all
    @posts.each_with_index do |post, index|
      count = index + 1
      if count % 5 == 0
        post.update_attributes(title: 'SPAM')
      end
    end
  end
end
