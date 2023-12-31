require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
    let(:like) { Like.create(post:, user:) }

    it 'increments the likes_counter of the associated post' do
      expect { like.send(:update_likes_counter) }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
