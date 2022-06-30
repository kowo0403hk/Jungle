class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']

  def index
    @categories = Category.find(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def created
    @category = Category.new(category_params)

    if @categoy.save
      redirect_to [:admin, :categories], notice: 'Category was successfully created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
