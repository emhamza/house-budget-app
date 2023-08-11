require 'rails_helper'

RSpec.describe Balance, type: :model do
  before(:each) do
    @osman = User.create!(name: Faker::Name.unique.name,
                          email: Faker::Internet.email,
                          password: '123456', password_confirmation: '123456')
  end

  subject { Item.new(name: 'Grocery', amount: 232, author_id: @osman.id) }

  before { subject.save }

  describe 'Check Valid Balance' do
    it 'should check valid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check valid icon' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of to be saved' do
      expect(subject).to be_valid
    end
  end
end
