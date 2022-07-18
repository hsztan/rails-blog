require 'rails_helper'

RSpec.describe 'User index', type: :system do
    it 'displays the usernames of the users' do
        user1 = User.create(name: 'henry', photo: '', bio:'teacher from Poland')
        user2 = User.create(name: 'james', photo: '', bio:'teacher from Mexico')
        visit '/users'
        expect(page).to have_content('henry')
        expect(page).to have_content('james')
    end

    it 'displays profile photos of the users' do
        user1 = User.create(name: 'henry', photo: '', bio:'teacher from Poland')
        user2 = User.create(name: 'james', photo: '', bio:'teacher from Mexico')
        visit '/users'
        expect(page).to have_css('img')
    end

    it 'displays the number of posts of the users' do
        user1 = User.create(name: 'henry', photo: '', bio:'teacher from Poland')
        user2 = User.create(name: 'james', photo: '', bio:'teacher from Mexico')
        post1 = Post.create(title: 'post1', text: 'text1', user: user1)
        post2 = Post.create(title: 'post2', text: 'text2', user: user2)
        visit '/users'
        expect(page).to have_content('1')
        expect(page).to have_content('2')
    end

    it 'redirects to the user profile page when clicking the username' do
        user1 = User.create(name: 'henry', photo: '', bio:'teacher from Poland')
        user2 = User.create(name: 'james', photo: '', bio:'teacher from Mexico')
        post1 = Post.create(title: 'post1', text: 'text1', user: user1)
        post2 = Post.create(title: 'post2', text: 'text2', user: user2)
        visit '/users'
        click_link 'henry'
        expect(page).to have_current_path('/users/1')
    end
end