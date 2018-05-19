class CoursesController < ApplicationController
  respond_to :js

  def new
    @course = Course.new
    @courses=current_user.courses
  end

  def index
    search_method = params['Commit']
    input_value   = params[:q]
    case search_method
    when 'Search by category'
      @courses = Course.find_by_category_name(params[:q])
    end
    # @search = Course.search(params[:q])
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @author = User.find(@course.author_id)
  end

  def edit
    @course = Course.find(params[:id])
    @sections = @course.sections
    @section = Section.new
  end

  def create
    @course = current_user.create_course(params[:name], params[:description])
    if @course.save
      create_categorizations
      @courses = current_user.courses
    end
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

  private

  def course_params
    params.require(:course).permit(:name)
  end

  def create_categorizations
    @category_ids = params[:category_ids]
    @category_ids = @category_ids.split.delete_if { |el| el == '' || el == 'on' }
    @category_ids.each do |id|
      puts "#{id} METHOD CC"
      @category = Category.find(id)
      Categorization.create(course_id: @course.id, category_id: @category.id)
    end
  end
end
