require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Henry', photo: 'https://www.google.com/', bio: 'Nice and smart guy') }

  before { subject.save }

  it 'title should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
