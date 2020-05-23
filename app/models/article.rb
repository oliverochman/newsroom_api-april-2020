# frozen_string_literal: true

class Article < ApplicationRecord
  validates_presence_of :title, :body, :category
  enum category: %i[sports politics economy world entertainment]
end
