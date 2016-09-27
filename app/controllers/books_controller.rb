class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Book.search params[:q]
    @books = @search.result.includes(:category).page(params[:page]).per Settings.per_page
  end
end
