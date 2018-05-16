class PracticesController < ApplicationController
    respond_to :js
    def show
        @practice=Practice.find(params[:id])
    end
    def create
        @practice = Practice.create(question: params[:question],
                                    block_id: params[:block_id],
                                    answer_type: params[:answer_type])
        Rails.logger.debug @practice.valid?

        if @practice.save
            @practices = Block.find(params[:block_id]).practices
            @answer_type = @practice.answer_type

        end
    end

    def edit
        @practices = Block.find(params[:block_id]).practices
        @answer=Answer.new
    end

    def destroy
        @practice = Practice.find(params[:id])
        @practice.destroy
    end
    def update
        @practice=Practice.find(params[:id]).update(practice_params)
    end
    private
    def practice_params
        params.require(:practice).permit(:question,:block_id)
    end

end
