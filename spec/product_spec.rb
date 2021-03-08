require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :all do
      @category = Category.new(name: "Test Category")
    end

    before :each do
      @product = Product.new(name: 'Test', price_cents: 10000, quantity: 1, category: @category)
    end

    it "Will successfully save" do
      expect(@product).to be_valid
    end

    it "Should have a name" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq('Name can\'t be blank')
    end

    it "Should have a price" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq('Price cents is not a number')
    end

    it "Should have a quantity" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq('Quantity can\'t be blank')
    end

    it "Should have a category" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages[0]).to eq('Category can\'t be blank')
    end

  end
end