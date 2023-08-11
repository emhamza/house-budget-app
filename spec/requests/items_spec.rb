require 'rails_helper'

RSpec.describe 'Items Index', type: :request do
  describe 'GET /balances/:balance_id/items/new' do
    before(:each) do
      @osman = User.create!(name: Faker::Name.unique.name,
                            email: Faker::Internet.email,
                            password: '123456', password_confirmation: '123456')
      @sugar = Balance.create(name: 'Grocery', icon: 'url', author: @osman)
      @item = Item.create(name: 'Item', amount: 100)
    end

    describe 'render new page' do
      before(:each) do
        sign_in @osman
        get new_balance_item_path(@sugar)
      end

      it 'should render the new item page' do
        expect(response.status).to eq(200)
      end
    end
  end
end
