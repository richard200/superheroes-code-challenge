class PowersController < ApplicationController
    def index 
        power = Powers.all 
        render json: power, status: :success
    end

    def show 
        power = Powers.find_by(id: params[:id])
        if power 
            render json: power, status: :success
        else 
            render json: {message: 'Power not found'}, status: :not_found
        end
    end

    def update 
        power = Powers.find_by(id: params[:id])
        if power
        power.update!(power_params)
        render json: power, {message: 'Updated description'}
        else 
            render json: {message: 'Power not found'}, status: :not_found
        else 
            render json: {message: 'validation errors'}, status: 404
        end
        end

    end

    private 
    def power_params
        params.permit(:name, :description)
    end
end
