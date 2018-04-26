class SubscriptionsController < ApplicationController
  def index
    @subscriptions = current_user.courses
  end

  def show; end

  def create
    course = Course.find(params[:id])
    current_user.subscribe(course)
  end

  def destroy; end
end
