class LocationsController < ApplicationController
    before_action :find_location, only: [:edit, :update, :show, :delete]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @locations = Location.all
      end
    
      def new
        @location = Location.new
      end
    
      def create
        @location = Location.new(location_params)
        @location.save

        redirect_to @location
      end
    
      def edit
      end
    
      def update
        if @location.update(location_params)
          flash[:notice] = "Successfully updated location!"
          redirect_to @location
        else
          flash[:alert] = "Error updating location!"
          render :edit
        end
      end
    
      def show
      end
    
      def destroy
        @location.destroy
        redirect_to locations_path
      end
    
      private
    
      def location_params
        params.require(:location).permit(:name)
      end
    
      def find_location
        @location = Location.find(params[:id])
      end
end
