class PracticesController < ApplicationController
    respond_to :js
    def create
        @practice = Practice.create(question: params[:question],
                                    block_id: params[:block_id],
                                    answer_type: params[:answer_type])
        Rails.logger.debug @practice.valid?

        if @practice.save
            @practices = Block.find(params[:block_id]).practices
        end
    end

    def edit
    end

    def destroy
        @practice = Practice.find(params[:id])
        @practice.destroy
    end
end
