class CorrectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_writing

    def create
        @correction = @writing.corrections.create(correction_params)
        @correction.user = current_user

        if @correction.save
            flash[:notice] = "Correction has been created"
            redirect_to writing_path(@writing)
        else
            flash[:alert] = "Correction has not been created"
            redirect_to writing_path(@writing)
        end
    end

    def update
        @correction = @writing.corrections.find(params[:id])

        respond_to do |format|
            if @correction.update(correction_params)
                format.html { redirect_to writing_path(@writing), notice: "Correction has been updated" }
            else
                format.html { redirect_to writing_path(@writing), alert: "Correction was not updated" }
            end
        end
    end

    def destroy
        @correction = @writing.corrections.find(params[:id])
        @correction.destroy
        redirect_to writing_path(@writing)
    end

    private
    def set_writing
        @writing = Writing.find(params[:writing_id])
    end

    def correction_params
        params.require(:correction).permit(:body)
    end
end
