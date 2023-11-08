module ApplicationHelper
  def truncate(text)
    text.length > 200 ? "#{text[0, 200]}..." : text
  end

  def user_already_liked?(post)
    post.likes.find_by(user_id: current_user.id)
  end
end
