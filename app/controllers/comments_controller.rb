class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      SendEmailCommentOnReviewWorker.perform_async @comment.id
      respond_to do |format|
        format.json {
          render json: {
            content: render_to_string({
              partial: "comments/comment", object: @comment, formats: "html",
              layout: false}), status: :created
        }}
      end
    else
      begin
        respond_to do |format|
          format.json {
            render json: {
              status: :fail, content: @comment.errors.messages[:content]
          }}
        end
      rescue => ex
        flash[:danger] = t "flash.user_requests.create_fail"
        redirect_to :back
      end
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "flash.user_requests.destroy_success"
      respond_to do |format|
        format.js
      end
    else
      flash[:error] = t "flash.user_requests.destroy_fail"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
