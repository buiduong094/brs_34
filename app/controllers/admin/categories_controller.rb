class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Category.ransack params[:q]
    @categories = @q.result.includes(:books).page(params[:page])
      .per Settings.per_page
  end

  def new
    @category = Category.new
    @button = t "admin.categories.add"
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "admin.categories.success"
      redirect_to admin_root_url
    else
      flash[:danger] = t "admin.categories.fail"
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "admin.categories.category_updated"
      redirect_to admin_categories_path
    else
      render :edit
      @button = t "admin.categories.update"
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t "admin.categories.delete"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
