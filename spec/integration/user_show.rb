require 'rails_helper'

RSpec.describe 'User show', type: :system do
  User.destroy_all
  Post.destroy_all
  it 'shows the users profile picture' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    visit "/users/#{user.id}"
    expect(page).to have_css('img')
  end
  it 'displays the users name' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    visit "/users/#{user.id}"
    expect(page).to have_content('henry')
  end
  it 'displays the number of posts of the user' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', user:)
    Post.create(title: 'post2', text: 'text2', user:)
    visit "/users/#{user.id}"
    expect(page).to have_content('2')
  end
  it 'displays the first 3 posts of the user' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', user:)
    Post.create(title: 'post2', text: 'text2', user:)
    Post.create(title: 'post3', text: 'text3', user:)
    Post.create(title: 'post4', text: 'text4', user:)
    Post.create(title: 'post5', text: 'text5', user:)
    visit "/users/#{user.id}"
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
    expect(page).to have_content('post3')
    expect(page).to_not have_content('post4')
    expect(page).to_not have_content('post5')
  end
  it 'displays a button to see the rest of the posts' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', user:)
    Post.create(title: 'post2', text: 'text2', user:)
    Post.create(title: 'post3', text: 'text3', user:)
    Post.create(title: 'post4', text: 'text4', user:)
    Post.create(title: 'post5', text: 'text5', user:)
    visit "/users/#{user.id}"
    expect(page).to have_button('See all posts')
  end
  it 'redirects to the posts show page when clicking a users post' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', user:)
    Post.create(title: 'post2', text: 'text2', user:)
    Post.create(title: 'post3', text: 'text3', user:)
    Post.create(title: 'post4', text: 'text4', user:)
    Post.create(title: 'post5', text: 'text5', user:)
    visit "/users/#{user.id}"
    click_link 'post1'
    expect(page).to have_content('post1')
  end
  it 'redirects to the users posts index page when click see all posts' do
    user = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', user:)
    Post.create(title: 'post2', text: 'text2', user:)
    Post.create(title: 'post3', text: 'text3', user:)
    Post.create(title: 'post4', text: 'text4', user:)
    Post.create(title: 'post5', text: 'text5', user:)
    visit "/users/#{user.id}"
    click_button 'See all posts'
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
    expect(page).to have_content('post3')
    expect(page).to have_content('post4')
    expect(page).to have_content('post5')
  end
end
