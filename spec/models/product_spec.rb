require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'will save a product with all four fields set' do
      @category = Category.create(name: "First Category")
      @product = Product.new(name: "First Product", price: 250, quantity: 12, category: @category)

      expect(@product.save).to be(true)

      @product.errors.full_messages.each do |error_message|
        puts error_message
    end
  end

   

    it 'should have a name' do
      @category = Category.create(name: "First Category")
      @product = Product.new(name: "", price: 250, quantity: 12, category: @category)

      expect(@product.valid?).to be(false)
      expect(@product.errors.full_messages).to include("Name can't be blank")
  

    end

    

    it 'should have a price' do
      @category = Category.create(name: "First Category")
      @product = Product.new(name: "First Product", price: "", quantity: 12, category: @category)
    
      expect(@product.valid?).to be(false)
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

  

    it 'should have a quantity' do
      @category = Category.create(name: "First Category")
      @product = Product.new(name: "First Product", price: 250, quantity: nil, category: @category)

      expect(@product.valid?).to be(false)
  expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    

    it 'should have a category' do
      @category = Category.create(name: "First Category")
      @product = Product.new(name: "First Product", price: 250, quantity: 12, category: nil)
      
      expect(@product.valid?).to be(false)
      expect(@product.errors.full_messages).to include("Category can't be blank")

   
    end
  end

end
  





