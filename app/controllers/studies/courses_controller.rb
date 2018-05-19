class Studies::CoursesController < ApplicationController
    attr_reader :study
    before_action :set_study

    def show
        @course=Course.find(@study.course_id)

    end

    private
    def set_study
        @study =  Study.find(params[:id])
    end

end