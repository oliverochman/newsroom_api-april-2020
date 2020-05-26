# frozen_string_literal: true

RSpec.describe 'Api::Articles :index', type: :request do
  let!(:article) { 3.times { create(:article, :with_image) } }

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
      it ':title' do
        expect(response_json['articles'][0]).to have_key 'title'
      end

      it ':category' do
        expect(response_json['articles'][0]).to have_key 'category'
      end

      it ':created_at' do
        expect(response_json['articles'][0]).to have_key 'published_at'
      end

      it ':image' do
        expect(response_json['articles'][0]).to have_key 'image'
      end
    end
  end
end
