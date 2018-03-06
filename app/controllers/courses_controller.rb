class CoursesController < ApplicationController
  def new
  end
  def index
    @courses = Course.all
  end
  def show
    @course = Course.find(params[:id])
  end
  def edit
  end
end
