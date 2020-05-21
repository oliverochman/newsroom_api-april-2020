# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article, each_serializer: Article::IndexSerializer
  end

  def show
    begin
      article = Article.find(params[:id])
      render json: article, serializer: Article::ShowSerializer
    rescue
      render json: { message: "Article with id #{params[:id]} could not be found." }, status: :not_found
    end
  end
end
