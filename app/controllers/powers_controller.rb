class PowersController < ApplicationController
    def index 
        power = Power.all 
        render json: power, status: 200
    end

    def show 
        power = Power.find_by(id: params[:id])
        if power 
            render json: power, status: :success
        else 
            render json: {error: 'Power not found'}, status: :not_found
        end
    end

    def update 
        power = Power.find_by(id: params[:id])
        if power
        power.update!(power_params)
        render json: power
        else 
            render json: {error: 'Power not found'}, status: :not_found
        end

    end

    private 
    def power_params
        params.permit(:name, :description)
    end
end
