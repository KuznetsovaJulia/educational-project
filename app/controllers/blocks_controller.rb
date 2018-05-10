class BlocksController < ApplicationController
    respond_to :js

    def create
        @block = Block.create(theory: params[:theory], lesson_id: params[:lesson_id])
        if @block.save
            @blocks = Lesson.find(params[:lesson_id]).blocks
        end
    end

    def edit
        @block = Block.find(params[:id])
        @answer_types = Practice.answer_types
        @practice = Practice.new
    end

    def destroy
        @block = Block.find(params[:id])
        @block.destroy
    end
end