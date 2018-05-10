class LessonsController < ApplicationController
    respond_to :js
    def create
        @lesson = Lesson.create(name: params[:name], section_id: params[:section_id])
        if @lesson.save
            @lessons = Section.find(params[:section_id]).lessons
        end
    end

    def edit
        @lesson = Lesson.find(params[:id])
        @blocks = @lesson.blocks
        @block = Block.new
    end

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
    end
end
