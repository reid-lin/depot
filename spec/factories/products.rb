# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { Faker::Book.title }
    description { Faker::Books::Lovecraft.paragraphs }
    image_url { nil }
    price { 0.01 }
  end
end
