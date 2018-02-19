class RecordingsController < ApplicationController
    before_action :authenticate_user!

    def create
        @location = location.find(params[:location])
        @recording = @location.recordings.create(recording_param)
        @recording.save 
        redirect_to location_path(@location)
    end

    private
  def recording_param
     #params.require(:post).permit(:title, :body)
     params.require(:recording).permit(:status, :temp, :location) 
  end
end
