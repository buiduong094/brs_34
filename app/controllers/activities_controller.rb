class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").
      page(params[:page]).per Settings.admin.books.per_page
  end
end
