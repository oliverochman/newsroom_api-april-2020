# frozen_string_literal: true

class Api::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: article
  end
end
