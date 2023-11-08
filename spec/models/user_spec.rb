require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }
  before { user.save }
  it 'is valid' do
    expect(user).to be_valid
  end
  it 'is not vaild when user name is not present' do
    user.name = nil
    expect(user).not_to be_valid
  end
  it 'is not vaild when posts counter is negative' do
    user.posts_counter = -2
    expect(user).not_to be_valid
  end
  it 'is display three recent post' do
    5.times do
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
    end
    posts = user.recent_post
    expect(posts.length).to eq(3)
  end
end
