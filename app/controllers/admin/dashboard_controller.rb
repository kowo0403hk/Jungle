class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']

  def show
    products = Product.all.count
    categories = Category.all.count
    @all_count = {categories:, products:}
    # we do all the necessary search in the backend first, then put them into a hash so that the front end can iterate through it for table rendering
  end
end
