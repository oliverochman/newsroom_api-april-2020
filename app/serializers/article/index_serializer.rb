# frozen_string_literal: true

class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :published_at, :image

  def published_at
    object.created_at.strftime('%F %R')
  end
end
