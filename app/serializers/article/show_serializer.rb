# frozen_string_literal: true

class Article::ShowSerializer < ActiveModel::Serializer

  attributes :id, :title, :body, :premium, :image
  
  def body
    object.premium && current_user.nil? ? object.body[0..99] : object.body
  end

end
