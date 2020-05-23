# frozen_string_literal: true

class Article::IndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :category
end
