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
    elsif article_params['title'].nil?
      render json: { message: "Title can't be empty" }, status: 400
    elsif article_params['body'].nil?
      render json: { message: "Body can't be empty" }, status: 400
    else
      render json: { message: 'Oops! Something went wrong' }, status: 500
    end
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end
