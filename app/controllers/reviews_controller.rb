class ReviewsController < ApplicationController
  load_and_authorize_resource

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      status = t "books.created_review_success"
    else
      status = t "books.created_review_fails"
    end
    response_to_json status
  end

  def update
    if @review.update_attributes review_params
      status = t "books.updated_review_success"
    else
      status = t "books.updated_review_fails"
    end
    response_to_json status
  end

  def destroy
    book = @review.book
    if @review.destroy
      status = t "books.destroy_review_success"
    else
      status = t "books.destroy_review_fail"
    end
    if star = book.rate_average
      star = star.round(Settings.admin.books.round_rate_average)
    end
    respond_to do |format|
      format.json {render json: {
        status: status, star_rewview_book: star
      }}
    end
  end

  private
  def review_params
    params.require(:review).permit :user_id, :book_id, :rating, :content
  end

  def response_to_json status
    respond_to do |format|
      format.json {render json: {
        content: render_to_string({
          partial: "reviews/review", object: @review, formats: "html",
          layout: false}), review_id: @review.id,
        star_rewview_book: @review.book.rate_average
          .round(Settings.admin.books.round_rate_average), status: status
      }}
    end
  end
end
