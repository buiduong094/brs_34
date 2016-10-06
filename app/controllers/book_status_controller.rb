class BookStatusController < ApplicationController
  load_and_authorize_resource

  def index
    @book_status = current_user.book_status.includes(:book)
      .page(params[:page]).per Settings.per_page
  end

  def create
    @book_status = current_user.book_status.build book_status_params
    if @book_status.save
      status = t "books.created_bookstatus_success"
    else
      status = t "books.created_bookstatus_error"
    end
    response_to_json status
  end

  def update
    if @book_status.update_attributes book_status_params
      status = t "books.updated_bookstatus_success"
    else
      status = t "books.updated_bookstatus_error"
    end
    response_to_json status
  end

  def destroy
    if @book_status.destroy
      status = t "books.destroy_bookstatus_success"
    else
      status = t "books.destroy_bookstatus_fail"
    end
    response_to_json status
  end

  private
  def book_status_params
    params.require(:book_status).permit :user_id, :book_id, :is_favourite,
      :reading_status
  end

  def response_to_json status
    respond_to do |format|
      format.json {
        render json: {book_status: @book_status.id, status: status}
      }
    end
  end
end
