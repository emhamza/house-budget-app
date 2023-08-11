require 'rails_helper'

RSpec.describe 'For Home Index', type: :request do
  describe 'GET/index' do
    it 'should redirect ot the home page' do
      get '/home'
      expect(response.status).to eq(200)
      expect(response.body).to include('House Budget App')
      expect(response.body).to include('LOG IN')
    end
  end
end
