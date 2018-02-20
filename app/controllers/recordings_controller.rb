class RecordingsController < ApplicationController
    before_action :authenticate_user!

    def create
        @location = Location.find(params[:location])
        @recording = @location.recordings.build(recording_param)
        if @recording.save 
          redirect_to @location
        else
            render :new
        end    
    end
    def destroy
        @location = Location.find(params[:location])
        @recording = @location.recordings.find(params[:id])
        @recording.destroy
        redirect_to @location
      end

    def new
		@location = Location.find(params[:location])
		@recording = @location.recordings.build
	end

    private
  def recording_param
     params.require(:recording).permit(:status, :temp) 
  end
end
