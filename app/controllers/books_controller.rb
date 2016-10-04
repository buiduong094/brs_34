class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Book.search params[:q]
    @books = @search.result.includes(:category).page(params[:page]).per Settings.per_page
  end

  def show
    @reviews = (@book.reviews.order created_at: :desc).includes(:user)
      .page(params[:page]).per Settings.per_page
    @review = Review.find_by book_id: @book.id, user_id: current_user.id
    if @review.nil?
      @review = current_user.reviews.build
      @button = t "books.add_review"
    else
      @button = t "books.update_review"
    end
    @book_status = BookStatus.find_by book_id: @book.id, user_id: current_user.id
    if @book_status.nil?
      @book_status = BookStatus.new
    end
  end
end
