class Courses::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_courses
    def create
        @course.likes.where(user_id: current_user.id).first_or_create
        redirect_to @course
    end
    def destroy
        @course.likes.where(user_id: current_user.id).destroy_all
        redirect_to @course

    end
    private
    def set_courses
        @course=Course.find(params[:course_id])
    end
end
