require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Henry', photo: 'https://www.google.com/', bio: 'Nice and smart guy')

  subject { Post.new(user:, title: 'Post title', text: 'Post text') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it ':recent_comments should return 5 recent comments' do
    5.times { Comment.create(user:, post: subject, text: 'Comment text') }
    expect(subject.recent_comments.size).to eq(5)
  end

  it ':increment_user_posts_count should increment user posts counter' do
    counter = user.posts_counter
    subject.save
    expect(user.posts_counter).to eq(counter + 1)
  end
end
