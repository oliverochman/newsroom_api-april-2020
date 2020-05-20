require 'rails_helper'

RSpec.describe "Api::Articles", type: :request do
  let!(:article) { 3.times {create(:article) } }

  describe 'GET /api/articles' do
    before do
      get '/api/articles'
    end

    it 'has a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'has returns all articles' do
      expect(response_json['articles'].length).to eq 3
    end

    describe 'response has keys' do
      it 'has key :title' do
        expect(response_json['articles'][0]).to have_key "title"
      end
    end
  end
end
