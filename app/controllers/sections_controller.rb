class SectionsController < ApplicationController
  respond_to :js
  def new; end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.create(name: params[:name], course_id: params[:course_id])
    if @section.save
      @sections = Course.find(params[:course_id]).sections
    end
  end

  def edit
    @section = Section.find(params[:id])
    @lesson = Lesson.new
    @lessons = @section.lessons

  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
  end
end
