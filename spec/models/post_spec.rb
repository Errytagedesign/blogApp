require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.new(author: user, title: 'Hello', text: 'This is my first post') }
  before { post.save }
  it 'is valid' do
    expect(post).to be_valid
  end
  it 'is not vaild when user is not present' do
    post.author = nil
    expect(post).not_to be_valid
  end

  it 'is not vaild when title is not present' do
    post.title = nil
    expect(post).not_to be_valid
  end
  it 'is not vaild when title lenth is over 250 characters' do
    post.title = 'm' * 300
    expect(post).not_to be_valid
  end
  it 'is not vaild when comments counter is negative' do
    post.comments_counter = -1
    expect(post).not_to be_valid
  end
  it 'is not vaild when like counter is negative' do
    post.likes_counter = -2
    expect(post).not_to be_valid
  end

  it 'is display five recent comment' do
    10.times do
      Comment.create(post:, user:, text: 'Hi Tom!')
    end
    comments = post.recent_comments
    expect(comments.length).to eq(5)
  end
  it 'increments the post_counter of the associated user' do
    expect { post.send(:update_post_counter) }.to change { user.reload.posts_counter }.by(1)
  end
end
