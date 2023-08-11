require 'rails_helper'
require 'faker'

RSpec.describe 'Balances', type: :request do
  describe 'GET /balances/:balance_id/items' do
    before(:each) do
      @osman = User.create!(name: Faker::Name.unique.name,
                            email: Faker::Internet.email,
                            password: '123456', password_confirmation: '123456')
      @grocery = Balance.create(name: 'grocery', icon: 'url', author: @osman)
    end

    it 'renders the home page' do
      get '/'
      expect(response.status).to eq(302)
    end

    describe 'Login ability' do
      before(:each) do
        sign_in @osman
        get '/'
      end

      it 'renders the balance_sheet page' do
        expect(response.status).to eq(200)
        expect(response.body).to include('BALANCE SHEET')
      end

      it 'renders the balance_sheet category' do
        expect(response.body).to include('grocery')
      end

      it 'renders the balance_sheet button' do
        expect(response.body).to include('+')
      end

      it 'renders the new balance details page' do
        get balance_path(@grocery.id)
        expect(response.status).to eq(200)
        expect(response.body).to include('grocery')
      end
    end
  end
end
