require 'rails_helper'

RSpec.describe 'Login', type: :system do
  it 'the username and password inputs and the "Submit" button' do # doesn't work
    visit '/login'
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_button('Submit')
  end

  it 'get a detailed error when clicking the submit button without filling in the usernamne and password' do
    visit '/login'
    fill_in 'username', with: ''
    fill_in 'password', with: ''
    click_button 'Submit'
    expect(page).to have_content('Invalid username or password')
  end

  it 'get a detailed error when clicking the submit button after filling with incorrect data' do
    visit '/login'
    fill_in 'username', with: 'henry'
    fill_in 'password', with: 'henry'
    click_button 'Submit'
    expect(page).to have_content('Invalid username or password')
  end

  it 'redirected to the root page after filling in the username and password with correct data' do
    visit '/login'
    fill_in 'username', with: 'henry'
    fill_in 'password', with: 'password1234'
    click_button 'Submit'
    expect(page).to have_current_path('/')
  end
end
