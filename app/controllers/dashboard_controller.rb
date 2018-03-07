class DashboardController < ApplicationController
  def show
  end
  def index
      @course  = current_user.courses.build
      @made_courses = current_user.made_courses
      @my_subscriptions = current_user.my_subscriptions

  end
end
