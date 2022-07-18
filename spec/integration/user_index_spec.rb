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
end