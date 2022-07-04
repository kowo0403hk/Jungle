require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it 'validates the existence of the name of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price = 2999
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save
      expect(@product.name).to be_present
    end

    it 'validates the existence of the price of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price = 2999
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save
      expect(@product.price).to be_present
    end

    it 'validates the existence of the quantity of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price = 2999
      @product.quantity = 0
      @product.category_id = @category.id
      @product.save
      expect(@product.quantity).to be_present
    end

    it 'validates the existence of the category_id of a product' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = "Test_Product"
      @product.price = 2999
      @product.quantity = 2
      @product.category_id = @category.id
      @product.save
      expect(@product.category_id).to be_present
    end

    it ' provides error message will be generated if the required fields are missing' do
      @category = Category.create(name:'Test_Category')
      @product = Product.new
      @product.name = nil
      @product.price = nil
      @product.quantity = nil
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages).to be_present
    end
  end
end
