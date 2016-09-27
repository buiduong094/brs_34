class RequestsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = current_user.requests.ransack params[:q]
    @requests = (@q.result.order created_at: :desc).page(params[:page])
      .per Settings.requests.per_page
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t "flash.user_requests.create_success"
      redirect_to requests_path
    else
      render :new
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t "flash.user_requests.destroy_success"
    else
      flash[:error] = t "flash.user_requests.destroy_fail"
    end
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit :user_id, :book_name
  end
end
