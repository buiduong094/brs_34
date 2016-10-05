class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page
  end

  def show
    @support = Supports::UserSupport.new(@user)
  end
end
