require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Henry', photo: 'https://www.google.com/', bio: 'Nice and smart guy')
  post = Post.create(user:, title: 'Post title', text: 'Post text')

  subject { Comment.new(user:, post:, text: 'Comment text') }

  before { subject.save }

  it 'should increment post comments counter' do
    counter = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(counter + 1)
  end
end
