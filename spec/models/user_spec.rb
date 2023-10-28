require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}

  before{user.save}

  it 'If user is created' do
    expect(user).to be_valid
  end

  it 'New user should have a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'Invalid when post counter is negative' do
    user.posts_counter = -3
    expect(user).not_to be_valid
  end

  it 'Valid when post counter is 0 or more' do
    user.posts_counter = 1
    expect(user).to be_valid
  end


  it 'To dispaly recent post not more than 3' do

    10.times do
      Post.create(author: user, title: 'Hello', text: 'This is my first post')
    end

    recentPost = user.recent_posts
    expect(recentPost.length).to eq(3)
  end


end
