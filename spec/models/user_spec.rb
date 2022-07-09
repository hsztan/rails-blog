require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Henry', photo: 'https://www.google.com/', bio: 'Nice and smart guy') }

  before { subject.save }

  it 'title should be present' do
    p subject
    expect(subject).to be_valid
  end

  it 'posts_counter should be integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it ':recent_posts should return 3 recent posts' do
    3.times { Post.create(user: subject, title: 'Post title', text: 'Post text') }
    expect(subject.recent_posts.size).to eq(3)
  end
end
