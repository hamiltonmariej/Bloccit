module SessionsHelper
  def create_session(user)
    session[:user_id] = user.id
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_has_posts_or_comments?(current_user)
    if !(post.current_user.present? || comment.current_user.present?)
      "{user.name} has not submitted any posts yet."
    end
  end
end
