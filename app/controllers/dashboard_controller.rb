class DashboardController < ApplicationController
  def index
      @courses = current_user.courses
    @categories = Category.all
    @subscriptions = current_user.subscriptions
      @search=Course.search(params[:q])
      @courses=@search.result
  end

end
