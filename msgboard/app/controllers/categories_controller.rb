class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path
    else
      flash[:errorcategory] = "Please enter category!"
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end