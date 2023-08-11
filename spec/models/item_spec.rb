require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    @osman = User.create!(name: Faker::Name.unique.name,
                          email: Faker::Internet.email,
                          password: '123456', password_confirmation: '123456')
  end

  subject { Item.new(name: 'Sugar', amount: 100, auhtor: @osman) }

  before { subject.save }

  describe 'Check Items Presence' do
    it 'should check valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check valid amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of to be saved' do
      expect(subject).to be_valid
    end
  end
end
