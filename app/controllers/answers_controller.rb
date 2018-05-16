class AnswersController < ApplicationController
    respond_to :js

    def create
        @answer = Answer.create(content: params[:content],
                                    practice_id: params[:practice_id],
                                    correct: params[:correct])

        if @answer.save
            @answers = Practice.find(params[:practice_id]).answers


        end
    end


end
