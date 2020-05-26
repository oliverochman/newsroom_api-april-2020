# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'this is title' }
    body { 'this is body' }
    category { 'sport' }
    trait :with_image do
      image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'img.jpeg'), 'image/jpeg') }
    end
  end
end
