require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }

  it { should validate_uniqueness_of(:title) }

  context 'when valid image_url' do
    let(:product) { build(:product) }
    valid_image_url = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif] 

    valid_image_url.each do |image_url|
      it "#{image_url} should be valid" do
        product.image_url = image_url

        expect(product.valid?).to be_truthy
      end
    end
  end

  context 'when invalid image_url' do
    let(:product) { build(:product) }
    valid_image_url = %w[fred.doc fred.gif/more fred.gif.more]

    valid_image_url.each do |image_url|
      it "#{image_url} should be invalid" do
        product.image_url = image_url

        expect(product.valid?).to be_falsy
      end
    end
  end
end
