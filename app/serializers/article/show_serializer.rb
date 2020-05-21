# frozen_string_literal: true

class Article::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
end
