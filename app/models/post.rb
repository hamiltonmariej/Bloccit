class Post < ActiveRecord::Base
  has_many :comments

  def spam_id
    Post.where(post_id % 5 == 4).find_each do |post|
      title.update!("SPAM")
    end
  end


  # def spam_id
  #   @posts = Post.all
  #   @posts.each_with_index do |post, index|
  #     if index % 5 == 4
  #       post.update_attributes(title: 'SPAM')
  #     end
  #   end
  # end
end
