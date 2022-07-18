require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  Post.destroy_all
  User.destroy_all
  it 'can see the post\'s title.' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('post1')
  end
  it 'can see who wrote the post' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('henry')
  end
  it 'can see how many comments it has' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    Comment.create(text: 'comment1', user:, post:)
    Comment.create(text: 'comment2', user:, post:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'can see how many likes it has' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    Like.create(user:, post:)
    Like.create(user:, post:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'can see the post body' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('text1')
  end
  it 'can see the username of each commentor' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    Comment.create(text: 'comment1', user:, post:)
    Comment.create(text: 'comment2', user:, post:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('henry')
  end
  it 'can see the comment each commentor left' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', user:)
    Comment.create(text: 'comment1', user:, post:)
    Comment.create(text: 'comment2', user:, post:)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
  end
end
