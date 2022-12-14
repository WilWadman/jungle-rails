class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @productscount = Product.count params[:id]
    @categoriescount = Category.count 
  end
end
