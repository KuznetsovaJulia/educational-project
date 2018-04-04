class Categories::CoursesController < ApplicationController

    def index
        @courses = Course.find_by_category_id(params[:category_id])
    end
end