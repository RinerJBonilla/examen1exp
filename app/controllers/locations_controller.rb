class LocationsController < ApplicationController
    before_action :find_location, only: [:edit, :update, :show, :delete]

    def index
        @locations = Location.all
      end
    
      def new
        @location = Location.new
      end
    
      def create
        @location = Location.new(location_params)
        @Location.save

        redirect_to @location
      end
    
      def edit
        @location = Location.find(params[:id])
      end
    
      def update
        if @location.update_attributes(location_params)
          flash[:notice] = "Successfully updated location!"
          redirect_to location_path(@location)
        else
          flash[:alert] = "Error updating location!"
          render :edit
        end
      end
    
      def show
      end
    
      def destroy
        if @location.destroy
          flash[:notice] = "Successfully deleted location!"
          redirect_to location_path
        else
          flash[:alert] = "Error updating location!"
        end
      end
    
      private
    
      def location_params
        params.require(:location).permit(:name)
      end
    
      def find_location
        @location = Location.find(params[:id])
      end
end
