class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.users.destroy_success"
    else
      flash[:error] = t "admin.users.destroy_error"
    end
    redirect_to admin_users_url
  end
end
