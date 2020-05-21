# frozen_string_literal: true

RSpec.describe 'Api::Articles :show', type: :request do
  let!(:article) { create(:article) }
  
  describe 'GET /api/articles/:id' do
    before do
      article = Article.first
      get "/api/articles/#{article.id}"
    end

    it 'has a 200 response' do
      expect(response).to have_http_status 200
    end

    describe 'response has keys' do
      it ':title' do
        expect(response_json['article']).to have_key 'title'
      end

      it ':body' do
        expect(response_json['article']).to have_key 'body'
      end
    end
  end

  describe 'GET /api/articles/:id to non-existing id' do
    before do
      get '/api/articles/1000002'
    end

    it 'has a 404 response' do
      expect(response).to have_http_status 404
    end

    it 'responds with error message' do
      expect(response_json['message']).to eq 'Article with id 1000002 could not be found.'
    end
  end
end
