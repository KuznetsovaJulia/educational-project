class CoursesController < ApplicationController
  def new
      @course = Course.new
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
  def create
      @course = Course.new(course_params)
      @course.author_id = current_user.id
      if @course.save
          create_categorizations
          redirect_to root_path
      else
          render :new
      end
  end
  def destroy
      @course = Course.find(params[:id])
      if @course.might_be_deleted?
          redirect_to(root_path, :notice => 'Курс не был удален. Подписок более пяти.')
      else
          @id= @course.id
          @course.destroy
          redirect_to(root_path, :notice => "Курс ''#{Course.with_deleted.find(@id).name}'' был успешно удален.")
      end
  end
  def like_count
      @course = Course.find(params[:id])
      render json: @course.likes.count
  end
  private
  def course_params
      params.require(:course).permit(:name)
  end
  def create_categorizations

      params[:category_ids].map do |id|
          @categorization = Categorization.new(course_id: @course.id,category_id:id)
          @categorization.save
      end
  end
end
