class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @categorization = Categorization.where(category_id: params[:category_id])
    @courses = @categorization.map do |categorization|
      Course.find(categorization.course_id)
    end
  end

  def show
    @course = Course.find(params[:id])
    @author = User.find(@course.author_id)
  end

  def edit; end

  def create
    @course = current_user.create_course(params[:name])
    create_categorizations if @course.save
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.might_be_deleted?
      redirect_to(root_path, notice: 'Курс не был удален. Подписок более пяти.')
    else
      @id = @course.id
      @course.destroy
      redirect_to(root_path, notice: "Курс ''#{Course.with_deleted.find(@id).name}'' был успешно удален.")
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
    @category_names = params[:category_names]
    @category_names.split.map do |name|
      @category = Category.find_by(name: name)
      Categorization.create(course_id: @course.id, category_id: @category.id) unless @category.nil?
    end
  end
end
