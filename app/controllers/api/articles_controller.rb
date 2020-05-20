# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    @article = Article.all
    render json: @article
    # each_serializer: ArticleSerializer
  end

  #   def create_json_response(articles)
  #     { articles: ArticleSerializer.new(articles) }
  #   end
end
