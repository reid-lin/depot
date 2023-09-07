# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  # allow_blank here is avoiding multiple error messages
  validates :image_url, allow_blank: true, format: {
    # with: %r{|.(gif|jpg|png)|z}i,
    with: /.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image'
  }
end
