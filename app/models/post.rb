class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter

  validates :title, presence: true
  validates :title, length: {maximu: 250}
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increament!(:posts_counter)
  end
end
