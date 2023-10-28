class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increament!(:posts_counter)
  end
end
