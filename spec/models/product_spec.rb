require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it 'validates the existence of the name of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = nil
      @product.price_cents = 2999
      @product.quantity = 2
      @product.category_id = @category.id
      # using the be_valid to check if the input of a variable is valid based on it's model validation rules
      expect(@product).not_to be_valid
      # to test if a particular error message exists pertaining to the nil input we made previously
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates the existence of the price of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price_cents = nil
      @product.quantity = 2
      @product.category_id = @category.id
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates the existence of the quantity of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price_cents = 2999
      @product.quantity = nil
      @product.category_id = @category.id
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates the existence of the category_id of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price_cents = 2999
      @product.quantity = 2
      @product.category_id = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'validates a valid input' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price_cents = 2999
      @product.quantity = 2
      @product.category_id = @category.id
      expect(@product).to be_valid
    end
  end
end
