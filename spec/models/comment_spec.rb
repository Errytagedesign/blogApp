require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comment_counter' do
    let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    let(:post) { Post.new(author: user, title: 'Hello', text: 'This is my first post') }

    let(:comment) { Comment.new(post:, user:, text: 'Hi Tom!') }

    before { comment.save }

    it 'increments the comment_counter of the associated user' do
      expect { comment.send(:update_comments_counter) }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
