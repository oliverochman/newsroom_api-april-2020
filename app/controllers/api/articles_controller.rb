# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article, each_serializer: Article::IndexSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: Article::ShowSerializer
  rescue StandardError
    render json: { message: "Article with id #{params[:id]} could not be found." }, status: :not_found
  end

  def create
    article = Article.create(article_params)
    if article.persisted?
      render json: { id: article.id, message: 'Article successfully created!' }
    else
      error = "#{article.errors.first[0].to_s.capitalize} #{article.errors.first[1]}"
      render json: { message: error }, status: 400
    end
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end
