class DashboardController < ApplicationController
  def index
    @courses = current_user.courses
    @categories = Category.all
    @subscriptions = current_user.subscriptions
  end
end
