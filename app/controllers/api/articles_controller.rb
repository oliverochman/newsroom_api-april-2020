# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article
  end

  def show
    begin
      articlfe = Article.find(params[:id])
      render json: articlfe
    rescue
      render json: { message: "Article with id #{params[:id]} could not be found." }, status: :not_found
    end
  end
end
