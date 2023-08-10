require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Check user validity' do
    subject do
      User.new(name: Faker::Name.unique.name,
               email: Faker::Internet.email,
               password: '1234567', password_confirmation: '1234567')
    end
  end

  before { subject.save }

  it 'should have a valid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a valid email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
