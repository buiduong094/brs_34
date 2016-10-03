class Admin::RequestsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Request.ransack params[:q]
    @requests = (@q.result.includes(:user).order created_at: :desc)
      .page(params[:page]).per Settings.requests.per_page
  end

  def update
    @request.status = params[:status].to_i
    if @request.save
      SendEmailWorker.perform_async @request.id
      respond_to do |format|
        format.html
        format.json {
          render json: {
            status: @request.status
          }
        }
      end
    else
      respond_to do |format|
        format.html
        format.json {render json: {
          status: :fail, content: @requests.errors.messages[:content]
        }}
      end
    end
  end

  private
  def request_params
    params.require(:request).permit :user_id, :book_name, :status
  end
end
