class UserCarsController < ApplicationController

    def edit
    
        @car = Car.find(params[:id])
        # render new.html.erb
    end

    def update
        
        @car = Car.find(params[:id])
    
        params[:car][:user_ids].each do |user_id| 
            UserCar.find_or_create_by(user_id: user_id, car: @car)
        end
        
        redirect_to car_path(@car)
    end

    def destroy

    end
    
    private

    def user_car_params
        params.require(:user_car).permit(:user_id, :car_id)
    end
end
