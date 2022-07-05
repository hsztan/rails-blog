require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Henry', photo: 'https://www.google.com/', bio: 'Nice and smart guy')
  post = Post.create(user:, title: 'Post title', text: 'Post text')

  subject { Like.new(user:, post:) }

  before { subject.save }

  it 'should increment post likes counter' do
    subject { Like.new(user:, post:) }
    counter = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(counter + 1)
  end
end
