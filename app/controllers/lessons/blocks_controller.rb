class Lessons::BlocksController < ApplicationController
    attr_reader :lesson
    before_action :set_lesson
    respond_to :js
    def create
        @block = Block.create(theory: params[:theory], lesson_id: lesson.id)
        if @block.save
            @blocks = lesson.blocks
            @lesson=lesson
        end
    end
    def destroy
        block = lesson.blocks.find(params[:id])
        if block
            block.destroy
            @blocks = lesson.blocks
        else
            raise ActiveRecord::RecordNotFound
        end
    end

    private
    def set_lesson
        @lesson =  Lesson.find(params[:lesson_id])
    end

end