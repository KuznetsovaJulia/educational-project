class LessonsController < ApplicationController
    respond_to :js
    def create
        @lesson = Lesson.create(name: params[:name], section_id: params[:section_id])
        if @lesson.save
            @lessons = Section.find(params[:section_id]).lessons
        end
    end

    def edit
        @lesson = Section.find(params[:id])

    end

    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
    end
end
