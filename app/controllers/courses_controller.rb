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
  def destroy
      @course = Course.find(params[:id])
      if @course.subscriptions.count>5
          redirect_to(root_path, :notice => 'Курс не был удален. Подписок более пяти.')
      else
          @id= @course.id
          @course.destroy
          redirect_to(root_path, :notice => "Курс ''#{Course.with_deleted.find(@id).name}'' был успешно удален.")
      end
  end
end
