class CoursesController < ApplicationController
  def new
  end
  def index
      @categorization = Categorization.where(category_id: params[:category_id])
      @courses = @categorization.map { |categorization|
          Course.find(categorization.course_id)
      }
  end
  def show
     @course = Course.find(params[:id])
     @author = User.find(@course.author_id)
  end
  def edit
  end
end
