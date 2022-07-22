require 'swagger_helper'
require 'rails_helper'

describe 'Blog Post API V1' do
  before(:each) do
    @user = User.create(email: 'donkey@donkey.com', password: 'Password', name: 'Donkey')
    @user.update(confirmed_at: Time.now)
    @user2 = User.new(email: 'horse@horse.com', password: 'Password', name: 'Horse')
    @password = 'Password'
  end

  path '/login' do
    post 'Login' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '201', 'Login Successful' do
        let(:user) { { user: { email: @user.email, password: @password } } }
        run_test!
      end
    end
  end


  path '/signup' do
    post 'Signup' do
      tags 'Signup'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
          name: { type: :string }
        },
        required: %w[email password password_confirmation name]
      }
      response '201', 'Signup Successful' do
        let(:user) { { user: { email: @user.email, password: @password, password_confirmation: @password, name: @user.name } } }
        run_test!
      end
    end
  end
end
