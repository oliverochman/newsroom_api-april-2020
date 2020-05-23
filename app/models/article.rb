# frozen_string_literal: true

class Article < ApplicationRecord
  validates_presence_of :title, :body, :category
  enum category: %i[other sport local politics economy world entertainment]
end
